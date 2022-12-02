import 'package:flutter/material.dart';

class InputAlert extends StatelessWidget {
  const InputAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Modal 弹窗'),
      // ),
      backgroundColor: Colors.black.withOpacity(0.65),
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: screenWidth * 0.05),
          color: Colors.white,
          height: screenHeight * 0.65,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.06,
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                      "表信息列表",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          letterSpacing: 1.6),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                              title: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.006),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listData[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.005),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '表名：${listData[index]['name']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                      fontSize: 14,
                                      letterSpacing: 1.1),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.005),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '字段：${listData[index]['field']}',
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      letterSpacing: 1.1),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.vertical_align_bottom_outlined,
                                    color: Colors.lightBlue,
                                    size: 30.0,
                                  ),
                                  tooltip: 'click IconButton',
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text(
                          "关闭",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.lightBlue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

List listData = [
  {
    "id": 1,
    "title": "测试表一",
    "name": "test_table1",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 2,
    "title": "测试表二",
    "name": "test_table2",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 3,
    "title": "测试表三",
    "name": "test_table3",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "title": "测试表四",
    "name": "test_table4",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "title": "测试表五",
    "name": "test_table5",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 6,
    "title": "测试表六",
    "name": "test_table6",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 7,
    "title": "测试表七",
    "name": "test_table7",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 8,
    "title": "测试表八",
    "name": "test_table8",
    "field":
        "field,field,field,field,field,field,field,field,field,field,field",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
];
