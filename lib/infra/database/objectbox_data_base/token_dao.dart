import 'package:ddd_arch/infra/database/objectbox_data_base/models/token.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@lazySingleton
class TokenDao {
  TokenDao(this.store);

  final Store store;

  int putToken(Token token) {
    return store.box<Token>().put(token);
  }

  Token? getToken() {
    final tokens = store.box<Token>().getAll();
    return tokens.isNotEmpty ? tokens.first : null;
  }

  int deleteAllToken() {
    return store.box<Token>().removeAll();
  }
}
