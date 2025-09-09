import 'package:flutter/material.dart';

class BottomData extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String? address;

  const BottomData({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latitude: ${latitude.toStringAsFixed(6)}  •  Longitude: ${longitude.toStringAsFixed(6)}',
            ),
            const SizedBox(height: 6),
            if (address != null)
              Row(
                children: [
                  const Icon(Icons.place, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      address ?? '',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
