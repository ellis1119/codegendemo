import 'package:codegensystem/utils/sliCard.dart';
import 'package:flutter/material.dart';

class FieldList extends StatefulWidget {
  final Function(String? field)? onSubmitted;

  const FieldList({this.onSubmitted, Key? key}) : super(key: key);

  @override
  FieldListState createState() => FieldListState();
}

class FieldListState extends State<FieldList> {
  late String field;
  late String type;
  late String def;
  late String notes;
  bool empty = false;
  bool pri = false;
  bool auto = false;

  String? fieldError;

  Function(String? field)? get onSubmitted => widget.onSubmitted;

  final List<Map<dynamic, dynamic>> _fieldArr = [
    {
      'field': '',
      'type': '',
      'def': '',
      'notes': '',
      'empty': false,
      'pri': false,
      'auto': false,
      'status': 0
    }
  ];

  void add() {
    setState(() {
      _fieldArr.add({
        'field': '',
        'type': '',
        'def': '',
        'notes': '',
        'empty': false,
        'pri': false,
        'auto': false,
        'status': 0
      });
    });
  }

  void remove(int i) {
    setState(() {
      _fieldArr.removeAt(i);
    });
  }

  @override
  void initState() {
    super.initState();
    field = "";
    fieldError = null;
  }

  void resetErrorText() {
    setState(() {
      fieldError = null;
    });
  }

  bool isValid = true;

