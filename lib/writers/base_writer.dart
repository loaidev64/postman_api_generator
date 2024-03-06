import '../dtos/base_dto.dart';

abstract class BaseWriter {
  const BaseWriter();

  void write(List<BaseDTO> dtos);
}

abstract class BaseConfigurationWriter {
  const BaseConfigurationWriter();

  void write(List<BaseConfigurationDTO> dtos);
}
