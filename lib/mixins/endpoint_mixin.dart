import 'package:postman_api_generator/dtos/endpoint_dto.dart';
import 'package:postman_api_generator/mixins/configuration_mixin.dart';
import 'package:postman_api_generator/readers/endpoint_reader.dart';

mixin EndpointMixin on ConfigurationMixin {
  late final _endpointReader = EndpointReader(variableDTOs: variables);
  // final _endpointWriter = endpointsWriter();

  void resolveAndWriteEndpoints(Map<String, dynamic> data) {
    final parentItems = data['item'] as List;
    final endpoints = <EndpointDTO>[];
    for (Map<String, dynamic> item in parentItems) {
      if (!item.containsKey('item')) {
        continue;
      }
      endpoints.addAll(_endpointReader.read(item) as List<EndpointDTO>);
    }
    print(endpoints.length);
    // _endpointWriter.write(endpoints);
  }
}
