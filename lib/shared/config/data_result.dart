sealed class Result<E extends Exception, S> {
  const Result();
}

final class Success<E extends Exception, S> extends Result<E, S> {
  const Success(this.value);
  final S value;
}

final class Failure<E extends Exception, S> extends Result<E, S> {
  const Failure(this.exception);
  final E exception;
}
