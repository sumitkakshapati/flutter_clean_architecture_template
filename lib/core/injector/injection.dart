import 'package:flutter_clean_architecture_template/core/graphql/ferry_client.dart';
import 'package:flutter_clean_architecture_template/core/graphql/graphql_impl.dart';
import 'package:flutter_clean_architecture_template/core/interface/graphql_client.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    final ferryClient = FerryUtils.getFerryClient();

    //Network
    instance.registerSingleton<GraphqlClient>(
      GraphqlClientImpl(client: ferryClient),
    );
  }
}
