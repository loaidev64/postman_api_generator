import 'package:postman_api_generator/dtos/variable_dto.dart';
import 'package:postman_api_generator/readers/variables_reader.dart';
import 'package:postman_api_generator/writers/variables_writer.dart';

mixin ConfigurationMixin {
  final _variableReader = VariablesReader();
  final _variableWriter = VariablesWriter();

  final List<VariableDTO> variables = [];

  void resolveAndWriteConfigurations(Map<String, dynamic> data) {
    variables.addAll(_variableReader.read(data) as List<VariableDTO>);
    _variableWriter.write(variables);
  }
}
