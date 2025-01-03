import 'package:davi_demo/macros.dart';
import 'package:davi_demo/server_side_sorting/server_side_sorting_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ServerSideSortingPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source =
        'lib/server_side_sorting/server_side_sorting_example.dart';

    sections.widget((context) => const ServerSideSortingExample(),
        title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
