// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class Token {
  final String accessToken;
  final String refreshToken;
  @Id()
  int? id;
  Token({
    this.accessToken = '',
    this.refreshToken = '',
    this.id,
  });

  Token copyWith({
    String? accessToken,
    String? refreshToken,
    int? id,
  }) {
    return Token(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
    );
  }

  @override
  String toString() =>
      'Token(accessToken: $accessToken, refreshToken: $refreshToken, id: $id)';

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.id == id;
  }
}
