abstract class QueryUseCase<R> {
  R call();
}

abstract class CommandUseCase<C, R> {
  R call(C params);
}
