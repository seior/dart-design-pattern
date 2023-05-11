import 'dart:developer';

import 'package:design_pattern/decorator/data_source.dart';
import 'package:design_pattern/decorator/decorator.dart';
import 'package:test/test.dart';

void main() {
  test('decorator', () async {
    final input = "Hello, World!";

    final file = EncryptionDecorator(
      FileDataSource("data.txt"),
    );

    file.writeData(input);
    final result = await file.readData();

    final plain = FileDataSource("data.txt");

    log("input : $input");
    log("encoded: ${await plain.readData()}");
    log("decoded: $result");
  });

  test('2 decorator', () async {
    final input = "Hello, World!";

    final file = CompressionDecorator(
      EncryptionDecorator(
        FileDataSource("data.txt"),
      ),
    );

    file.writeData(input);
    final result = await file.readData();

    final plain = FileDataSource("data.txt");

    log("input : $input");
    log("encoded: ${await plain.readData()}");
    log("decoded: $result");
  });
}
