import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfiniteScrollExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  final UniqueKey _tableKey = UniqueKey();
  EasyTableModel<String>? _model;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    List<String> rows = List.generate(30, (index) => 'value $index');
    _model = EasyTableModel<String>(
        rows: rows,
        columns: [EasyTableColumn(name: 'Value', stringValue: (row) => row)]);
  }

  @override
  Widget build(BuildContext context) {
    EasyTable table = EasyTable<String>(_model,
        key: _tableKey, onLastVisibleRowListener: _onLastVisibleRowListener);

    List<Widget> children = [Positioned.fill(key: _tableKey, child: table)];

    if (_loading) {
      children.add(const Positioned(
          child: LoadingWidget(), left: 0, right: 0, bottom: 0));
    }
    return Stack(children: children);
  }

  void _onLastVisibleRowListener(int lastVisibleRowIndex) {
    if (!_loading && lastVisibleRowIndex == _model!.visibleRowsLength - 1) {
      setState(() {
        _loading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _loading = false;
          List<String> newValues = List.generate(
              30, (index) => 'value ${_model!.visibleRowsLength + index}');
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
    return Container(
        child: const Text('Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
        padding: const EdgeInsets.all(8),
        color: Colors.grey.withAlpha(240));
  }
}
