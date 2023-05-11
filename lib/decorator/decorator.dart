import 'dart:convert';

import 'package:design_pattern/decorator/data_source.dart';

class DataSourceDecorator implements DataSource {
  final DataSource _wrapper;

  DataSourceDecorator(this._wrapper);

  @override
  Future<String> readData() {
    return _wrapper.readData();
  }

  @override
  void writeData(String data) {
    _wrapper.writeData(data);
  }
}

class EncryptionDecorator extends DataSourceDecorator {
  EncryptionDecorator(DataSource wrapper) : super(wrapper);

  @override
  Future<String> readData() async {
    return _decode(await super.readData());
  }

  @override
  void writeData(String data) {
    super.writeData(_encode(data));
  }

  String _encode(String data) {
    final result = base64.encode(data.codeUnits);

    return result;
  }

  String _decode(String data) {
    final result = base64.decode(data);
    return String.fromCharCodes(result);
  }
}

class CompressionDecorator extends DataSourceDecorator {
  CompressionDecorator(DataSource wrapper) : super(wrapper);

  @override
  Future<String> readData() async {
    return _decompress(await super.readData());
  }

  @override
  void writeData(String data) {
    super.writeData(_compress(data));
  }

  String _compress(String data) {
    final result = data;

    return result.toString();
  }

  String _decompress(String data) {
    final result = data;

    return result;
  }
}