  bool validate() {
    resetErrorText();
    if (field.isEmpty) {
      setState(() {
        fieldError = "字段名不能为空";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(field);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        if (_fieldArr.isNotEmpty)
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 12.0),
                      child: SizedBox(
                          height: 450.0,
                          child: ListView.builder(
                              controller: ScrollController(),
                              scrollDirection: Axis.vertical,
                              itemCount: _fieldArr.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 19.0),
                                    child: Column(children: <Widget>[
                                      if (_fieldArr[index]['status'] == 0) ...[
                                        SliCard(
                                          topCardWidget: Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                                child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      InputField(
                                                                        onChanged:
                                                                            (value) {
                                                                          field =
                                                                              value;
                                                                          setState(
                                                                              () {
                                                                            _fieldArr[index]['field'] =
                                                                                field;
                                                                          });
                                                                        },
                                                                        labelText:
                                                                            "字段名",
                                                                        errorText:
                                                                            fieldError,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        autoFocus:
                                                                            true,
                                                                      ),
                                                                    ])),
                                                          ),
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                                child:
                                                                    DecoratedBox(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed: _fieldArr[index]['status'] ==
                                                                            0
                                                                        ? () =>
                                                                            {
                                                                              setState(() {
                                                                                _fieldArr[index]['status'] = 1;
                                                                              })
                                                                            }
                                                                        : () =>
                                                                            {},
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      elevation:
                                                                          0,
                                                                      primary:
                                                                          Colors
                                                                              .white,
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              16.0,
                                                                          horizontal:
                                                                              5.0),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "保存",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                              child:
                                                                  DecoratedBox(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () => {
                                                                    setState(
                                                                        () {
                                                                      remove(
                                                                          index);
                                                                    })
                                                                    //   remove(index)
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    elevation:
                                                                        0,
                                                                    primary: Colors
                                                                        .black54,
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            16.0,
                                                                        horizontal:
                                                                            5.0),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Text(
                                                                    "删除",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ))),
                                            ],
                                          ),
                                          bottomCardWidget: Column(
                                            children: <Widget>[
                                              Flexible(
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          screenWidth *
                                                                              0.005),
                                                              child: InputField(
                                                                onChanged:
                                                                    (value) {
                                                                  type = value;

                                                                  setState(() {
                                                                    _fieldArr[index]
                                                                            [
                                                                            'type'] =
                                                                        type;
                                                                  });
                                                                },
                                                                labelText:
                                                                    "字段类型",
                                                                //  errorText: usernameError,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                autoFocus: true,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          screenWidth *
                                                                              0.005),
                                                              child: InputField(
                                                                onChanged:
                                                                    (value) {
                                                                  def = value;
                                                                  setState(() {
                                                                    _fieldArr[
                                                                            index]
                                                                        [
                                                                        'def'] = def;
                                                                  });
                                                                },
                                                                labelText:
                                                                    "默认值",
                                                                //  errorText: usernameError,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                autoFocus: true,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          screenWidth *
                                                                              0.005),
                                                              child: InputField(
                                                                onChanged:
                                                                    (value) {
                                                                  notes = value;
                                                                  setState(() {
                                                                    _fieldArr[index]
                                                                            [
                                                                            'notes'] =
                                                                        notes;
                                                                  });
                                                                },
                                                                labelText: "注释",
                                                                //  errorText: usernameError,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                autoFocus: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ))),
                                              Flexible(
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    void Function(
                                                                            void
                                                                                Function())
                                                                        setState) {
                                                                  return CheckboxListTile(
                                                                    title:
                                                                        const Text(
                                                                            "主键"),
                                                                    value: _fieldArr[
                                                                            index]
                                                                        ['pri'],
                                                                    onChanged:
                                                                        (value) {
                                                                      pri =
                                                                          value!;
                                                                      setState(
                                                                          () {
                                                                        _fieldArr[index]['pri'] =
                                                                            pri;
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                              )),
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    void Function(
                                                                            void
                                                                                Function())
                                                                        setState) {
                                                                  return CheckboxListTile(
                                                                    title:
                                                                        const Text(
                                                                            "非空"),
                                                                    value: _fieldArr[
                                                                            index]
                                                                        [
                                                                        'empty'],
                                                                    onChanged:
                                                                        (value) {
                                                                      empty =
                                                                          value!;
                                                                      setState(
                                                                          () {
                                                                        _fieldArr[index]['empty'] =
                                                                            empty;
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                              )),
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    void Function(
                                                                            void
                                                                                Function())
                                                                        setState) {
                                                                  return CheckboxListTile(
                                                                      title: const Text(
                                                                          "自增"),
                                                                      value: _fieldArr[
                                                                              index]
                                                                          [
                                                                          'auto'],
                                                                      onChanged:
                                                                          (value) {
                                                                        auto =
                                                                            value!;
                                                                        setState(
                                                                            () {
                                                                          _fieldArr[index]['auto'] =
                                                                              auto;
                                                                        });
                                                                      });
                                                                },
                                                              ))
                                                        ],
                                                      ))),
                                            ],
                                          ),
                                        )
                                      ] else ...[
                                        Card(
                                          color: const Color.fromRGBO(
                                              238, 242, 243, 1),
                                          elevation: 0,
                                          // 阴影高度
                                          borderOnForeground: false,
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth * 0.01,
                                                  right: screenWidth * 0.01,
                                                  top: 10.0,
                                                  bottom: 5.0),
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 20.0,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '字段名：${_fieldArr[index]['field']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 20.0,
                                                            right: 10.0,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '字段类型：${_fieldArr[index]['type']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 2.0,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '默认值：${_fieldArr[index]['def']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 2.0,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '注释：${_fieldArr[index]['notes']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 15,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '主键：${_fieldArr[index]['pri']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 10,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '非空：${_fieldArr[index]['empty']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 2.0,
                                                            right: 10,
                                                            bottom: 4.0),
                                                        child: Text(
                                                          '自增：${_fieldArr[index]['auto']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1.4),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    alignment:
                                                        const Alignment(1, 1),
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: ElevatedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            remove(index);
                                                          })
                                                          //   remove(index)
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 0,
                                                          primary:
                                                              Colors.black54,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      15.0,
                                                                  horizontal:
                                                                      25.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          "删除",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ]));
                              }))))
            ],
          ),
        Row(
          children: <Widget>[
            Flexible(
                child: Container(
                    margin: const EdgeInsets.only(
                        left: 6.0, right: 6.0, bottom: 60.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: IncButton(
                            text: "新增字段",
                            onPressed: add,
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ],
    );
  }
}

class IncButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const IncButton({this.text = "", this.onPressed, Key? key}) : super(key: key);

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
