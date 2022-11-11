class EditorFile {
  late String name;
  String? language;
  String? code;

  EditorFile({String? name, String? language, String? code}) {
    this.name = name ?? "file.${language ?? 'txt'}";
    this.language = language ?? "text";
    this.code = code ?? "";
  }
}
