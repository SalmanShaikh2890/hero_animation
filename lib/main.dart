import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Hero Animation"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Hero(
              tag: "Page#$index",
              child: ListTile(
                title: Text("Tile # $index"),
                onTap: () {
                  Navigator.push(context, MyRoute(builder: (context)=> SecondPage(index)));
                },
              ),
            );
          },
          itemCount: 10,
        ));
  }
}

class SecondPage extends StatelessWidget {
  final int index;
  const SecondPage(this.index,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Page#$index",
      child: const Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: Center(
          child: Text("Hello from Salman"),
        ),
      ),
    );
  }
}

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(seconds: 3);
}
