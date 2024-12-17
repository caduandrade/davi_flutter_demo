import 'package:davi_demo/columns_fit/columns_fit_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class ColumnsFitPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text(text: "The functionality allows all columns to fill"
        " the available space within the table, eliminating the need"
        " for horizontal scrolling. Each column's share of the space"
        " is determined by its `grow` attribute, which is a flexible factor.");

    sections.code('lib/columns_fit/columns_fit_example.dart', mark: 'davi', loadMode: LoadMode.readOnlyMarked);


    sections
        .widget((context) => const Example(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);


    sections.code('lib/columns_fit/columns_fit_example.dart', discardMarks: true, title: 'Full code:');

    return sections;
  }
}
