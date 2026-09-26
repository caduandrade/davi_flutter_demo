import 'package:davi_demo/get_started/get_started_builder_example.dart';
import 'package:davi_demo/get_started/get_started_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    String source = 'lib/get_started/get_started_example.dart';

    sections.text(
        text: 'Davi can be used in two modes. In the model mode, a'
            ' DaviModel owns the rows and takes care of them, including'
            ' sorting. In the builder mode, the rows come from outside'
            ' (a State, a Bloc, a ChangeNotifier, etc.) and Davi only'
            ' displays them.');

    sections.text(
        text: 'In both modes, you first need to create a class to represent'
            ' your business logic or data structure.');

    sections.code(source, mark: 'logic', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Model mode');

    sections.text(
        text: 'Define a model that holds the rows and configures what data'
            ' from the class should be displayed in each column.');

    sections.code(source, mark: 'model', loadMode: LoadMode.readOnlyMarked);

    sections.text(
        text: 'Finally, create the Davi widget using the defined model.');

    sections.code(source, mark: 'davi', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const GetStartedExample(), title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);

    sections.heading('Builder mode');
    source = 'lib/get_started/get_started_builder_example.dart';

    sections.text(
        text: 'Define a controller that keeps only the state of the columns'
            ' (order, width and sort indication). The rows are kept by you.');

    sections.code(source,
        mark: 'controller', loadMode: LoadMode.readOnlyMarked);

    sections.text(
        text: 'Finally, create the Davi widget with the builder constructor,'
            ' passing the controller and the rows.');

    sections.code(source, mark: 'davi', loadMode: LoadMode.readOnlyMarked);

    sections.infoBanner(
        text: 'Whenever the data changes, rebuild with a new list instead of'
            ' modifying the same list instance. Sorting is disabled unless'
            ' an onSort callback is provided (see Sort > Server side sort).');

    sections.widget((context) => const GetStartedBuilderExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);
  }
}
