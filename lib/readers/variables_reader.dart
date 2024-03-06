import '../dtos/base_dto.dart';
import '../dtos/variable_dto.dart';
import 'base_reader.dart';

class VariablesReader extends BaseConfigurationReader {
  const VariablesReader();

  @override
  List<BaseConfigurationDTO> read(Map<String, dynamic> json) {
    return (json['variable'] as List)
        .map((variable) => VariableDTO.fromMap(variable))
        // .where((variable) => variable.key.toLowerCase().contains('url'))
        .toList();
  }
}
