import 'package:flutter/material.dart';
import 'package:game_of_thrones_app/app_router.dart';

import 'injection.dart';

void main() {
  getit();

  runApp(GameOfThronesApp(
    appRouter: AppRouter(),
  ));
}

class GameOfThronesApp extends StatelessWidget {
  final AppRouter appRouter;

  const GameOfThronesApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
