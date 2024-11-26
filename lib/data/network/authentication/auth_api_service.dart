import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constant.dart';
import '../../model/responses/user/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;

  @POST(Constant.loginPath)
  Future<UserModel> postLogin(
    @Body() Map<String, dynamic> body,
  );
  @GET(Constant.userPath)
  Future<List<UserModel>> getListUser();

  @GET(Constant.searchUserPath)
  Future<List<UserModel>> getSearchListUser(
    @Query(Constant.searchParams) String q,
  );
  @GET(Constant.filterUserPath)
  Future<List<UserModel>> getFilterListUser(
    @Query(Constant.keyParams) String key,
    @Query(Constant.valueParams) String value,
  );

  @GET(Constant.userDetailPath)
  Future<UserModel> getUserProfile(
    @Path(Constant.userIdParams) String userId,
  );

  @PUT(Constant.userDetailPath)
  Future<UserModel> putUpdateUserProfile(
    @Path(Constant.userIdParams) String userId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(Constant.userDetailPath)
  Future<bool> deleteUserProfile(
    @Path(Constant.userIdParams) String userId,
  );

  @GET(Constant.userListCartsPath)
  Future<UserModel> getUserCarts(
    @Path(Constant.userIdParams) String userId,
  );
  @GET(Constant.userListTodosPath)
  Future<UserModel> getUserTodos(
    @Path(Constant.userIdParams) String userId,
  );

  @GET(Constant.userListPostsPath)
  Future<UserModel> getUserPosts(
    @Path(Constant.userIdParams) String userId,
  );
  @PUT(Constant.todoDetailPath)
  Future<bool> putCompleteTodoTask(
    @Path(Constant.todoIdParams) String todoId,
    @Body() bool completed,
  );
  @DELETE(Constant.todoDetailPath)
  Future<bool> deleteTodoTask(
    @Path(Constant.todoIdParams) String todoId,
  );
}
