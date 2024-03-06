import 'package:postman_api_generator/dtos/base_dto.dart';

class EndpointDTO extends BaseConfigurationDTO {
  final String name;

  final String url;

  EndpointDTO({required this.name, required this.url});

  @override
  String get configGetter => throw UnimplementedError();
}
