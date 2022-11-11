import 'package:flutter/material.dart';

import 'editorTheme.dart';

class EditorStyle {
  final EdgeInsets padding;

  final double heightOfContainer;

  final Map<String, TextStyle> theme;

  final String fontFamily;

  final double? letterSpacing;

  final double fontSize;

  final double lineHeight;

  final int tabSize;

  final Color editorColor;

  final Color editorBorderColor;

  final Color editorFilenameColor;

  final Color editorToolButtonColor;

  final Color editorToolButtonTextColor;

  final double? fontSizeOfFilename;

  final TextStyle textStyleOfTextField;

  final Color editButtonBackgroundColor;

  final Color editButtonTextColor;

  final String editButtonName;

  final ToolbarOptions toolbarOptions;
  final bool placeCursorAtTheEndOnEdit;

  static const Color defaultColorEditor = Colors.black;
  static const Color defaultColorBorder = Colors.white60;
  static const Color defaultColorFileName = Colors.white;
  static const Color defaultToolButtonColor = Color.fromRGBO(15, 32, 39, 1);
  static const Color defaultEditBackgroundColor = Colors.white;

  EditorStyle(
      {this.padding =
          const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      this.heightOfContainer = 800,
      this.theme = myTheme,
      this.fontFamily = "monospace",
      this.letterSpacing = 1.25,
      this.fontSize = 16,
      this.lineHeight = 1.5,
      this.tabSize = 2,
      this.editorColor = defaultColorEditor,
      this.editorBorderColor = defaultColorBorder,
      this.editorFilenameColor = defaultColorFileName,
      this.editorToolButtonColor = defaultToolButtonColor,
      this.editorToolButtonTextColor = Colors.white,
      this.editButtonBackgroundColor = defaultEditBackgroundColor,
      this.editButtonTextColor = Colors.black,
      this.editButtonName = "编辑",
      this.fontSizeOfFilename,
      this.textStyleOfTextField = const TextStyle(
        color: Colors.black,
        fontSize: 16,
        letterSpacing: 1.25,
        height: 1.5,
      ),
      this.toolbarOptions = const ToolbarOptions(),
      this.placeCursorAtTheEndOnEdit = true});

  double? editButtonPosTop;
  double? editButtonPosLeft;
  double? editButtonPosBottom = 20;
  double? editButtonPosRight = 20;

  void defineEditButtonPosition({
    required top,
    left,
    bottom,
    right,
  }) {
    editButtonPosTop = top;
    editButtonPosLeft = left;
    editButtonPosBottom = bottom;
    editButtonPosRight = right;
  }
}
