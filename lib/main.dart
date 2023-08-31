import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stulast/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'database/db_functions/db_functions.dart';
import 'database/db_model/db_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudenNewtModelAdapter().typeId)) {
    Hive.registerAdapter(StudenNewtModelAdapter());
  }
  await StudentProvider().opendb();
  runApp(
    ChangeNotifierProvider(
      create: (_) => StudentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 150, 2, 130)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
