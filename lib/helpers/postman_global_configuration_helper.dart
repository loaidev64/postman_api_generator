import 'package:postman_api_generator/dtos/postman_global_configuration_dto.dart';

class PostmanGlobalConfigutaionHelper {
  PostmanGlobalConfigutaionDTO configrations =
      PostmanGlobalConfigutaionDTO.empty();
  PostmanGlobalConfigutaionHelper();

  factory PostmanGlobalConfigutaionHelper._() =>
      PostmanGlobalConfigutaionHelper();

  static final PostmanGlobalConfigutaionHelper instance =
      PostmanGlobalConfigutaionHelper._();
}
