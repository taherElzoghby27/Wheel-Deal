import 'package:cars/core/errors/failure_message.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<FailureServ, T>> call(Parameter parameter);
}

abstract class NoParameterUseCase<T> {
  Future<Either<FailureServ, T>> call();
}

class NoParameters extends Equatable {
  @override
  List<Object?> get props => [];
}
