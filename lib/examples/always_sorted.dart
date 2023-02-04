import 'package:davi/davi.dart';

//@demoflu_ignore_start
import 'package:demoflu/demoflu.dart';

//@demoflu_ignore_end
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//@demoflu_ignore_start
class AlwaysSortedExample extends Example {
  AlwaysSortedExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/always_sorted.dart');
}
//@demoflu_ignore_end

class Person {
  Person(this.name, this.age, this.weight);

  final String name;
  final int age;
  final double weight;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  DaviModel<Person>? _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Carolyn', 22, 17),
      Person('Cornell', 22, 20.1),
      Person('Christine', 37, 18.6),
      Person('Carey', 37, 23),
      Person('Cadu', 43, 27.2),
      Person('Catherine', 43, 25.3)
    ];
    _model = DaviModel<Person>(
        rows: rows,
        columns: [
          DaviColumn(name: 'Name', stringValue: (row) => row.name),
          DaviColumn(name: 'Age', intValue: (row) => row.age),
          DaviColumn(
              name: 'Weight', width: 120, doubleValue: (row) => row.weight)
        ],
        alwaysSorted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Davi(_model);
  }
}
