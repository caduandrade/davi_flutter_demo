import 'package:davi/davi.dart';
import 'package:flutter/widgets.dart';

//@demoflu_start:logic
class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}
//@demoflu_end:logic

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExampleState();
}

class ExampleState extends State<Example> {

  //@demoflu_start:model
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    _model = DaviModel<Person>(rows: [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ], columns: [
      DaviColumn(name: 'Name', cellValue: (person, index) => person.name),
      DaviColumn(name: 'Age', cellValue: (person, index) => person.age)
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
