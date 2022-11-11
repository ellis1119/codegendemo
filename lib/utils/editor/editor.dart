import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'editorButton.dart';
import 'editorFile.dart';
import 'editorModel.dart';
import 'editorStyle.dart';

class Editor extends StatefulWidget {
  EditorModel? model;
  final Function(String? language, String? value)? onSubmit;

  final bool edit;

  final bool disableNavigationbar;

  final TextEditingController? textEditingController;

   Editor({
    Key? key,
    this.model,
    this.onSubmit,
    this.edit = true,
    this.disableNavigationbar = false,
    this.textEditingController,
  }) : super(key: key);

  @override
  EditorState createState() => EditorState();
}

class EditorState extends State<Editor> {
  late TextEditingController editingController;

  String? newValue;

  FocusNode focusNode = FocusNode();

  static final GlobalKey<FormState> editableTextKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.textEditingController != null) {
      // Use the user-provide controller
      editingController = widget.textEditingController!;
    } else {
      editingController = TextEditingController(text: "");
    }
    newValue = ""; // if there are no changes
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  void placeCursorAtTheEnd() {
    editingController.selection = TextSelection.fromPosition(
      TextPosition(offset: editingController.text.length),
    );
  }

  void placeCursor(int pos) {
    try {
      editingController.selection = TextSelection.fromPosition(
        TextPosition(offset: pos),
      );
    } catch (e) {
      throw Exception("code_editor : placeCursor(int pos), pos is not valid.");
    }
  }

  @override
  Widget build(BuildContext context) {
    EditorModel model = widget.model ??= EditorModel(files: []);

    EditorStyle? opt = model.styleOptions;

    String? language = model.currentLanguage;

    int? position = model.position;

    String? code = model.getCodeWithIndex(position ?? 0);

    bool disableNavigationbar = widget.disableNavigationbar;

    editingController = TextEditingController(text: code);
    newValue = code;

    Text showFilename(String name, bool isSelected) {
      return Text(
        name,
        style: TextStyle(
          fontFamily: "monospace",
          letterSpacing: 1.0,
          fontWeight: FontWeight.normal,
          fontSize: opt?.fontSizeOfFilename,
          color: isSelected
              ? opt?.editorFilenameColor
              : opt?.editorFilenameColor.withOpacity(0.5),
        ),
      );
    }

    Container buildNavbar() {
      return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: opt?.editorColor,
          border: Border(
              bottom: BorderSide(color: opt?.editorBorderColor ?? Colors.blue)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 15),
          itemCount: model.numberOfFiles,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            final EditorFile file = model.getFileWithIndex(index);

            return Container(
              margin: const EdgeInsets.only(right: 15),
              child: Center(
                child: GestureDetector(
                  // Checks if the position of the navbar is the current file.
                  child: showFilename(file.name, model.position == index),
                  onTap: () {
                    setState(() {
                      model.changeIndexTo(index);
                    });
                  },
                ),
              ),
            );
          },
        ),
      );
    }

    SingleChildScrollView buildEditableText() {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: 50,
          ),
          child: TextField(
            decoration: const InputDecoration(border: InputBorder.none),
            autofocus: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: opt?.textStyleOfTextField,
            focusNode: focusNode,
            controller: editingController,
            onChanged: (String v) => newValue = v,
            key: editableTextKey,
            toolbarOptions: model.styleOptions?.toolbarOptions,
          ),
        ),
      );
    }

    Widget editButton(String name, Function() press) {
      if (widget.edit == true) {
        return Positioned(
          bottom: opt?.editButtonPosBottom,
          right: opt?.editButtonPosRight,
          top: (model.isEditing &&
                  opt != null &&
                  opt.editButtonPosTop != null &&
                  opt.editButtonPosTop! < 50)
              ? 50
              : opt?.editButtonPosTop,
          left: opt?.editButtonPosLeft,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: model.isEditing ? Colors.black :Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: press,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: "monospace",
                fontWeight: FontWeight.bold,
                color:  model.isEditing ? Colors.white :Colors.black,
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    void insertIntoTextField(String str, {int diff = 0}) {
      int pos = editingController.selection.baseOffset;
      String baseText = editingController.text;
      String begin = baseText.substring(0, pos) + str;
      if (baseText.length == pos) {
        editingController.text = begin;
      } else {
        String end = baseText.substring(pos, baseText.length);
        editingController.text = begin + end;
      }
      newValue = editingController.text;
      placeCursor(pos + str.length + diff);
    }

    Widget toolBar() {
      List<EditorButton> toolButtons = [
        EditorButton(
          press: () => insertIntoTextField("insert"),
          icon: Icons.playlist_add,
        ),
        EditorButton(
          press: () => insertIntoTextField("delete"),
          icon: Icons.playlist_remove,
        ),
        EditorButton(
          press: () => insertIntoTextField("select"),
          icon: Icons.playlist_play,
        ),
        EditorButton(
          press: () => insertIntoTextField("update"),
          icon: Icons.playlist_add_check,
        ),
        EditorButton(
          press: () => insertIntoTextField("join"),
          icon: Icons.arrow_right_alt,
        ),
        EditorButton(
          press: () => insertIntoTextField("from"),
          icon: Icons.label_outline,
        ),
        EditorButton(
          press: () => insertIntoTextField("*"),
          symbol: "*",
        ),
        EditorButton(
          press: () => insertIntoTextField('()', diff: -1),
          symbol: "()",
        ),
      ];

      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: opt?.editorColor,
          border: Border(
              bottom: BorderSide(color: opt?.editorBorderColor ?? Colors.blue)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: toolButtons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            final EditorButton btn = toolButtons[index];
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: opt?.editorToolButtonColor,
                ),
                onPressed: btn.press as void Function()?,
                child: btn.icon == null
                    ? Text(
                        btn.symbol ?? "",
                        style: TextStyle(
                          color: opt?.editorToolButtonTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "monospace",
                        ),
                      )
                    : FaIcon(
                        btn.icon,
                        color: opt?.editorToolButtonTextColor,
                        size: 15,
                      ),
              ),
            );
          },
        ),
      );
    }

    if (model.isEditing &&
        (model.styleOptions?.placeCursorAtTheEndOnEdit ?? true)) {
      placeCursorAtTheEnd();
    }

    Widget buildContentEditor() {
      return model.isEditing
          ? Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    toolBar(),
                    Container(
                      width: double.infinity,
                      height: opt?.heightOfContainer,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: buildEditableText(),
                    ),
                  ],
                ),
                editButton("确定", () {
                  setState(() {
                    model.updateCodeOfIndex(position ?? 0, newValue);
                    model.toggleEditing();
                    widget.onSubmit?.call(language, newValue);
                  });
                }),
              ],
            )
          : Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: opt?.heightOfContainer,
                  color: opt?.editorColor,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: opt?.padding ?? const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          HighlightView(
                            code ?? "代码为空",
                            language: language,
                            theme: opt?.theme ?? githubTheme,
                            tabSize: opt?.tabSize ?? 4,
                            textStyle: TextStyle(
                              fontFamily: opt?.fontFamily,
                              letterSpacing: opt?.letterSpacing,
                              fontSize: opt?.fontSize,
                              height: opt?.lineHeight, // line-height
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                editButton(opt?.editButtonName ?? "编辑", () {
                  setState(() {
                    model.toggleEditing();
                  });
                }),
              ],
            );
    }

    return Column(
      children: <Widget>[
        disableNavigationbar ? const SizedBox.shrink() : buildNavbar(),
        buildContentEditor(),
      ],
    );
  }
}
