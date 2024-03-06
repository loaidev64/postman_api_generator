import 'package:postman_api_generator/postman_api_generator.dart';

void main(List<String> arguments) {
  final generator = PostmanAPIGenerator();

  generator.init(arguments);

  generator.reslove();
}
