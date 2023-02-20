import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/data_json_array_response_mapper.dart';
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/data_json_object_response_mapper.dart';
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_array_response_mapper.dart';
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_object_response_mapper.dart';
import 'package:ddd_arch/shared/model/enum/shared_enum.dart';
import 'package:ddd_arch/shared/model/typedef.dart';

abstract class BaseSuccessResponseMapper<I, O> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    switch (type) {
      case SuccessResponseMapperType.dataJsonObject:
        return DataJsonObjectResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.dataJsonArray:
        return DataJsonArrayResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonObject:
        return JsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonArray:
        return JsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
    }
  }

  O map(dynamic response, Decoder<I>? decoder);
}
