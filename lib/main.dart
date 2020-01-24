import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vargatt_audio/controller_audio.dart';

import 'home.dart';


void main()  {

  GetIt getit = GetIt.I;
  getit.registerLazySingleton(() => ControllerAudio());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
