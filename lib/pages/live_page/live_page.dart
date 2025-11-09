import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../utils/link_util.dart';

class LivePage extends StatelessWidget {
  final String title;
  final IconData icon;

  const LivePage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(icon), const SizedBox(width: 8), Text(title)],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'Nos vídeos abaixo você terá a visão ao vivo da Terra diretamente das câmeras da ISS.',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 12),
            _buildYoutubePlayer('fO9e9jnhYK8'),
            const SizedBox(height: 24),
            _buildYoutubePlayer('b_4mCNb826Y'),
            const SizedBox(height: 24),
            _buildYoutubePlayer('rwZq7Wp3fis'),
            const SizedBox(height: 12),
            InkWell(
              onTap:
                  () => LinkUtil.openLink(
                    'https://www.youtube.com/results?search_query=iss+live+now',
                  ),
              child: const Text(
                'Clique aqui para encontrar mais vídeos',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }

  Widget _buildYoutubePlayer(String videoId) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );

    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }
}
