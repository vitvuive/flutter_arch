class Func0<R> {
  Func0(this.function);

  final R Function() function;

  @override
  int get hashCode => 0;

  R call() {
    return function.call();
  }

  @override
  bool operator ==(dynamic other) {
    return true;
  }
}
