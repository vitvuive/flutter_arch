import 'package:ddd_arch/core/exception/remote/server_error.dart';
import 'package:ddd_arch/infra/net/mapper/base_error_response_mapper/json_array_error_response_mapper.dart';
import 'package:ddd_arch/infra/net/mapper/base_error_response_mapper/json_object_error_response_mapper.dart';
import 'package:ddd_arch/shared/model/enum/shared_enum.dart';

import 'base_data_mapper.dart';

abstract class BaseErrorResponseMapper<T>
    extends BaseDataMapper<T, ServerError> {
  const BaseErrorResponseMapper();

  factory BaseErrorResponseMapper.fromType(ErrorResponseMapperType type) {
    switch (type) {
      case ErrorResponseMapperType.jsonArray:
        return JsonArrayErrorResponseMapper() as BaseErrorResponseMapper<T>;
      case ErrorResponseMapperType.jsonObject:
        return JsonObjectErrorResponseMapper() as BaseErrorResponseMapper<T>;
    }
  }
}
