import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'components/bottom_data.dart';
import '../../components/loading.dart';
import '../../services/iss_service.dart';
import 'components/map.dart';
import 'components/top_bar.dart';

class MapPage extends StatefulWidget {
  final String title;
  final IconData icon;
  const MapPage({super.key, required this.title, required this.icon});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _coords;
  String? _address;
  final MapController _mapController = MapController();
  Timer? _timer;
  bool _centralizes = true;
  bool _hasNewCoords = true;

  @override
  void initState() {
    super.initState();
    _updateIssPosition();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _centralize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _mapController.move(_coords!, _mapController.camera.zoom);
      }
    });
  }

  void _doCentralize() {
    setState(() => _centralizes = true);
    _centralize();
  }

  List<String> _addressParts(Placemark p) {
    final local = p.locality != null ? p.locality!.trim() : '';

    final subArea =
        p.subAdministrativeArea != null ? p.subAdministrativeArea!.trim() : '';

    final area =
        p.administrativeArea != null ? p.administrativeArea!.trim() : '';

    final country = p.country != null ? p.country!.trim() : '';

    final parts = <String>[];

    if (local.isNotEmpty) {
      parts.add(local);
    } else if (subArea.isNotEmpty) {
      parts.add(subArea);
    }

    if (area.isNotEmpty) {
      parts.add(area);
    }

    if (country.isNotEmpty) {
      parts.add(country);
    }

    return parts;
  }

  Future<void> _updateAddress() async {
    try {
      final place = await placemarkFromCoordinates(
        _coords!.latitude,
        _coords!.longitude,
      );

      if (place.isEmpty) {
        setState(() => _address = null);
        return;
      }

      final parts = _addressParts(place.first);

      if (mounted) {
        setState(() => _address = parts.isEmpty ? null : parts.join(' - '));
      }
    } catch (_) {
      if (mounted) {
        setState(() => _address = null);
      }
    }
  }

  void _updateView(LatLng coords) {
    setState(() => _coords = coords);

    if (_centralizes) {
      _centralize();
    }

    _updateAddress();
  }

  Future<void> _updateIssPosition() async {
    final data = await IssService.getPosition();
    _hasNewCoords = data != null;

    if (!_hasNewCoords) {
      return;
    }

    final lat = data?['latitude'];
    final lng = data?['longitude'];
    final coords = LatLng(lat, lng);

    if (mounted) {
      _updateView(coords);
    }
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 2), (t) {
      _updateIssPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: widget.title,
        icon: widget.icon,
        onCentralize: _doCentralize,
      ),
      body:
          _coords == null
              ? const Loading()
              : Column(
                children: [
                  Map(
                    coords: _coords!,
                    mapController: _mapController,
                    onUserInteraction: () {
                      setState(() => _centralizes = false);
                    },
                  ),
                  !_hasNewCoords
                      ? const Text(
                        'Sem coordenadas atualizadas no momento. Aguarde..',
                      )
                      : BottomData(
                        latitude: _coords!.latitude,
                        longitude: _coords!.longitude,
                        address: _address,
                      ),
                ],
              ),
    );
  }
}
