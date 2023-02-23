class PagingSetting {
  PagingSetting._();

  /// some backend have init page from 0;
  static const int initPage = 1;

  static const int size = 20;

  static const threshHold = 200;
}
