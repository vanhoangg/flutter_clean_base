import '../../constant/end_point_constrants.dart';
import '../../constant/query_params_constrants.dart';
import '../client/auth_app_server_api_client.dart';
import '../client/base/rest_api_client.dart';
import '../model/responses/base/data_list_reponse.dart';
import '../model/responses/user/user_model.dart';

abstract class UserDataSource {
  Future<DataListResponse<UserModel?>?> getListUser();
  Future<DataListResponse<UserModel?>?> getSearchListUser(
      {required String searchParams});
  Future<DataListResponse<UserModel?>?> getFilterListUser(
      {required String queryKey, required String value});
  Future<UserModel?> getUserProfile({required String userId});
  Future<UserModel?> updateUserProfile(
      {required String userId, required Map<String, dynamic> body});
}

class UserDataSourceImplementer implements UserDataSource {
  final AuthAppServerApiClient _authAppServerApiClient;

  UserDataSourceImplementer(this._authAppServerApiClient);

  @override
  Future<DataListResponse<UserModel>?> getFilterListUser(
      {required String queryKey, required String value}) {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: EndPoint.filterUser,
      queryParameters: {
        queryKey: value,
      },
      decoder: (json) => DataListResponse.fromJson(
        json as Map<String, dynamic>,
        (json) => UserModel.fromJson(json),
      ),
    );
  }

  @override
  Future<DataListResponse<UserModel>?> getListUser() {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: EndPoint.userDomain,
      decoder: (json) => DataListResponse.fromJson(
        json as Map<String, dynamic>,
        (json) => UserModel.fromJson(json),
      ),
    );
  }

  @override
  Future<DataListResponse<UserModel>?> getSearchListUser(
      {required String? searchParams}) {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: EndPoint.searchUser,
      queryParameters: {
        QueryParam.searchParams: searchParams,
      },
      decoder: (json) => DataListResponse.fromJson(
        json as Map<String, dynamic>,
        (json) => UserModel.fromJson(json),
      ),
    );
  }

  @override
  Future<UserModel?> getUserProfile({required String userId}) {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: EndPoint.getDetailUserProfile,
      queryParameters: {
        QueryParam.userIdParams: userId,
      },
      decoder: (json) => DataListResponse.fromJson(
        json as Map<String, dynamic>,
        (json) => UserModel.fromJson(json),
      ),
    );
  }

  @override
  Future<UserModel?> updateUserProfile(
      {required String userId, required Map<String, dynamic> body}) {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: EndPoint.filterUser,
      queryParameters: {
        QueryParam.userIdParams: userId,
      },
      body: body,
      decoder: (json) => DataListResponse.fromJson(
        json as Map<String, dynamic>,
        (json) => UserModel.fromJson(json),
      ),
    );
  }
}
