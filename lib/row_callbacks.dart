import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/widgets.dart';

class RowCallbacksExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  EasyTableModel<Person>? _model;

  @override
  void initState() {
    super.initState();

    _model = EasyTableModel<Person>(rows: [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ], columns: [
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(_model,
        onRowTap: (person) => _onRowTap(context, person),
        onRowDoubleTap: (person) => _onRowDoubleTap(context, person));
  }

  void _onRowTap(BuildContext context, Person person) {
    DemoFlu.printOnConsole(context, 'Tap on ${person.name}!');
  }

  void _onRowDoubleTap(BuildContext context, Person person) {
    DemoFlu.printOnConsole(context, 'Double tap on ${person.name}!');
  }
}
