import 'package:davi/davi.dart';
import 'package:davi_demo/get_started/get_started_example.dart';
import 'package:flutter/widgets.dart';

class GetStartedBuilderExample extends StatefulWidget {
  const GetStartedBuilderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetStartedBuilderExampleState();
}

class GetStartedBuilderExampleState extends State<GetStartedBuilderExample> {
  //@demoflu_start:controller
  final DaviController<Person> _controller = DaviController(columns: [
    DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
    DaviColumn(name: 'Age', cellValue: (params) => params.data.age)
  ]);

  final List<Person> _rows = [
    Person('Landon', 19),
    Person('Sari', 22),
    Person('Julian', 37),
    Person('Carey', 39),
    Person('Cadu', 43),
    Person('Delmar', 72)
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //@demoflu_end:controller

  //@demoflu_start:davi
  @override
  Widget build(BuildContext context) {
    return Davi<Person>.builder(controller: _controller, rows: _rows);
  }
//@demoflu_end:davi
}
