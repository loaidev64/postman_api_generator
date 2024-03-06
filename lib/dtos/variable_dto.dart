import 'base_dto.dart';
import 'package:recase/recase.dart';

class VariableDTO extends BaseConfigurationDTO {
  final String key;
  final String value;

  VariableDTO({required this.key, required this.value});

  factory VariableDTO.fromMap(Map<String, dynamic> map) => VariableDTO(
        key: map['key'],
        value: map['value'],
      );

  @override
  String get configGetter => "static const String ${key.camelCase} = '$value';";
}
