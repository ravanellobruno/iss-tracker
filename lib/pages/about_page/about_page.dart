import 'package:flutter/material.dart';
import '../../components/link_text.dart';
import '../../components/inline_image.dart';
import '../../components/intro_text.dart';

class AboutPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const AboutPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(icon), const SizedBox(width: 8), Text(title)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IntroText(
                text:
                    'Este aplicativo tem caráter educativo e é dedicado à Estação Espacial Internacional (ISS). Através dele, você pode acompanhar a localização em tempo real da ISS, assistir a transmissões ao vivo da Terra vistas diretamente da estação, conhecer a tripulação atual e explorar dados e curiosidades sobre essa impressionante estrutura que orbita o nosso planeta.',
              ),
              const SizedBox(height: 12),
              const Text('Créditos para:'),
              const LinkText(
                text: 'nasa.gov/international-space-station',
                url: 'https://www.nasa.gov/international-space-station/',
              ),
              const LinkText(
                text: 'whoisinspace.com',
                url: 'https://whoisinspace.com/',
              ),
              const LinkText(
                text: 'solarsystem.nasa.gov',
                url: 'https://solarsystem.nasa.gov/gltf_embed/2378/',
              ),
              const SizedBox(height: 12),
              const InlineImage(path: 'lib/assets/images/iss_vid.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
