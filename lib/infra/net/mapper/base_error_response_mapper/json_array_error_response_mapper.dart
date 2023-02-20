import 'package:ddd_arch/core/exception/remote/server_error.dart';
import 'package:ddd_arch/core/exception/remote/server_error_detail.dart';
import 'package:ddd_arch/infra/net/mapper/base/base_error_response_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
// ignore: avoid-dynamic
class JsonArrayErrorResponseMapper
    extends BaseErrorResponseMapper<List<dynamic>> {
  @override
  // ignore: avoid-dynamic
  ServerError mapToEntity(List<dynamic>? data) {
    return ServerError(
      errors: data
              ?.map(
                (jsonObject) => ServerErrorDetail(
                  serverStatusCode: jsonObject['code'] as int,
                  message: jsonObject['message'] as String,
                ),
              )
              .toList(growable: false) ??
          [],
    );
  }
}
