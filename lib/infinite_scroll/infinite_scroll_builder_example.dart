import 'package:davi/davi.dart';
import 'package:davi_demo/infinite_scroll/infinite_scroll_example.dart';
import 'package:flutter/material.dart';

class InfiniteScrollBuilderExample extends StatefulWidget {
  const InfiniteScrollBuilderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InfiniteScrollBuilderExampleState();
}

class InfiniteScrollBuilderExampleState
    extends State<InfiniteScrollBuilderExample> {
  final DaviController<Data> _controller = DaviController(columns: [
    DaviColumn(name: 'Index', cellValue: (params) => params.data.index),
    DaviColumn(name: 'Random 1', cellValue: (params) => params.data.random1),
    DaviColumn(name: 'Random 2', cellValue: (params) => params.data.random2)
  ]);

  List<Data> _rows = List.generate(30, (index) => Data(index));
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Data>.builder(
        controller: _controller,
        rows: _rows,
        trailingWidget: const LoadingWidget(),
        onTrailingWidget: _onTrailingWidget);
  }

  void _onTrailingWidget(bool visible) {
    if (visible && !_loading) {
      _loading = true;
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _loading = false;
            List<Data> newValues =
                List.generate(15, (index) => Data(_rows.length + index));
            // A new list, instead of adding to the current one.
            _rows = [..._rows, ...newValues];
          });
        }
      });
    }
  }
}
