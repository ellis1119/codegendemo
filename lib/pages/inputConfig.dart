import 'package:codegensystem/pages/fieldList.dart';
import 'package:codegensystem/pages/importAlert.dart';
import 'package:codegensystem/pages/importAuto.dart';
import 'package:codegensystem/pages/importSql.dart';
import 'package:codegensystem/pages/inputAlert.dart';
import 'package:flutter/material.dart';

class InputConfig extends StatefulWidget {
  final Function(String? table, String? library, String? notes, String? number)?
      onSubmitted;

  const InputConfig({this.onSubmitted, Key? key}) : super(key: key);

  @override
  InputConfigState createState() => InputConfigState();
}

class InputConfigState extends State<InputConfig>
    with SingleTickerProviderStateMixin {
  late String table, library, notes, number;
  String? tableError, libraryError, notesError, numberError;
  late Animation<double> animation;
  late AnimationController controller;
  late AnimationStatus animationStatus = AnimationStatus.reverse;
  late double animationValue = 0;

  Function(String? table, String? library, String? notes, String? number)?
      get onSubmitted => widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    table = "";
    library = "";
    notes = "";
    number = "";

    tableError = null;
    libraryError = null;
    notesError = null;
    numberError = null;
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  void resetErrorText() {
    setState(() {
      tableError = null;
      libraryError = null;
      notesError = null;
      numberError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp numberExp = RegExp(r"^[1-9]\d*|0$");

    bool isValid = true;
    if (number.isEmpty || !numberExp.hasMatch(number)) {
      setState(() {
        numberError = "??????????????????????????????";
      });
      isValid = false;
    }

    if (table.isEmpty) {
      setState(() {
        tableError = "??????????????????";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(table, library, notes, number);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            controller: ScrollController(),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.005,
                                            vertical: screenHeight * 0.01),
                                        child: ImpButton(
                                          text: "?????????",
                                          onPressed: () => {
                                            Navigator.of(context).push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (BuildContext
                                                context,
                                                    Animation<double>
                                                    animation,
                                                    Animation
                                                    secondaryAnimation) =>
                                                    FadeTransition(
                                                        opacity: animation,
                                                        child:
                                                        const InputAlert()))),
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
                                          text: "????????????",
                                          onPressed: () => {
                                            Navigator.of(context).push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (BuildContext
                                                            context,
                                                        Animation<double>
                                                            animation,
                                                        Animation
                                                            secondaryAnimation) =>
                                                    FadeTransition(
                                                        opacity: animation,
                                                        child:
                                                            const ImportAuto()))),
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
                                          text: "????????????",
                                          onPressed: () => {
                                            Navigator.of(context).push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (BuildContext
                                                            context,
                                                        Animation<double>
                                                            animation,
                                                        Animation
                                                            secondaryAnimation) =>
                                                    FadeTransition(
                                                        opacity: animation,
                                                        child:
                                                            const ImportAlert()))),
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
                                          text: "??????SQL",
                                          onPressed: () => {
                                            Navigator.of(context).push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (BuildContext
                                                            context,
                                                        Animation<double>
                                                            animation,
                                                        Animation
                                                            secondaryAnimation) =>
                                                    FadeTransition(
                                                        opacity: animation,
                                                        child:
                                                            const ImportSql()))),
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              library = value;
                                            });
                                          },
                                          labelText: "??????",
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              table = value;
                                            });
                                          },
                                          labelText: "??????",
                                          errorText: tableError,
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              notes = value;
                                            });
                                          },
                                          labelText: "?????????",
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.01,
                                            vertical: screenHeight * 0.01),
                                        child: InputField(
                                          onChanged: (value) {
                                            setState(() {
                                              number = value;
                                            });
                                          },
                                          labelText: "????????????",
                                          errorText: numberError,
                                          textInputAction: TextInputAction.next,
                                          autoFocus: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    const FieldList(),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 6.0, right: 6.0, bottom: 30.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: SubButton(
                                        text: "????????????",
                                        onPressed: submit,
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ],
                ),
              ]);
            }));
  }
}


class SubButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const SubButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
            width: 0.6, color: Colors.grey, style: BorderStyle.solid),
        elevation: 0,
        primary: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
      ),
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

class IncButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const IncButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(66, 66, 74, 0.85),
            Color.fromRGBO(41, 50, 60, 0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/*
class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const FormButton({this.text = "", this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(6, 190, 182, 1),
            Color.fromRGBO(72, 177, 191, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // Round the DecoratedBox to match ElevatedButton
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: screenHeight * .025),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
*/
class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;

  const InputField(
      {this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.errorText,
      this.keyboardType,
      this.textInputAction,
      this.autoFocus = false,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
