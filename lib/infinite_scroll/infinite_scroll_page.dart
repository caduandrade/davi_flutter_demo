import 'package:davi_demo/infinite_scroll/infinite_scroll_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class InfiniteScrollPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    sections.widget((context) => const InfiniteScrollExample(),
        title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: 'lib/infinite_scroll/infinite_scroll_example.dart');
  }
}
