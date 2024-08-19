import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/homescreencontroller.dart';
import 'package:flutter_application_2/view/splashscreen/splashscreen.dart';

Future<void> main() async {
runApp(MyApp());
WidgetsFlutterBinding.ensureInitialized();
await Homescreencontroller.initDb();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}