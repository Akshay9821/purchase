
import 'package:purchase/service/app_exception.dart';
import 'package:purchase/utils/dialog_helper.dart';

class ErrorController {
   void handleError(error) {
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog("Error", error.message);
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog("Error", error.message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog("Error", error.message);
    } else if (error is UnauthorizedException) {
      DialogHelper.showErrorDialog("Error", error.message);
    }
  }
}
