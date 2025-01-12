import 'package:davi/davi.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class FitExample extends StatefulWidget {
  const FitExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FitExampleState();
}

class FitExampleState extends State<FitExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ];

    //@demoflu_start:fit-model
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(
          name: 'Name', grow: 2, cellValue: (params) => params.data.name),
      DaviColumn(name: 'Age', cellValue: (params) => params.data.age)
    ]);
    //@demoflu_end:fit-model
  }

  //@demoflu_start:fit-davi
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, columnWidthBehavior: ColumnWidthBehavior.fit);
  }
//@demoflu_end:fit-davi
}

class ScrollableExample extends StatefulWidget {
  const ScrollableExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScrollableExampleState();
}

class ScrollableExampleState extends State<ScrollableExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ];

    //@demoflu_start:scrollable-model
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(
          name: 'Name', grow: 2, cellValue: (params) => params.data.name),
      DaviColumn(name: 'Age', cellValue: (params) => params.data.age)
    ]);
    //@demoflu_end:scrollable-model
  }

  //@demoflu_start:scrollable-davi
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
  }
//@demoflu_end:scrollable-davi
}
