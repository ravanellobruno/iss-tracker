import 'package:flutter/material.dart';
import '../../components/inline_image.dart';
import '../../components/intro_text.dart';
import 'components/main_data.dart';
import 'components/comparison_data.dart';

class DataPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const DataPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(icon), const SizedBox(width: 8), Text(title)],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IntroText(
                text:
                    'A Estação Espacial Internacional (ISS) é um laboratório orbital e o maior objeto já construído pelo ser humano no espaço. '
                    'Ela orbita a Terra e serve como um centro de pesquisa científica, tecnológica e médica em ambiente de microgravidade. '
                    'A ISS é um projeto de cooperação internacional entre diversas agências espaciais: NASA (EUA), Roscosmos (Rússia), '
                    'ESA (Europa), JAXA (Japão) e CSA (Canadá).',
              ),
              const SizedBox(height: 8),
              const InlineImage(path: 'lib/assets/images/iss.jpg'),
              const SizedBox(height: 22),
              const MainData(),
              const SizedBox(height: 18),
              const InlineImage(path: 'lib/assets/images/iss_inside.jpg'),
              const SizedBox(height: 22),
              const ComparisonData(),
              const SizedBox(height: 20),
              const Text(
                'A ISS representa um marco na história da exploração espacial e da cooperação entre nações. '
                'Ela serve não apenas como um laboratório científico avançado, mas também como um símbolo de colaboração internacional '
                'e um passo essencial para futuras missões à Lua e a Marte.',
              ),
              const SizedBox(height: 12),
              const InlineImage(path: 'lib/assets/images/iss_astronaut.gif'),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
