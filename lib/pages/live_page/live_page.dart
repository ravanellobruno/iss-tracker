import 'package:flutter/material.dart';
import '../../components/link_text.dart';
import '../../components/video_player.dart';
import '../../components/intro_text.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const IntroText(
                text:
                    'No vídeo abaixo você terá a visão ao vivo da Terra diretamente das câmeras da ISS.',
              ),
              const SizedBox(height: 16),
              VideoPlayer(videoId: 'fO9e9jnhYK8'),
              const SizedBox(height: 24),
              Center(
                child: const LinkText(
                  text: 'Clique aqui para mais vídeos',
                  url:
                      'https://www.youtube.com/results?search_query=iss+live+now',
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
