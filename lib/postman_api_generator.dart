import 'dart:convert';
import 'dart:io';
import 'package:postman_api_generator/dtos/postman_global_configuration_dto.dart';
import 'package:postman_api_generator/helpers/args_helper.dart';
import 'package:postman_api_generator/helpers/cli_dialog_helper.dart';
import 'package:postman_api_generator/helpers/postman_global_configuration_helper.dart';
import 'package:postman_api_generator/mixins/configuration_mixin.dart';
import 'package:postman_api_generator/mixins/endpoint_mixin.dart';

class PostmanAPIGenerator with ConfigurationMixin, EndpointMixin {
  late Map<String, dynamic> data;

  Map<String, dynamic> readPostmanCollection(String? path) {
    String finalPath = path ??
        CliDialogHelper.askQuestion(
            'What is the path of your postman collection file', 'path');
    if (!finalPath.endsWith('.json')) {
      throw Exception('Postman collection file should be a json file');
    }

    final file = File(finalPath);

    return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  }

  void init(List<String> args) {
    try {
      // resolve options
      final arguments = ArgsHelper.reslove(args);

      // read postman collection data
      data = readPostmanCollection(arguments.path);

      // adding global configurations
      PostmanGlobalConfigutaionHelper.instance.configrations =
          PostmanGlobalConfigutaionDTO.fromMap(data);
    } catch (e) {
      print(e);
    }
  }

  void reslove() {
    // resolve and write configurations file
    resolveAndWriteConfigurations(data);

    // resolve and write endpoints file
    resolveAndWriteEndpoints(data);
  }
}
