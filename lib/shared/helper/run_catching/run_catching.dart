import '../../config/data_result.dart';
import '../../exception/base/app_exception.dart';

Result<AppException, T> runCatching<T>({
  required T Function() action,
}) {
  try {
    return Success(action.call());
  } on AppException catch (e) {
    return Failure(e);
  }
}

Future<Result<AppException, T>> runAsyncCatching<T>({
  required Future<T> Function() action,
}) async {
  try {
    final output = await action.call();

    return Success(output);
  } on AppException catch (e) {
    return Failure(e);
  }
}
