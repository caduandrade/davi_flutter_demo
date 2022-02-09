import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class GetStartedExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => MainWidget();
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
  List<Person>? _rows;

  @override
  void initState() {
    super.initState();
    _rows = [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(rows: _rows, columns: [
      EasyTableColumn.auto((row) => row.name, name: 'Name'),
      EasyTableColumn.auto((row) => row.age, name: 'Age')
    ]);
  }
}
