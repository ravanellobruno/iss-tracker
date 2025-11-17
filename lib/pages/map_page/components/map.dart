import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../components/blinking_marker.dart';

class Map extends StatelessWidget {
  final LatLng coords;
  final MapController mapController;
  final Function() onUserInteraction;

  const Map({
    super.key,
    required this.coords,
    required this.mapController,
    required this.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: coords,
          minZoom: 0,
          initialZoom: 5,
          onMapEvent: (evt) {
            final isUser =
                evt.source != MapEventSource.mapController &&
                evt.source != MapEventSource.nonRotatedSizeChange;

            if (isUser) {
              onUserInteraction();
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
                point: coords,
                width: 90,
                height: 90,
                child: const BlinkingMarker(
                  img: 'lib/assets/images/iss_pin.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
