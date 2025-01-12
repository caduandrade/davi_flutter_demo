import 'package:davi_demo/macros.dart';
import 'package:davi_demo/summary/summary_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class SummaryPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    String source = 'lib/summary/summary_example.dart';

    sections.code(source, mark: '1', loadMode: LoadMode.readOnlyMarked);
    sections.code(source, mark: '2', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const SummaryExample(), title: 'Example:')
      ..runMacro(id: Macros.noHeightExample, context: context)
      ..linkToSource(file: source);
  }
}
