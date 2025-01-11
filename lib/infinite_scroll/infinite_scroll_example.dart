import 'dart:math';

import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class InfiniteScrollExample extends StatefulWidget {
  const InfiniteScrollExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InfiniteScrollExampleState();
}

class Data {
  factory Data(int index) {
    Random random = Random();
    return Data._(index, random.nextInt(99999).toRadixString(16),
        random.nextInt(99999).toRadixString(16));
  }

  Data._(this.index, this.random1, this.random2);

  final int index;
  final String random1;
  final String random2;
}

class InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  late DaviModel<Data> _model;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    List<Data> rows = List.generate(30, (index) => Data(index));
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Index', cellValue: (params) => params.data.index),
      DaviColumn(name: 'Random 1', cellValue: (params) => params.data.random1),
      DaviColumn(name: 'Random 2', cellValue: (params) => params.data.random2)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Data>(_model,
        trailingWidget: const LoadingWidget(),
        onTrailingWidget: _onTrailingWidget);
  }

  void _onTrailingWidget(bool visible) {
    if (visible && !_loading) {
      setState(() {
        _loading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _loading = false;
          List<Data> newValues =
              List.generate(15, (index) => Data(_model.rowsLength + index));
          _model.addRows(newValues);
        });
      });
    }
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(color: Colors.black54)),
      SizedBox(width: 8),
      Text('Loading...',
          textAlign: TextAlign.center,
          style: TextStyle(fontStyle: FontStyle.italic))
    ]);
  }
}
