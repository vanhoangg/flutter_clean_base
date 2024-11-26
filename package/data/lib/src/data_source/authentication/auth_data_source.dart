import '../../model/responses/user/user_model.dart';
import '../../network/authentication/auth_api_service.dart';
import '../../model/request/login_request.dart';

abstract class AuthDataSource {
  Future<UserModel> login(LoginRequest loginRequest);
}

class AuthDataSourceImplementer implements AuthDataSource {
  final AuthServiceClient _authServiceClient;

  AuthDataSourceImplementer(this._authServiceClient);

  @override
  Future<UserModel> login(LoginRequest loginRequest) async {
    return await _authServiceClient.postLogin({
      'username': loginRequest.username,
      'password': loginRequest.password,
    });
  }
}
