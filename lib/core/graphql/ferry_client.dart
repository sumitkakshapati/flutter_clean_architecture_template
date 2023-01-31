import 'package:ferry/ferry.dart';
import 'package:flutter_clean_architecture_template/core/graphql/auth_link.dart';

class FerryUtils {
  static Client getFerryClient() {
    final link = HttpAuthLink(
      endPoint: "https://www.example.com",
      getSlug: () async {
        return "";
      },
      getToken: () async {
        return "";
      },
    );
    return Client(
      link: link,
      defaultFetchPolicies: {
        OperationType.query: FetchPolicy.NetworkOnly,
      },
    );
  }
}
