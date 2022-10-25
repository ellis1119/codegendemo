import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle textTitleStyle = TextStyle(
    color: Color.fromRGBO(55, 65, 81, 1),
    fontSize: 15.0,
    fontWeight: FontWeight.bold);
const TextStyle textContentStyle =
    TextStyle(color: Color.fromRGBO(55, 65, 81, 1), fontSize: 14.0);

void main() => runApp(const MainSmallTable());

class MainSmallTable extends StatefulWidget {
  const MainSmallTable({Key? key}) : super(key: key);

  @override
  _MainSmallTableState createState() => _MainSmallTableState();
}

class _MainSmallTableState extends State<MainSmallTable> {
  final GlobalKey globalKey = GlobalKey();
  late ScrollController _verScrollerController;
  late ScrollController _pverScrollerController;
  late ScrollController _horScrollerController;
  late ScrollController _phorScrollerController;
  late String searchString;

  @override
  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  void initState() {
    super.initState();
    searchString = '';
    _verScrollerController = ScrollController();
    _pverScrollerController = ScrollController();
    _horScrollerController = ScrollController();
    _phorScrollerController = ScrollController();
  }

  @override
  void dispose() {
    _verScrollerController.dispose();
    _pverScrollerController.dispose();
    _horScrollerController.dispose();
    _phorScrollerController.dispose();

    super.dispose();
  }

  bool _sortAscending = true;
  var _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 250) * 0.5;
    double width2 = MediaQuery.of(context).size.width - 55;
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
        elevation: 1,
        color: Colors.transparent,
        child: Scrollbar(
            child: SingleChildScrollView(
          controller: _verScrollerController,
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
              controller: _horScrollerController,
              scrollDirection: Axis.horizontal,
              child: Theme(
                  data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent),
                  child: (DataTable(
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromRGBO(255, 255, 255, 1)),
                    headingRowHeight: 60.0,
                    dataRowHeight: 60.0,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    columns: [
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.23
                                  : width2 * 0.23,
                              child: const Center(
                                child: Text('表名',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.24
                                  : width2 * 0.22,
                              child: const Center(
                                child: Text('内容',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.2
                                  : width2 * 0.18,
                              child: const Center(
                                child: Text('备注',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.2
                                  : width2 * 0.18,
                              child: const Center(
                                child: Text('分类',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              )),
                          onSort: (int columnIndex, bool ascending) {
                            setState(() {
                              _sortColumnIndex = columnIndex;
                              _sortAscending = ascending;
                              if (ascending) {
                                data.sort((a, b) => a.date.compareTo(b.date));
                              } else {
                                data.sort((a, b) => b.date.compareTo(a.date));
                              }
                            });
                          }),
                    ],
                    rows: [
                      for (int i = 0; i < data.length; i++)
                        DataRow(
                          cells: [
                            DataCell(Center(
                              child: Text(data[i].title,
                                  style: textContentStyle,
                                  textAlign: TextAlign.center),
                            )),
                            DataCell(Center(
                              child: Text(data[i].body,
                                  style: textContentStyle,
                                  textAlign: TextAlign.center),
                            )),
                            DataCell(Center(
                              child: Text(data[i].rmks,
                                  style: textContentStyle,
                                  textAlign: TextAlign.center),
                            )),
                            DataCell(Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.car_crash,
                                    size: 30.0,
                                    color: Colors.cyan,
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                    ],
                  )))),
        )));
  }
}

class listData {
  listData(this.title, this.body, this.rmks, this.date,
      {this.selected = false});

  String title;
  String body;
  String rmks;
  DateTime date;
  bool selected;
}

List<listData> data = [
  listData('测试标题1', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题2', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题3', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题4', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题5', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题6', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题7', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题8', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题9', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题10', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题11', '测试内容1', '测试备注1', DateTime.now()),
  listData('测试标题12', '测试内容1', '测试备注1', DateTime.now()),
];
