import 'package:shared/shared.dart';

import 'base_success_response_mapper/data_json_array_response_mapper.dart';
import 'base_success_response_mapper/data_json_object_reponse_mapper.dart';

enum SuccessResponseMapperType {
  dataJsonObject,
  dataJsonArray,
}

abstract class BaseSuccessResponseMapper<I extends Object, O extends Object> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    return switch (type) {
      SuccessResponseMapperType.dataJsonObject =>
        DataJsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.dataJsonArray =>
        DataJsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
    };
  }

  // ignore: avoid-dynamic
  O? map({
    required dynamic response,
    Decoder<I>? decoder,
  }) {
    assert(response != null);
    try {
      return mapToDataModel(response: response, decoder: decoder);
    } on RemoteException catch (_) {
      rethrow;
    } catch (e) {
      throw RemoteException(
          kind: RemoteExceptionKind.decodeError, rootException: e);
    }
  }

  // ignore: avoid-dynamic
  O? mapToDataModel({
    required dynamic response,
    Decoder<I>? decoder,
  });
}
