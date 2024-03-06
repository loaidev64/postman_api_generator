import 'package:recase/recase.dart';

class PostmanGlobalConfigutaionDTO {
  String name;

  String fileName({String suffix = ''}) => '${name.snakeCase}$suffix.dart';

  String className({String suffix = ''}) => '${name.pascalCase}$suffix';

  String get directoryName => name.snakeCase;

  PostmanGlobalConfigutaionDTO({required this.name});

  factory PostmanGlobalConfigutaionDTO.empty() =>
      PostmanGlobalConfigutaionDTO(name: '');

  factory PostmanGlobalConfigutaionDTO.fromMap(Map<String, dynamic> map) =>
      PostmanGlobalConfigutaionDTO(name: map['info']['name']);
}
