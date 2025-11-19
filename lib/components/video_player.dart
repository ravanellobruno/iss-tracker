import 'package:flutter/material.dart';
import 'full_screen_video.dart';

class VideoPlayer extends StatelessWidget {
  final String videoId;

  const VideoPlayer({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final String thumbUrl = 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FullScreenVideo(videoId: videoId)),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              thumbUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              errorBuilder: (context, err, stackTrace) {
                return Image.asset(
                  'lib/assets/images/iss_vid.gif',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 48),
          ),
        ],
      ),
    );
  }
}
