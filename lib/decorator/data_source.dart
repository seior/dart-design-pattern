import 'dart:io';

abstract class DataSource {
  void writeData(String data);
  Future<String> readData();
}

class FileDataSource implements DataSource {
  final String _fileName;

  FileDataSource(this._fileName);

  @override
  Future<String> readData() async {
    final file = File(_fileName);

    return file.readAsString();
  }

  @override
  void writeData(String data) async {
    final file = File(_fileName);

    file.writeAsString(data);
  }
}
