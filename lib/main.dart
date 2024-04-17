import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'collections/car.dart';
import 'view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CarSchema],
    directory: dir.path,
  );

  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;

  MyApp({required this.isar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample List App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ViewPage(isar: isar),
    );
  }
}