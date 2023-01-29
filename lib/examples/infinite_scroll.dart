import 'dart:math';

import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class InfiniteScrollExample extends Example {
  InfiniteScrollExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/infinite_scroll.dart');
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class Value {
  factory Value(int index) {
    Random random = Random();
    return Value._(index, random.nextInt(99999).toRadixString(16),
        random.nextInt(99999).toRadixString(16));
  }

  Value._(this.index, this.random1, this.random2);

  final int index;
  final String random1;
  final String random2;
}

class MainWidgetState extends State<MainWidget> {
  DaviModel<Value>? _model;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    List<Value> rows = List.generate(30, (index) => Value(index));
    _model = DaviModel<Value>(rows: rows, columns: [
      DaviColumn(name: 'Index', intValue: (row) => row.index),
      DaviColumn(name: 'Random 1', stringValue: (row) => row.random1),
      DaviColumn(name: 'Random 2', stringValue: (row) => row.random2)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Value>(_model,
        lastRowWidget: const LoadingWidget(),
        onLastRowWidget: _onLastRowWidget);
  }

  void _onLastRowWidget(bool visible) {
    if (visible && !_loading) {
      setState(() {
        _loading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _loading = false;
          List<Value> newValues =
              List.generate(15, (index) => Value(_model!.rowsLength + index));
          _model!.addRows(newValues);
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
      SizedBox(width: 16, height: 16, child: CircularProgressIndicator()),
      SizedBox(width: 8),
      Text('Loading...',
          textAlign: TextAlign.center,
          style: TextStyle(fontStyle: FontStyle.italic))
    ]);
  }
}
