import 'package:flutter/material.dart';
import 'comparison_data_row.dart';

class ComparisonData extends StatelessWidget {
  const ComparisonData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '✈️ Comparativo: ISS × Boeing 747',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            ComparisonDataRow(
              'Ambiente de operação',
              'Órbita terrestre (espaço)',
              'Atmosfera terrestre',
            ).toTableRow(),
            ComparisonDataRow(
              'Altitude de operação',
              '400 km',
              '9–13 km',
            ).toTableRow(),
            ComparisonDataRow(
              'Velocidade média',
              '28.000 km/h',
              '900 km/h',
            ).toTableRow(),
            ComparisonDataRow('Comprimento', '109 m', '70,6 m').toTableRow(),
            ComparisonDataRow('Envergadura', '73 m', '64,4 m').toTableRow(),
            ComparisonDataRow(
              'Peso',
              '420.000 kg',
              '400.000 kg (peso máx. de decolagem)',
            ).toTableRow(),
            ComparisonDataRow(
              'Tripulação',
              '6–7 pessoas',
              '14-20 (tripulação e pilotos)',
            ).toTableRow(),
            ComparisonDataRow(
              'Capacidade de passageiros',
              'Não aplicável',
              'Até 660 passageiros',
            ).toTableRow(),
            ComparisonDataRow(
              'Fonte de energia',
              'Painéis solares',
              'Combustível de aviação',
            ).toTableRow(),
            ComparisonDataRow(
              'Função principal',
              'Pesquisa científica e tecnológica',
              'Transporte aéreo',
            ).toTableRow(),
            ComparisonDataRow(
              'Tempo de permanência',
              'Contínua (24h/dia)',
              'Horas por voo',
            ).toTableRow(),
          ],
        ),
      ],
    );
  }
}
