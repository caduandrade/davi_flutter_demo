import 'package:davi/davi.dart';
import 'package:flutter/widgets.dart';

//@demoflu_start:logic
class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}
//@demoflu_end:logic

class GetStartedExample extends StatefulWidget {
  const GetStartedExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetStartedExampleState();
}

class GetStartedExampleState extends State<GetStartedExample> {
  //@demoflu_start:model
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

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      DaviColumn(name: 'Age', cellValue: (params) => params.data.age)
    ]);
  }

  //@demoflu_end:model

  //@demoflu_start:davi
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
  }
//@demoflu_end:davi
}
