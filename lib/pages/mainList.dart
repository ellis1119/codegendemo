import 'package:flutter/material.dart';

void main() => runApp(const MainList());

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  MainListState createState() => MainListState();
}

class MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            //  horizontal: screenWidth * 0.02,
                            ),
                        leading: AspectRatio(
                          aspectRatio: 9 / 10,
                          child: Image.asset(listData[index]['head']),
                        ),
                        title: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.006),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listData[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.007),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listData[index]['body'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      letterSpacing: .3),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  listData[index]['date'] + '    ',
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                );
              }),
        )
      ],
    );
  }
}

List listData = [
  {
    "id": 1,
    "name": "John",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 2,
    "name": "Will",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 3,
    "name": "Beth",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "name": "Mike",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 5,
    "name": "Mike",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
  {
    "id": 4,
    "name": "Miranda",
    "head": "images/photo.jpg",
    "date": "2022-07-18",
    "body":
        "Little Sam (on phone): My son is having high fever and he won’t be able to come to school today."
  },
];
