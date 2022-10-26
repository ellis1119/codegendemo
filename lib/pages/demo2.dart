import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const TextStyle textTitleStyle = TextStyle(
    color: Color.fromRGBO(55, 65, 81, 1),
    fontSize: 15.0,
    fontWeight: FontWeight.bold);
const TextStyle textContentStyle =
    TextStyle(color: Color.fromRGBO(55, 65, 81, 1), fontSize: 14.0);

void main() => runApp(const Demo2());

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Demo2State createState() => Demo2State();
}

class Demo2State extends State<Demo2> {
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

  bool _sortAscending = true;
  var _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 280;
    double width2 = MediaQuery.of(context).size.width - 55;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            '菜单二',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold , color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            alignment: const Alignment(0, -1),
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.005, vertical: screenHeight * 0.04),
            child: Scrollbar(
              child: SingleChildScrollView(
                  controller: _pverScrollerController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: SearchBar(),
                          ),
                          const Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Expanded(
                              child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1.0),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 29, vertical: 15)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.cyan),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              icon: const Icon(
                                Icons.download,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              label: width > 1000
                                  ? const Text(
                                      '生成代码',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(240, 248, 255, 1),
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Text(
                                      '生成代码',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(240, 248, 255, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.0),
                                    ),
                              onPressed: () {},
                            ),
                          )),
                        ],
                      ),
                      Card(
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
                                        dividerColor: const Color.fromRGBO(
                                            240, 248, 255, 1)),
                                    child: (DataTable(
                                      sortColumnIndex: _sortColumnIndex,
                                      sortAscending: _sortAscending,
                                      headingRowColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => const Color.fromRGBO(
                                            243, 244, 246, 1),
                                      ),
                                      dataRowColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => const Color.fromRGBO(
                                                  255, 255, 255, 1)),
                                      headingRowHeight: 60.0,
                                      dataRowHeight: 60.0,
                                      horizontalMargin: 12,
                                      columnSpacing: 0,
                                      columns: [
                                        DataColumn(
                                            label: SizedBox(
                                                width: screenWidth > 1000
                                                    ? width * 0.05
                                                    : width2 * 0.05,
                                                child: const Center(
                                                  child: Text('',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                ))),
                                        DataColumn(
                                            label: SizedBox(
                                                width: screenWidth > 1000
                                                    ? width * 0.21
                                                    : width2 * 0.15,
                                                child: const Center(
                                                  child: Text('表名',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                ))),
                                        DataColumn(
                                            label: SizedBox(
                                                width: screenWidth > 1000
                                                    ? width * 0.25
                                                    : width2 * 0.18,
                                                child: const Center(
                                                  child: Text('内容',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                ))),
                                        DataColumn(
                                            label: SizedBox(
                                                width: screenWidth > 1000
                                                    ? width * 0.2
                                                    : width2 * 0.16,
                                                child: const Center(
                                                  child: Text('备注',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                ))),
                                        DataColumn(
                                            label: SizedBox(
                                                width: screenWidth > 1000
                                                    ? width * 0.15
                                                    : width2 * 0.1,
                                                child: const Center(
                                                  child: Text('时间',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                )),
                                            onSort: (int columnIndex,
                                                bool ascending) {
                                              setState(() {
                                                _sortColumnIndex = columnIndex;
                                                _sortAscending = ascending;
                                                if (ascending) {
                                                  data.sort((a, b) =>
                                                      a.date.compareTo(b.date));
                                                } else {
                                                  data.sort((a, b) =>
                                                      b.date.compareTo(a.date));
                                                }
                                              });
                                            }),
                                        DataColumn(
                                            label: SizedBox(
                                                width: width * 0.1,
                                                child: const Center(
                                                  child: Text('操作',
                                                      style: textTitleStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                ))),
                                      ],
                                      rows: [
                                        for (int i = 0; i < data.length; i++)
                                          DataRow(
                                            cells: [
                                              DataCell(Center(
                                                child: Text(
                                                    data[i].id.toString(),
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                              DataCell(Center(
                                                child: Text(data[i].title,
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                              DataCell(Center(
                                                child: Text(data[i].body,
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                              DataCell(Center(
                                                child: Text(data[i].rmks,
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                              DataCell(Center(
                                                child: Text(
                                                    data[i]
                                                        .date
                                                        .toString()
                                                        .substring(0, 19),
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                              const DataCell(Center(
                                                child: Text('测试操作',
                                                    style: textContentStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              )),
                                            ],
                                            selected: data[i].selected,
                                            onSelectChanged: (selected) {
                                              setState(() {
                                                data[i].selected = selected!;
                                                if (kDebugMode) {
                                                  print(data[i].title);
                                                }
                                              });
                                            },
                                          ),
                                      ],
                                    )))),
                          ),
                        ),
                      )
                    ],
                  )),
            )));
  }
}

class SearchBar extends StatefulWidget {
  //搜索
  const SearchBar({Key? key}) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: _textEditingController,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          prefixIcon: IconButton(
            hoverColor: Colors.transparent,
            constraints: const BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              if (kDebugMode) {
                print(_textEditingController.text);
              }
            },
          ),
          hintText: "请输入您要查询的表名",
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          suffixIcon: IconButton(
            hoverColor: Colors.transparent,
            constraints: const BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              _textEditingController.clear();
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}

class ListData {
  ListData(this.id, this.title, this.body, this.rmks, this.date,
      {this.selected = false});

  int id;
  String title;
  String body;
  String rmks;
  DateTime date;
  bool selected;
}

List<ListData> data = [
  ListData(1, '测试标题1', '测试内容1', '测试备注1', DateTime.now()),
  ListData(2, '测试标题2', '测试内容1', '测试备注1', DateTime.now()),
  ListData(3, '测试标题3', '测试内容1', '测试备注1', DateTime.now()),
  ListData(4, '测试标题4', '测试内容1', '测试备注1', DateTime.now()),
  ListData(5, '测试标题5', '测试内容1', '测试备注1', DateTime.now()),
  ListData(6, '测试标题6', '测试内容1', '测试备注1', DateTime.now()),
  ListData(7, '测试标题7', '测试内容1', '测试备注1', DateTime.now()),
  ListData(8, '测试标题8', '测试内容1', '测试备注1', DateTime.now()),
  ListData(9, '测试标题9', '测试内容1', '测试备注1', DateTime.now()),
  ListData(10, '测试标题10', '测试内容1', '测试备注1', DateTime.now()),
  ListData(11, '测试标题11', '测试内容1', '测试备注1', DateTime.now()),
  ListData(12, '测试标题12', '测试内容1', '测试备注1', DateTime.now()),
];
