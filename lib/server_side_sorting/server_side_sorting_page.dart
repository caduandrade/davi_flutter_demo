import 'package:davi_demo/macros.dart';
import 'package:davi_demo/server_side_sorting/server_side_sorting_builder_example.dart';
import 'package:davi_demo/server_side_sorting/server_side_sorting_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ServerSideSortingPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    sections.heading('Builder mode');

    sections.text(
        text: 'Tapping a header only updates the sort indication kept by the'
            ' controller and calls onSort. The rows, already sorted by the'
            ' server, are passed back through a rebuild.');

    sections.widget((context) => const ServerSideSortingBuilderExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(
          file:
              'lib/server_side_sorting/server_side_sorting_builder_example.dart');

    sections.heading('Model mode');

    sections.text(
        text: 'The model ignores the column comparators and onSort replaces'
            ' the rows with the ones returned by the server.');

    sections.widget((context) => const ServerSideSortingExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(
          file: 'lib/server_side_sorting/server_side_sorting_example.dart');
  }
}
