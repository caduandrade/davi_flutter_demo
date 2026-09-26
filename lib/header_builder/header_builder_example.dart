import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Product {
  Product(this.name, this.price, this.stock);

  final String name;
  final double price;
  final int stock;
}

class HeaderBuilderExample extends StatefulWidget {
  const HeaderBuilderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HeaderBuilderExampleState();
}

class HeaderBuilderExampleState extends State<HeaderBuilderExample> {
  late DaviModel<Product> _model;

  @override
  void initState() {
    super.initState();

    List<Product> rows = [
      Product('Keyboard', 49.9, 120),
      Product('Mouse', 19.5, 340),
      Product('Monitor', 219, 25),
      Product('Headset', 89.9, 60),
      Product('Webcam', 64.5, 0)
    ];

    //@demoflu_start:code
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      DaviColumn(
          name: 'Price',
          headerBuilder: (params) =>
              _twoLinesHeader(params.column.name!, 'USD'),
          cellValue: (params) => params.data.price.toStringAsFixed(2)),
      DaviColumn(
          name: 'Stock',
          headerBuilder: (params) =>
              _twoLinesHeader(params.column.name!, 'units'),
          cellValue: (params) => params.data.stock)
    ]);
    //@demoflu_end:code
  }

  //@demoflu_start:header
  Widget _twoLinesHeader(String name, String unit) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(unit,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54))
        ]);
  }
  //@demoflu_end:header

  @override
  Widget build(BuildContext context) {
    return Davi<Product>(_model);
  }
}
