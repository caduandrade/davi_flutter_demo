import 'package:davi_demo/infinite_scroll/infinite_scroll_builder_example.dart';
import 'package:davi_demo/infinite_scroll/infinite_scroll_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class InfiniteScrollPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    sections.heading('Model mode');

    sections.text(
        text: 'New rows are added to the model when the trailing widget'
            ' becomes visible.');

    sections.widget((context) => const InfiniteScrollExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: 'lib/infinite_scroll/infinite_scroll_example.dart');

    sections.heading('Builder mode');

    sections.text(
        text: 'New rows are appended to a new list, and the table is rebuilt'
            ' with it when the trailing widget becomes visible.');

    sections.widget((context) => const InfiniteScrollBuilderExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(
          file: 'lib/infinite_scroll/infinite_scroll_builder_example.dart');
  }
}
