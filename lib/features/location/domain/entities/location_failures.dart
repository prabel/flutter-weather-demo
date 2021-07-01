import 'package:weeath_app_demo/core/error/failures.dart';

class PermissionDeniedFailure extends Failure {
  @override
  String getMessage() {
    return 'Location permissions are denied';
  }
}

class LocationServiceDisabledFailure extends Failure {
  @override
  String getMessage() {
    return 'Location services are disabled.';
  }
}
