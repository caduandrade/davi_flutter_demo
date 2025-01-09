import 'package:davi/davi.dart';
import 'package:davi_demo/cell_merge/cell_merge_example.dart';
import 'package:davi_demo/cell_merge/cell_merge_overflow_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class CellMergePage extends DemoFluPage {

final ValueNotifier<CellCollisionBehavior> _cellCollisionBehavior = ValueNotifier(CellCollisionBehavior.overlap);
final ValueNotifier<RowSpanOverflowBehavior> _rowSpanOverflowBehavior=ValueNotifier(RowSpanOverflowBehavior.cap);

Widget _cellCollisionBehaviorChooser(){
  return Card(color: Colors.grey[200],
      child: Column(
    children: [
      ListTile(
        title: Text("CellCollisionBehavior"),
        dense: true
      ),
      _cellCollisionBehaviorItem(CellCollisionBehavior.overlap, 'Allows all colliding cells to be rendered, resulting in visual overlap.'),
      _cellCollisionBehaviorItem(CellCollisionBehavior.ignore, 'Ignores the colliding cell and does not render it.')
    ],
  ));
}

Widget _cellCollisionBehaviorItem(CellCollisionBehavior item, String description) {
  return  RadioListTile<CellCollisionBehavior>(
    title: Text(item.name),
    subtitle: Text(description),
    value: item,
    groupValue: _cellCollisionBehavior.value,
    onChanged: (value) {
      _cellCollisionBehavior.value = value!;
    },
      dense: true
  );
}

Widget _rowSpanOverflowBehaviorChooser(){
  return Card(color: Colors.grey[200],
  child: Column(
    children: [ListTile(
        title: Text("RowSpanOverflowBehavior"),
        dense: true
    ),
      _rowSpanOverflowBehaviorItem(RowSpanOverflowBehavior.cap, 'Adjusts the rowSpan to fit within the available rows, limiting the span.'),
      _rowSpanOverflowBehaviorItem(RowSpanOverflowBehavior.error, 'Throws an error if the cell''s rowSpan exceeds the available number of rows.')
    ],
  ));
}


Widget _rowSpanOverflowBehaviorItem(RowSpanOverflowBehavior item, String description) {
  return  RadioListTile<RowSpanOverflowBehavior>(
    title: Text(item.name),
    subtitle: Text(description),
    value: item,
    groupValue: _rowSpanOverflowBehavior.value,
    onChanged: (value) {
      _rowSpanOverflowBehavior.value = value!;
    },
    dense: true
  );
}



  @override
  void buildSections(BuildContext context, PageSections sections) {
    Listenable listenable = Listenable.merge([_cellCollisionBehavior,_rowSpanOverflowBehavior]);

    final String source = 'lib/cell_merge/cell_merge_example.dart';

    sections.text()
      ..add('You can define row and column spans directly at the column level,')
      ..add(' providing full flexibility to handle dynamic layouts.')
      ..add(' Spans are determined by a function that receives the row object,')
      ..add(' allowing you to use predefined values from your data')
      ..add(' or implement custom logic.');


    sections.code(source,
        mark: '1', loadMode: LoadMode.readOnlyMarked, title: 'Example:');

    sections.widget((context) => const CellMergeExample(), title: 'Example:')
      ..runMacro(id: Macros.styleExample, context: context)
      ..maxWidth = 650
      ..linkToSource(file: source);

    sections.heading("Collision and row span overflow");

    sections.widget((context)=>Wrap(children: [IntrinsicWidth(child:_cellCollisionBehaviorChooser()),IntrinsicWidth(child:_rowSpanOverflowBehaviorChooser())]), listenable: listenable);

    sections.widget((context) =>  CellMergeOverflowExample(collisionBehavior:_cellCollisionBehavior.value,
    rowSpanOverflowBehavior: _rowSpanOverflowBehavior.value), title: 'Example with 2 data rows:', listenable: listenable)
      ..runMacro(id: Macros.noHeightExample, context: context)
    ..linkToSource(file: 'lib/cell_merge/cell_merge_overflow_example.dart');

  }
}
