import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImportAlert extends StatefulWidget {
  const ImportAlert({Key? key}) : super(key: key);

  @override
  ImportAlertState createState() => ImportAlertState();
}

class ImportAlertState extends State<ImportAlert> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.65),
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: SimpleDialog(
          title: const Text(
            '导入配置',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          elevation: 10,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: screenWidth * 0.025),
              width: 500,
              height: 280,
              child: TextField(
                style: const TextStyle(fontSize: 16.0),
                keyboardType: TextInputType.multiline,
                maxLines: 22,
                inputFormatters: [LengthLimitingTextInputFormatter(1200)],
                decoration: InputDecoration(
                  counterText: "1200",
                  contentPadding: EdgeInsets.only(
                      left: screenWidth * 0.006, right: screenWidth * 0.006),
                  hintText: "在这里输入配置JSON",
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 5.0, horizontal: screenWidth * 0.011),
              child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.005,
                        vertical: screenHeight * 0.01),
                    child: ImpButton(
                      text: "导入",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.005,
                        vertical: screenHeight * 0.01),
                    child: ImpButton(
                      text: "关闭",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ]),
            )
          ],
          //backgroundColor: Colors.green,
        ),
      )),
    );
  }
}

class ImpButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const ImpButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
            width: 0.6, color: Colors.grey, style: BorderStyle.solid),
        elevation: 0,
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold),
      ),
    );
  }
}
