import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
final httpLink = HttpLink("https://api.hashnode.com/");

ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),
        link: httpLink
    )
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
ClampingScrollWrapper.builder(context, child!)   ,  
    maxWidth: 1500,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
        ResponsiveBreakpoint.resize(480, name: MOBILE),
        ResponsiveBreakpoint.resize(800, name: TABLET),
        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home:  HomePage(),
      ),
    );
  }
}