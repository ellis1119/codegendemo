import 'package:flutter/material.dart';

const TextStyle textTitleStyle = TextStyle(
    color: Color.fromRGBO(55, 65, 81, 1),
    fontSize: 15.0,
    fontWeight: FontWeight.bold);
const TextStyle textContentStyle =
    TextStyle(color: Color.fromRGBO(55, 65, 81, 1), fontSize: 14.0);
const TextStyle textContentStyle2 = TextStyle(
    color: Color.fromRGBO(55, 65, 81, 1),
    fontSize: 14.0,
    fontWeight: FontWeight.bold);

void main() => runApp(const MainSmallTable());

class MainSmallTable extends StatefulWidget {
  const MainSmallTable({Key? key}) : super(key: key);

  @override
  MainSmallTableState createState() => MainSmallTableState();
}

class MainSmallTableState extends State<MainSmallTable> {
  final GlobalKey globalKey = GlobalKey();
  late ScrollController _verScrollerController;
  late ScrollController _pverScrollerController;
  late ScrollController _horScrollerController;
  late ScrollController _phorScrollerController;
  late String searchString;

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

  final bool _sortAscending = true;
  final _sortColumnIndex = 0;

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
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: (DataTable(
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromRGBO(255, 255, 255, 1)),
                    headingRowHeight: 50.0,
                    dataRowHeight: 50.0,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    columns: [
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.23
                                  : width2 * 0.23,
                              child: const Center(
                                child: Text('??????',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.24
                                  : width2 * 0.22,
                              child: const Center(
                                child: Text('??????',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: screenWidth > 1000
                                  ? width * 0.2
                                  : width2 * 0.18,
                              child: const Center(
                                child: Text('??????',
                                    style: textTitleStyle,
                                    textAlign: TextAlign.center),
                              ))),
                      DataColumn(
                        label: SizedBox(
                            width: screenWidth > 1000
                                ? width * 0.2
                                : width2 * 0.18,
                            child: const Center(
                              child: Text('??????',
                                  style: textTitleStyle,
                                  textAlign: TextAlign.center),
                            )),
                      ),
                    ],
                    rows: [
                      for (int i = 0; i < data.length; i++)
                        DataRow(
                          cells: [
                            DataCell(Center(
                              child: Text(data[i].title,
                                  style: textContentStyle2,
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
                            const DataCell(Center(
                                child: Icon(
                              Icons.file_copy_outlined,
                              size: 30.0,
                              color: Colors.lightBlue,
                            ))),
                          ],
                        ),
                    ],
                  )))),
        )));
  }
}

class ListData {
  ListData(this.title, this.body, this.rmks, this.date,
      {this.selected = false});

  String title;
  String body;
  String rmks;
  DateTime date;
  bool selected;
}

List<ListData> data = [
  ListData('????????????1', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????2', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????3', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????4', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????5', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????6', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????7', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????8', '????????????1', '????????????1', DateTime.now()),
  ListData('????????????9', '????????????1', '????????????1', DateTime.now()),
];
