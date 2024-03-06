import 'package:postman_api_generator/helpers/postman_global_configuration_helper.dart';

import '../dtos/base_dto.dart';
import 'base_writer.dart';
import '../helpers/stubs_helper.dart';

class VariablesWriter extends BaseConfigurationWriter {
  const VariablesWriter();

  @override
  void write(List<BaseConfigurationDTO> dtos) {
    final configurations =
        PostmanGlobalConfigutaionHelper.instance.configrations;
    StubsHelper.write(
        path:
            '${configurations.directoryName}/${configurations.fileName(suffix: '_config')}',
        stubName: 'config',
        data: {
          "name": configurations.className(),
          "items": dtos.map((dto) => dto.configGetter).join("\n"),
        });
  }
}
