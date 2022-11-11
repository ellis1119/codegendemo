import 'package:flutter/cupertino.dart';
import 'editorFile.dart';
import 'editorStyle.dart';

class EditorModel extends ChangeNotifier {
  late int _currentPositionInFiles;
  bool _isEditing = false;
  EditorStyle? styleOptions;
  late List<String?> _languages;
  late List<EditorFile> allFiles;

  EditorModel({required List<EditorFile> files, this.styleOptions}) {
    styleOptions ??= EditorStyle();
    _languages = [];
    _currentPositionInFiles = 0;
    for (var file in files) {
      _languages.add(file.language);
    }
    allFiles = files;
  }

  List<String?> getCodeWithLanguage(String language) {
    List<String?> listOfCode = [];
    for (var file in allFiles) {
      if (file.language == language) {
        listOfCode.add(file.code);
      }
    }
    return listOfCode;
  }

  String? getCodeWithIndex(int index) {
    return allFiles[index].code;
  }

  EditorFile getFileWithIndex(int index) {
    return allFiles[index];
  }

  void changeIndexTo(int i) {
    if (_isEditing) {
      return;
    }
    _currentPositionInFiles = i;
    notify();
  }

  void toggleEditing() {
    _isEditing = !_isEditing;
    notify();
  }

  void updateCodeOfIndex(int index, String? newCode) {
    allFiles[index].code = newCode;
    // this.allFiles[index].setCode = newCode;
  }

  void notify() => notifyListeners();

  int? get position => _currentPositionInFiles;

  String? get currentLanguage => allFiles[_currentPositionInFiles].language;

  bool get isEditing => _isEditing;

  int get numberOfFiles => allFiles.length;
}
