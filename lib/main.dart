import 'package:davi_demo/column_style/column_style_page.dart';
import 'package:davi_demo/column_width/column_width_page.dart';
import 'package:davi_demo/get_started/get_started_page.dart';
import 'package:davi_demo/infinite_scroll/infinite_scroll_page.dart';
import 'package:davi_demo/macros.dart';
import 'package:davi_demo/pinned_column/pinned_column_page.dart';
import 'package:davi_demo/row_callbacks/row_callbacks_page.dart';
import 'package:davi_demo/row_color/row_color_page.dart';
import 'package:davi_demo/row_cursor/row_cursor_page.dart';
import 'package:davi_demo/row_hover_listener/row_hover_listener_page.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

void main() {
  DemoFluApp app = DemoFluApp(title: 'Davi (4.0.0)', rootMenus: _rootMenus);
  app.macro.widget(Macros.styleExample, (context, section) {
    section
      ..padding = const EdgeInsets.all(10)
      ..background = Colors.white
      ..solidBorder(color: Colors.grey[300]);
  });
  app.macro.widget(Macros.horizontalExample, (context, section) {
    section
      ..maxHeight = 350
      ..maxWidth = 600
      ..runMacro(id: Macros.styleExample, context: context);
  });
  app.macro.group(Macros.tryOut, (context, section) {
    section
      ..padding = const EdgeInsets.fromLTRB(16, 4, 16, 4)
      ..text(text: 'Try out here').marginLeft = 8
      ..bulletBorder(
          color: Colors.grey[600]!,
          iconColor: Colors.white,
          icon: Icons.gesture,
          thickness: 6,
          diameter: 32);
  });
  app.macro.text(Macros.textAfter, (context, section) {
    section
      ..padding = const EdgeInsets.all(16)
      ..marginLeft = 32
      ..arrowDownBorder(color: Colors.grey[600]);
  });
  app.run();
}

List<DemoMenuItem> get _rootMenus => [_getStarted, _columns,_rows,_cells];

DemoMenuItem get _getStarted =>
    DemoMenuItem('Get started', page: () => GetStartedPage());


DemoMenuItem _columns = DemoMenuItem('Columns',
    children: [_columnWidth, _columnStyle, _pinnedColumn]);

DemoMenuItem get _columnWidth =>
    DemoMenuItem('Column width', page: () => ColumnWidthPage());

DemoMenuItem get _columnStyle =>
    DemoMenuItem('Column style', page: () => ColumnStylePage());

DemoMenuItem get _pinnedColumn =>
    DemoMenuItem('Pinned column', page: () => PinnedColumnPage());

DemoMenuItem _rows = DemoMenuItem('Rows',
    children: [_rowColor,_rowCursor,_rowCallbacks,_rowHoverListener,_infiniteScroll]);

DemoMenuItem get _rowColor => DemoMenuItem('Row color', page:()=>RowColorPage());

DemoMenuItem get _rowCursor => DemoMenuItem('Row cursor', page:()=>RowCursorPage());

DemoMenuItem get _rowCallbacks => DemoMenuItem('Row callbacks', page:()=>RowCallbacksPage());

DemoMenuItem get _rowHoverListener => DemoMenuItem('Row hover listener', page:()=>RowHoverListenerPage());

DemoMenuItem get _infiniteScroll => DemoMenuItem('Infinite scroll', page:()=>InfiniteScrollPage());

DemoMenuItem _cells = DemoMenuItem('Cells',
    children: []);





