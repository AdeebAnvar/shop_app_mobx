import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app_mobx/data/providers/token_provider.dart';
import 'package:shopp_app_mobx/logic/bottom_nav/bottom_nav_store.dart';
import 'package:shopp_app_mobx/logic/cart_screen/cart_screen_store.dart';
import 'package:shopp_app_mobx/logic/login_screen/login_screen_store.dart';
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';
import 'package:shopp_app_mobx/presentation/routes/app_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SharedPreferences.getInstance();

  final HttpLink httpLink = HttpLink(
    'https://flutter.ceymox.net/graphql',
  );
  String token = await TokenProvider().getToken();
  ValueNotifier<GraphQLClient>? client;
  if (token != 'TOKEN_EXPIRED' || token != 'TOKEN_IS_NOT_FOUND') {
    AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final Link link = authLink.concat(httpLink);
    client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  } else {
    client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
  log(client.toString());
  runApp(
    MultiProvider(
      providers: [
        Provider<SingleProductStore>(
            create: (ctx) => SingleProductStore(client!.value)),
        Provider<BottomNavWidgetStore>(create: (ctx) => BottomNavWidgetStore()),
        Provider<CartScreenStore>(
            create: (ctx) => CartScreenStore(client!.value)),
        Provider<LoginScreenStore>(
            create: (ctx) => LoginScreenStore(client!.value)),
      ],
      child: MyApp(
        client: client,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});
  final ValueNotifier<GraphQLClient> client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        onGenerateRoute: AppRouter().getAppRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
