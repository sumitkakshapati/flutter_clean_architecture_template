import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/interface/use_case.dart';
import 'package:flutter_clean_architecture_template/core/model/custom_exception.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/param/login_param.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/user.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/user_repository.dart';

class LoginInteractor
    implements AsyncUseCase<Either<String, User>, LoginParam> {
  final UserRepository userRepository;

  LoginInteractor({required this.userRepository});
  @override
  Future<Either<String, User>> call(LoginParam param) async {
    try {
      final res = await userRepository.login(param);
      return Right(res);
    } on CustomException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
