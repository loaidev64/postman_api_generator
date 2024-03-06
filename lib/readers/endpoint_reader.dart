import 'package:postman_api_generator/dtos/base_dto.dart';
import 'package:postman_api_generator/dtos/endpoint_dto.dart';
import 'package:postman_api_generator/dtos/variable_dto.dart';
import 'package:postman_api_generator/helpers/postman_global_configuration_helper.dart';
import 'package:postman_api_generator/readers/base_reader.dart';

class EndpointReader extends BaseConfigurationReader {
  final List<String> variables = [];

  EndpointReader({required List<VariableDTO> variableDTOs}) {
    variables.addAll(variableDTOs.map((dto) => dto.value));
  }

  @override
  List<BaseConfigurationDTO> read(Map<String, dynamic> json) {
    return (json['item'] as List)
        .map((endpoint) => EndpointDTO(
            name: endpoint['name'],
            url: _getEndpointUrl(endpoint['request']['url']['raw'])))
        .toList();
  }

  String _getEndpointUrl(String url) {
    String endpointUrl = '';
    final configurations =
        PostmanGlobalConfigutaionHelper.instance.configrations;
    for (var variable in variables) {
      endpointUrl = url.replaceAll(
          variable, "'\${${configurations.className(suffix: 'Config')}}'");
    }

    return endpointUrl;
  }
}
