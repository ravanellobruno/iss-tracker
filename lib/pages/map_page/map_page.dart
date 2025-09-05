import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'components/blinking_marker.dart';
import 'components/bottom_data.dart'; // <- novo import
import '../../services/iss_service.dart';

class MapPage extends StatefulWidget {
  final String title;
  const MapPage({super.key, required this.title});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _coords;
  String? _address;
  final MapController _mapController = MapController();
  Timer? _timer;
  DateTime _lastReverseGeo = DateTime.fromMillisecondsSinceEpoch(0);
  bool _centralizes = true;
  bool _hasPosition = true;

  @override
  void initState() {
    super.initState();
    _getIssPosition();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 2), (t) {
      _getIssPosition();
    });
  }

  Future<void> _getIssPosition() async {
    final data = await IssService.getPosition();

    _hasPosition = data != null;

    final newLat = (data?['latitude'] as num).toDouble();
    final newLng = (data?['longitude'] as num).toDouble();
    final newPos = LatLng(newLat, newLng);

    if (!mounted) {
      return;
    }

    setState(() => _coords = newPos);

    if (_centralizes) {
      _centralize();
    }

    if (DateTime.now().difference(_lastReverseGeo) >
        const Duration(seconds: 10)) {
      _lastReverseGeo = DateTime.now();
      _updateAddress();
    }
  }

  void _centralize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final currentZoom = _mapController.camera.zoom;
      final zoom = currentZoom.isFinite ? currentZoom : 5.0;

      _mapController.move(_coords!, zoom);
    });
  }

  void _doCentralize() {
    setState(() => _centralizes = true);
    _centralize();
  }

  Future<void> _updateAddress() async {
    try {
      final placemarks = await placemarkFromCoordinates(
        _coords!.latitude,
        _coords!.longitude,
      );

      if (placemarks.isEmpty) {
        if (!mounted) {
          return;
        }

        setState(() => _address = null);

        return;
      }

      final p = placemarks.first;
      final parts = <String>[];

      final local = p.locality ?? '';
      final subArea = p.subAdministrativeArea ?? '';
      final area = p.administrativeArea ?? '';
      final country = p.country ?? '';

      if (local.trim().isNotEmpty) {
        parts.add(local.trim());
      } else if (subArea.trim().isNotEmpty) {
        parts.add(subArea.trim());
      }

      if (area.trim().isNotEmpty) {
        parts.add(area);
      }

      if (country.trim().isNotEmpty) {
        parts.add(country);
      }

      if (!mounted) {
        return;
      }

      setState(() => _address = parts.isEmpty ? null : parts.join(' - '));
    } catch (e) {
      if (!mounted) {
        return;
      }

      setState(() => _address = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_coords == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 217, 229, 237),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 12),
              Text('Obtendo posição da ISS...'),
            ],
          ),
        ),
      );
    }

    final point = _coords!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 229, 237),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _doCentralize,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: point,
                initialZoom: 5,
                onMapEvent: (evt) {
                  final isUser =
                      evt.source != MapEventSource.mapController &&
                      evt.source != MapEventSource.nonRotatedSizeChange;

                  if (isUser && _centralizes) {
                    setState(() => _centralizes = false);
                  }
                },
                interactionOptions: const InteractionOptions(
                  flags:
                      InteractiveFlag.drag |
                      InteractiveFlag.pinchZoom |
                      InteractiveFlag.doubleTapZoom,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.iss',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: point,
                      width: 100,
                      height: 100,
                      child: const BlinkingMarker(
                        img:
                            'https://upload.wikimedia.org/wikipedia/commons/f/f2/ISS_spacecraft_model_1.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          !_hasPosition
              ? Text('Sem coordenadas atualizadas no momento. Aguarde..')
              : BottomData(
                latitude: point.latitude,
                longitude: point.longitude,
                address: _address,
              ),
        ],
      ),
    );
  }
}
