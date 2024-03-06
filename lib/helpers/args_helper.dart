import 'package:args/args.dart';

abstract class ArgsHelper {
  static ArgParser get _argParser => ArgParser()
    ..addOption(
      'path',
      abbr: 'p',
      help: 'The path of your postman collection file',
    );

  static ({String? path}) reslove(List<String> args) {
    final argResult = _argParser.parse(args);

    return (path: argResult['path']);
  }
}
