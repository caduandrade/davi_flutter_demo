import 'package:davi_demo/get_started/get_started_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/get_started/get_started_example.dart';
    sections.text(
        text: 'First, you need to create a class to represent'
            ' your business logic or data structure.');

    sections.code(source, mark: 'logic', loadMode: LoadMode.readOnlyMarked);

    sections.text(
        text: 'Next, you need to define a model that maps this'
            ' class and configures what data from the class'
            ' should be displayed in each column.');

    sections.code(source, mark: 'model', loadMode: LoadMode.readOnlyMarked);

    sections.text(
        text: 'Finally, create the Davi widget using the defined model.');

    sections.code(source, mark: 'davi', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const GetStartedExample(), title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);
  }
}
