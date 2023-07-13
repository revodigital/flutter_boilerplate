import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_revo_boilerplate/view/error_view.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:flutter_revo_boilerplate/utils/TokenManager.dart';

import '../../main.dart';

class GraphQLApiClient {
  static GraphQLClient? _instance;

  final HttpLink httpLink = HttpLink(
      dotenv.env['TEST_ENV']! == "true" ? dotenv.env['GRAPHQL_API_URL_TEST']! : dotenv.env['GRAPHQL_API_URL']!
  );

  final ErrorLink errorLink = ErrorLink(onGraphQLError: (request, forward, response) {
    if (response.errors != null) {
      for (var error in response.errors!) {
        if (error.extensions!["code"] == "FORBIDDEN"){
          TokenManager().clearTokens();
          Navigator.pushAndRemoveUntil(MyApp.preview.currentContext!, MaterialPageRoute(builder: (BuildContext context){
            return const ErrorView();
          }), (r){
            return false;
          });
        }
        print('[GraphQL error]: Message: ${error.message}, Location: ${error.locations}, Path: ${error.path}, Extension: ${error.extensions}');
      }
    }
    return null;
  });

  GraphQLClient getInstance() {
    _instance ??= graphInit().value;
    return _instance!;
  }

  ValueNotifier<GraphQLClient> graphInit() {
    final Link authLink = CustomAuthLink();
    final Link link = authLink.concat(errorLink.concat(httpLink));

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return client;
  }
}

class CustomAuthLink extends Link {
  CustomAuthLink();

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    var token = await TokenManager().getAccessToken();
    var refreshToken = await TokenManager().getRefreshToken();
    var tokenState = getTokenState(token);
    if (token != null && tokenState["needRefresh"] && request.variables.keys.first != "refreshToken"){
      token = await refreshAuthToken(refreshToken);
    }

    final Request req = request.updateContextEntry<HttpLinkHeaders>(
          (HttpLinkHeaders? headers) => HttpLinkHeaders(
        headers: token != null ? {
          ...headers?.headers ?? <String, String>{},
          'Authorization': 'Bearer $token',
        } : {
          ...headers?.headers ?? <String, String>{},
        },
      ),
    );

    yield* forward!(req);
  }

  refreshAuthToken (String? refreshToken) async {
    /*var client = GraphQLApiClient().getInstance();
    if (client == null){
      return null;
    } else {
      return await client.mutate$Refresh(
          Options$Mutation$Refresh(
              variables: Variables$Mutation$Refresh(
                  refreshToken: refreshToken!
              )
          )
      ).then((res) async {
        if (!res.hasException) {
          var newAccessToken = res.parsedData!.refresh.accessToken;
          TokenManager().setAccessToken(newAccessToken);

          return newAccessToken;
        } else {
          return null;
        }
      });
    }*/
  }
}