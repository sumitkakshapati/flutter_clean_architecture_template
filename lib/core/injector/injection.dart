import 'package:flutter_clean_architecture_template/core/graphql/ferry_client.dart';
import 'package:flutter_clean_architecture_template/core/graphql/graphql_impl.dart';
import 'package:flutter_clean_architecture_template/core/interface/graphql_client.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/login_interactor.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    final ferryClient = FerryUtils.getFerryClient();

    //Network
    instance.registerSingleton<GraphqlClient>(
      GraphqlClientImpl(client: ferryClient),
    );

    //--------------------------Login-------------------------------

    //Data Sources
    instance.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(),
    );

    //Repository
    instance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        remoteDataSource: instance<UserRemoteDataSource>(),
      ),
    );

    // Interactor
    instance.registerLazySingleton<LoginInteractor>(
      () => LoginInteractor(
        userRepository: instance<UserRepository>(),
      ),
    );
  }
}