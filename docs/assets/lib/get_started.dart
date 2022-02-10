import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/widgets.dart';

class GetStartedExample extends Example {
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
      EasyTableColumn.valueMapper((row) => row.name, name: 'Name'),
      EasyTableColumn.valueMapper((row) => row.age, name: 'Age')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(_model);
  }

  void _withAppender() {
    List<Person> rows = [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ];

    _model = EasyTableModel<Person>(rows: rows);
    _model!.columnAppender()
      ..valueMapper((row) => row.name, name: 'Name')
      ..valueMapper((row) => row.age, name: 'Age');
  }
}
