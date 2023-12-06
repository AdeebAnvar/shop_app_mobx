import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopp_app_mobx/data/providers/single_product_provider.dart';
import 'package:shopp_app_mobx/logic/single_product/single_product_store.dart';
import 'package:shopp_app_mobx/presentation/routes/app_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  final HttpLink httpLink = HttpLink(
    'https://flutter.ceymox.net/graphql',
  );
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  runApp(
    Provider(
      create: (ctx) => SingleProductStore(client.value
          // Provider.of<ValueNotifier<GraphQLClient>>(ctx, listen: false).value,
          ),
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
          fontFamily: GoogleFonts.poppins().fontFamily,
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
