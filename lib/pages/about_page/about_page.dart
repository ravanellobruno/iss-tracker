import 'package:flutter/material.dart';

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
              const Text(
                'Este aplicativo tem caráter educativo e é dedicado à Estação Espacial Internacional (ISS). Através dele, você pode acompanhar a localização em tempo real da ISS, assistir a transmissões ao vivo da Terra vistas diretamente da estação, conhecer a tripulação atual e explorar dados e curiosidades sobre essa impressionante estrutura que orbita o nosso planeta.',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 12),
              Center(
                child: Image.asset(
                  'lib/assets/images/iss_astronaut.gif',
                  height: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
