import 'package:davi_demo/get_started/get_started_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text(text: 'First, you need to create a class to represent'
        ' your business logic or data structure.');

    sections.code('lib/get_started/get_started_example.dart', mark: 'logic', loadMode: LoadMode.readOnlyMarked);

    sections.text(text: 'Next, you need to define a model that maps this'
        ' class and configures what data from the class'
        ' should be displayed in each column.');

    sections.code('lib/get_started/get_started_example.dart', mark: 'model', loadMode: LoadMode.readOnlyMarked);

    sections.text(text: 'Finally, create the Davi widget using the defined model.');

    sections.code('lib/get_started/get_started_example.dart', mark: 'davi', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const Example(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);


    sections.code('lib/get_started/get_started_example.dart', discardMarks: true, title: 'Full code:');

    return sections;
  }
}
