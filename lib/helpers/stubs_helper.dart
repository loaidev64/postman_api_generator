import 'dart:io';

abstract class StubsHelper {
  static void write({
    required String path,
    required String stubName,
    required Map<String, String> data,
  }) {
    String stubContent = File('stubs/$stubName.stub').readAsStringSync();

    data.forEach((key, value) {
      stubContent = stubContent.replaceAll('{{ $key }}', value);
    });

    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsStringSync(stubContent);
  }
}
