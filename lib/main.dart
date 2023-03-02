import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home:  HomePage(),
      ),
    );
  }
}

