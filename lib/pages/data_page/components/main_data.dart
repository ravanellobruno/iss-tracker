import 'package:flutter/material.dart';
import 'main_data_row.dart';

class MainData extends StatelessWidget {
  const MainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '🛰️ Principais dados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        MainDataRow(
          label: 'Início da construção:',
          value: ' 1998',
          description:
              'O primeiro módulo (Zarya) foi lançado em novembro de 1998, marcando o início oficial da montagem da ISS.',
        ),
        MainDataRow(
          label: 'Primeiro módulo lançado:',
          value: ' Zarya (Rússia)',
          description:
              'O módulo Zarya (FGB) foi o primeiro componente da ISS, lançado pela Rússia em novembro de 1998.',
        ),
        MainDataRow(
          label: 'Tripulação permanente desde:',
          value: ' Novembro de 2000',
          description:
              'A ISS passou a ter ocupação contínua a partir da Expedição 1, que chegou em novembro de 2000.',
        ),
        MainDataRow(
          label: 'Altura da órbita:',
          value: ' 400 km acima da Terra',
          description:
              'A ISS orbita normalmente entre 400 e 420 km de altitude, com ajustes periódicos para manter a órbita.',
        ),
        MainDataRow(
          label: 'Velocidade orbital:',
          value: ' 28.000 km/h',
          description:
              'Essa é a velocidade necessária para a ISS manter sua órbita estável ao redor da Terra.',
        ),
        MainDataRow(
          label: 'Tempo de uma volta:',
          value: ' 90 minutos',
          description:
              'A cada cerca de 90 a 93 minutos, a ISS completa uma órbita completa ao redor do planeta.',
        ),
        MainDataRow(
          label: 'Dimensões:',
          value: ' 109 m × 73 m × 20 m',
          description:
              'As dimensões incluem toda a estrutura da estação, especialmente os enormes painéis solares.',
        ),
        MainDataRow(
          label: 'Peso total:',
          value: ' 420 toneladas',
          description:
              'O peso varia conforme módulos e equipamentos, podendo chegar a cerca de 450 toneladas.',
        ),
        MainDataRow(
          label: 'Volume habitável:',
          value: ' 388 m³',
          description:
              'Esse é o volume pressurizado interno disponível para os astronautas viverem e trabalharem.',
        ),
        MainDataRow(
          label: 'Tripulação média:',
          value: ' 6 a 7 astronautas',
          description:
              'A ISS opera normalmente com seis astronautas, podendo chegar a sete dependendo da missão.',
        ),
      ],
    );
  }
}
