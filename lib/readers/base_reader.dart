import '../dtos/base_dto.dart';

abstract class BaseReader {
  const BaseReader();

  List<BaseDTO> read(Map<String, dynamic> json);
}

abstract class BaseConfigurationReader {
  const BaseConfigurationReader();

  List<BaseConfigurationDTO> read(Map<String, dynamic> json);
}
