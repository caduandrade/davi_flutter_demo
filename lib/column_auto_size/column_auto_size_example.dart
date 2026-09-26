import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Product {
  Product(this.code, this.name, this.description, this.price);

  final String code;
  final String name;
  final String description;
  final double price;
}

class ColumnAutoSizeExample extends StatefulWidget {
  const ColumnAutoSizeExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ColumnAutoSizeExampleState();
}

class ColumnAutoSizeExampleState extends State<ColumnAutoSizeExample> {
  late DaviModel<Product> _model;

  @override
  void initState() {
    super.initState();

    List<Product> rows = [
      Product('K1', 'Keyboard', 'Mechanical keyboard with blue switches', 49.9),
      Product('M1', 'Mouse', 'Wireless mouse', 19.5),
      Product('W1', 'Webcam', 'Full HD webcam with built-in microphone', 64.5)
    ];

    //@demoflu_start:columns
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(
          name: 'Code',
          initialAutoSize: true,
          cellValue: (params) => params.data.code),
      DaviColumn(
          name: 'Name',
          initialAutoSize: true,
          cellValue: (params) => params.data.name),
      DaviColumn(
          name: 'Description',
          initialAutoSize: true,
          maxAutoSizeWidth: 200,
          cellOverflow: TextOverflow.ellipsis,
          cellValue: (params) => params.data.description),
      DaviColumn(
          name: 'Price',
          initialAutoSize: true,
          cellValue: (params) => params.data.price.toStringAsFixed(2))
    ]);
    //@demoflu_end:columns
  }

  void _addRows() {
    _model.addRows([
      Product('HS-2000', 'Wireless noise canceling headset',
          'Over-ear headset with active noise canceling', 189.9),
      Product('MN-27', 'Monitor 27" 4K', 'IPS monitor with USB-C', 1219)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Wrap(spacing: 8, runSpacing: 8, children: [
            ElevatedButton(
                onPressed: _addRows, child: const Text('Add longer rows')),
            //@demoflu_start:button
            ElevatedButton(
                onPressed: () => _model.autoSizeColumns(),
                child: const Text('Auto size columns')),
            //@demoflu_end:button
          ])),
      Expanded(child: Davi<Product>(_model))
    ]);
  }
}
