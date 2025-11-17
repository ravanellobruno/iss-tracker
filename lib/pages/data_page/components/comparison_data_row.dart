import 'package:flutter/material.dart';

class ComparisonDataRow {
  final String col1;
  final String col2;
  final String col3;

  const ComparisonDataRow(this.col1, this.col2, this.col3);

  TableRow toTableRow() {
    const padding = EdgeInsets.all(8);

    return TableRow(
      children: [
        Padding(padding: padding, child: Text(col1)),
        Padding(padding: padding, child: Text(col2)),
        Padding(padding: padding, child: Text(col3)),
      ],
    );
  }
}
