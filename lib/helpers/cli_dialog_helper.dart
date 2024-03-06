import 'package:cli_dialog/cli_dialog.dart';

abstract class CliDialogHelper {
  static String askQuestion(String question, String fieldName,
      {bool required = false}) {
    final dialog = CLI_Dialog()..addQuestion(question, fieldName);

    final answers = dialog.ask();

    if (required &&
        (answers[fieldName] == null || answers[fieldName].toString().isEmpty)) {
      throw Exception('This field is required');
    }

    return answers[fieldName].toString();
  }
}
