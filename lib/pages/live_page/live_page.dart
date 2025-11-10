import 'package:flutter/material.dart';
import '../../utils/link_util.dart';
import '../../components/video_player.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Nos vídeos abaixo você terá a visão ao vivo da Terra diretamente das câmeras da ISS.',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 16),
              VideoPlayer(videoId: 'fO9e9jnhYK8'),
              const SizedBox(height: 24),
              VideoPlayer(videoId: 'j-b4xtjOrqo'),
              const SizedBox(height: 24),
              Center(
                child: InkWell(
                  onTap:
                      () => LinkUtil.openLink(
                        'https://www.youtube.com/results?search_query=iss+live+now',
                      ),
                  child: const Text(
                    'Clique aqui para mais vídeos',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
