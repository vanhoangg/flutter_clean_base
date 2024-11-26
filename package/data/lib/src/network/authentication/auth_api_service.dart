import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared/shared.dart';

import '../../constant/end_point_constrants.dart';
import '../../constant/query_params_constrants.dart';
import '../../model/responses/user/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;

  @POST(EndPoint.login)
  Future<UserModel> postLogin(
    @Body() Map<String, dynamic> body,
  );
  @GET(EndPoint.userDomain)
  Future<List<UserModel>> getListUser();

  @GET(EndPoint.searchUser)
  Future<List<UserModel>> getSearchListUser(
    @Query(QueryParam.searchParams) String q,
  );
  @GET(EndPoint.filterUser)
  Future<List<UserModel>> getFilterListUser(
    @Query(QueryParam.keyParams) String key,
    @Query(QueryParam.valueParams) String value,
  );

  @GET(EndPoint.userDetail)
  Future<UserModel> getUserProfile(
    @Path(QueryParam.userIdParams) String userId,
  );

  @PUT(EndPoint.userDetail)
  Future<UserModel> putUpdateUserProfile(
    @Path(QueryParam.userIdParams) String userId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(EndPoint.userDetail)
  Future<bool> deleteUserProfile(
    @Path(QueryParam.userIdParams) String userId,
  );

  @GET(EndPoint.userListCarts)
  Future<UserModel> getUserCarts(
    @Path(QueryParam.userIdParams) String userId,
  );
  @GET(EndPoint.userListTodos)
  Future<UserModel> getUserTodos(
    @Path(QueryParam.userIdParams) String userId,
  );

  @GET(EndPoint.userListPosts)
  Future<UserModel> getUserPosts(
    @Path(QueryParam.userIdParams) String userId,
  );
  @PUT(EndPoint.todoDetail)
  Future<bool> putCompleteTodoTask(
    @Path(QueryParam.todoIdParams) String todoId,
    @Body() bool completed,
  );
  @DELETE(EndPoint.todoDetail)
  Future<bool> deleteTodoTask(
    @Path(QueryParam.todoIdParams) String todoId,
  );
}
