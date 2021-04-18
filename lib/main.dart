import 'package:flutter/material.dart';
import 'package:task_rejolut/base.dart';
import 'package:task_rejolut/providers/album_provider.dart';
import 'package:task_rejolut/providers/photos_provider.dart';
import 'package:task_rejolut/screens/response_user_display.dart';
import 'package:task_rejolut/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(
            create: (_) => User(),
          ),
          ChangeNotifierProvider<Album>(
            create: (_) => Album(),
          ),
          ChangeNotifierProvider<Photo>(
            create: (_) => Photo(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => BaseClass.fetchData('users')
                      .then((value) => userState.getResponseJson(value)),
                  child: Text("Fetch Data from Network"),
                ),
                ResponseUserDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
