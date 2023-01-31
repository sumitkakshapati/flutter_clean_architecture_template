abstract class AsyncUseCase<Type, Param> {
  Future<Type> callable(Param param);
}

abstract class UseCase<Type, Param> {
  Type callable(Param param);
}

class NoParam {}
