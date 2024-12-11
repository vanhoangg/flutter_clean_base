import '../../constant/end_point_constrants.dart';
import '../client/auth_app_server_api_client.dart';
import '../client/base/rest_api_client.dart';
import '../model/responses/base/data_response.dart';
import '../model/responses/user/user_model.dart';
import '../model/request/login_request.dart';

abstract class AuthDataSource {
  Future<DataResponse<UserModel?>?> login(LoginRequest loginRequest);
}

class AuthDataSourceImplementer implements AuthDataSource {
  final AuthAppServerApiClient _authAppServerApiClient;

  AuthDataSourceImplementer(this._authAppServerApiClient);

  @override
  Future<DataResponse<UserModel?>?> login(LoginRequest loginRequest) async {
    return _authAppServerApiClient.request(
        method: RestMethod.post,
        path: EndPoint.login,
        body: {
          'username': loginRequest.username,
          'password': loginRequest.password,
        },
        decoder: (json) => UserModel.fromJson(json as Map<String, dynamic>));
  }
}
