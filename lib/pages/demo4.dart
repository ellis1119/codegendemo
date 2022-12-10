import 'package:codegensystem/pages/inputConfig.dart';
import 'package:codegensystem/pages/statementOutput.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Demo4());
}

class Demo4 extends StatefulWidget {
  const Demo4({Key? key}) : super(key: key);

  @override
  Demo4State createState() => Demo4State();
}

class Demo4State extends State<Demo4> {
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
            '配置页',
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
                      if (width > 1000)
                        Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
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
                                        height: 1030.0,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 20.0),
                                        child: ListTile(
                                            title: const Text(
                                              "输入配置",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Center(
                                              child: Container(
                                                margin: const EdgeInsets
                                                        .symmetric(
                                                    vertical: 10.0),
                                                child: const InputConfig(),
                                              ),
                                            )),
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
                                      height: 1030.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 20.0),
                                      child: ListTile(
                                          title: const Text(
                                            "生成结果",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Center(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: const StatementOutput(),
                                            ),
                                          )),
                                    )),
                              ),
                            )
                          ],
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
                                    height: 1000.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 20.0),
                                    child: ListTile(
                                        title: const Text(
                                          "输入配置",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: const InputConfig(),
                                          ),
                                        )),
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
                                      height: 1000.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 20.0),
                                      child: ListTile(
                                          title: const Text(
                                            "生成结果",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Center(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: const StatementOutput(),
                                            ),
                                          )),
                                    ))),
                          ],
                        ),
                    ])))));
  }
}
