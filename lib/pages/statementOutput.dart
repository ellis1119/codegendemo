import 'package:codegensystem/utils/editor/editor.dart';
import 'package:codegensystem/utils/editor/editorFile.dart';
import 'package:codegensystem/utils/editor/editorModel.dart';
import 'package:codegensystem/utils/editor/editorStyle.dart';
import 'package:flutter/material.dart';

class StatementOutput extends StatefulWidget {
  const StatementOutput({Key? key}) : super(key: key);

  @override
  StatementOutputState createState() => StatementOutputState();
}

class StatementOutputState extends State<StatementOutput> {
  late ScrollController _verScrollerController;

  @override
  void initState() {
    super.initState();
    _verScrollerController = ScrollController();
  }

  @override
  void dispose() {
    _verScrollerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> contentOfPage1 = [
      "SELECT Websites.name, access_log.count, access_log.dat",
      "FROM Websites FULL OUTER",
      "JOIN access_log ON Websites.id=access_log.site_id",
      "ORDER BY access_log.count DESC",
      "<div>"
    ];

    List<EditorFile> files = [
      EditorFile(
        name: "生成语句1",
        language: "html",
        code: contentOfPage1.join("\n"), // [code] needs a string
      ),
      EditorFile(
        name: "生成语句2",
        language: "html",
        code: contentOfPage1.join("\n"),
      ),
      EditorFile(
        name: "生成语句3",
        language: "css",
        code: contentOfPage1.join("\n"),
      ),
    ];

    EditorModel model = EditorModel(
      files: files,
      styleOptions: EditorStyle(
        fontSize: 13,
      ),
    );

    final dController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding:  EdgeInsets.symmetric( vertical: screenHeight * 0.01),
        child: SingleChildScrollView(
          controller: _verScrollerController,
          scrollDirection: Axis.vertical,
          child: Editor(
            model: model,
            edit: true,
            onSubmit: (String? language, String? value) => {},
            disableNavigationbar:
            false,
            textEditingController:
            dController,
          ),
        ),
      )
    );
  }
}