import '../../model/responses/user/user_model.dart';
import '../../network/authentication/auth_api_service.dart';
import '../../model/request/login_request.dart';

abstract class TodoDataSource {
  Future<UserModel?> login(LoginRequest loginRequest);
}

class TodoDataSourceImplementer implements TodoDataSource {
  final AuthServiceClient _authServiceClient;

  TodoDataSourceImplementer(this._authServiceClient);

  @override
  Future<UserModel?> login(LoginRequest loginRequest) async {
    return await _authServiceClient.postLogin({
      'username': loginRequest.username,
      'password': loginRequest.password,
    });
  }
}
