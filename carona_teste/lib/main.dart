import 'package:carona_teste/screens/carona_screen.dart';
import 'package:carona_teste/screens/select_screen.dart';
import 'package:carona_teste/utils/database_controller.dart';
import 'package:carona_teste/utils/type_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CaronaApp());
}

class CaronaApp extends StatelessWidget {
  const CaronaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TypeController())],
      child: MaterialApp(
        title: "Carona",
        theme: ThemeData.light().copyWith(
          colorScheme:
              const ColorScheme.light().copyWith(primary: Colors.deepPurple),
        ),
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const SelectScreen(),
        ),
        routes: {
          '/': (ctx) => const SelectScreen(),
          "/carona": (context) => const CaronaScreen(),
        },
      ),
    );
  }
}
