import 'package:flutter/material.dart';
import '../utils/mainCard.dart';
import 'mainGraph.dart';
import 'mainPie.dart';
import 'mainList.dart';
import 'mainSmallTable.dart';

void main() {
  runApp(const Demo3());
}

class Demo3 extends StatefulWidget {
  const Demo3({Key? key}) : super(key: key);

  @override
  Demo3State createState() => Demo3State();
}

class Demo3State extends State<Demo3> {
  late ScrollController _verScrollerController;
  late ScrollController _verScrollerController2;

  @override
  void initState() {
    super.initState();
    _verScrollerController = ScrollController();
    _verScrollerController2 = ScrollController();
  }

  @override
  void dispose() {
    _verScrollerController.dispose();
    _verScrollerController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            '菜单一',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.005, vertical: height * 0.04),
            child: Scrollbar(
                child: SingleChildScrollView(
                    controller: _verScrollerController,
                    scrollDirection: Axis.vertical,
                    child: Column(children: <Widget>[
                      if (width > 900)
                        SizedBox(
                          height: 160,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15.0),
                                  child: MainCard(
                                    items: [
                                      MainCardItem(
                                        title: '卡片标题一',
                                        data: 520,
                                        desc: '测试内容一',
                                        icon: const Icon(
                                          Icons.home_filled,
                                          size: 40.0,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15.0),
                                  child: MainCard(
                                    items: [
                                      MainCardItem(
                                        title: '卡片标题二',
                                        data: 11,
                                        desc: '测试内容二',
                                        icon: const Icon(
                                          Icons.cloud,
                                          size: 40.0,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15.0),
                                  child: MainCard(
                                    items: [
                                      MainCardItem(
                                        title: '卡片标题三',
                                        data: 58,
                                        desc: '测试内容三',
                                        icon: const Icon(
                                          Icons.import_contacts_sharp,
                                          size: 40.0,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MainCard(
                                  items: [
                                    MainCardItem(
                                      title: '卡片标题四',
                                      data: 666,
                                      desc: '测试内容四',
                                      icon: const Icon(
                                        Icons.chat,
                                        size: 40.0,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      if (width <= 900)
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: MainCard(
                                items: [
                                  MainCardItem(
                                    title: '卡片标题一',
                                    data: 520,
                                    desc: '测试内容一',
                                    icon: const Icon(
                                      Icons.home_filled,
                                      size: 40.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: MainCard(
                                items: [
                                  MainCardItem(
                                    title: '卡片标题二',
                                    data: 11,
                                    desc: '测试内容二',
                                    icon: const Icon(
                                      Icons.cloud,
                                      size: 40.0,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: MainCard(
                                items: [
                                  MainCardItem(
                                    title: '卡片标题三',
                                    data: 58,
                                    desc: '测试内容三',
                                    icon: const Icon(
                                      Icons.import_contacts_sharp,
                                      size: 40.0,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MainCard(
                              items: [
                                MainCardItem(
                                  title: '卡片标题四',
                                  data: 666,
                                  desc: '测试内容四',
                                  icon: const Icon(
                                    Icons.chat,
                                    size: 40.0,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      if (width > 1000)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: height * 0.02),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 6.0),
                                    child: Card(
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        semanticContainer: false,
                                        child: Container(
                                          height: 600.0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          child: const ListTile(
                                            title: Text(
                                              "柱状图一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: MainGraph(),
                                          ),
                                        ))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 6.0),
                                  child: Card(
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      semanticContainer: false,
                                      child: Container(
                                        height: 600.0,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: const ListTile(
                                            title: Text(
                                              "饼图一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Center(
                                              child: SizedBox(
                                                  height: 250,
                                                  child: MainPie()),
                                            )),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      if (width <= 1000)
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Card(
                                  elevation: 1,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  semanticContainer: false,
                                  child: Container(
                                    height: 600.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 20.0),
                                    child: const ListTile(
                                      title: Text(
                                        "柱状图一",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: MainGraph(),
                                    ),
                                  )),
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: Card(
                                    elevation: 1,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    semanticContainer: false,
                                    child: Container(
                                      height: 600.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 20.0),
                                      child: ListTile(
                                          title: const Text(
                                            "饼图一",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Center(
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 50.0),
                                                child: const MainPie()),
                                          )),
                                    ))),
                          ],
                        ),
                      if (width > 1000)
                        SizedBox(
                          height: 600,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 6.0),
                                  child: Card(
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      semanticContainer: false,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: ListTile(
                                            title: const Text(
                                              "列表一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Center(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 30.0),
                                                  child: const MainList()),
                                            )),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 6.0),
                                  child: Card(
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      semanticContainer: false,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: ListTile(
                                            title: const Text(
                                              "表格一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Center(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      const MainSmallTable()),
                                            )),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (width <= 1000)
                        SizedBox(
                          height: 1300,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  child: Card(
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      semanticContainer: false,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: ListTile(
                                            title: const Text(
                                              "列表一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Center(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 30.0),
                                                  child: const MainList()),
                                            )),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  child: Card(
                                      elevation: 1,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      semanticContainer: false,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: ListTile(
                                            title: const Text(
                                              "表格一",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Center(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      const MainSmallTable()),
                                            )),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ])))));
  }
}
