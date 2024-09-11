// ignore_for_file: body_might_complete_normally_nullable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:game_of_thrones_app/logic/cubit/my_cubit.dart';
import 'package:game_of_thrones_app/ui/screens/details_characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
import 'data/models/model.dart';
import 'injection.dart';
import 'ui/screens/characters.dart';

//todo => This class is responsible for managing route navigation in the app.
class AppRouter {
  // This method decides which screen to show based on the route name
  Route? generateRoute(RouteSettings settings) {
    // todo => switch  takes in case "String" so the constants file show that
    switch (settings.name) {
      case allCharactersRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<MyCubit>(),
                  child: const CharactersScreen(),
                ));

      case detailsCharacterScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => DetailsCharaterScreen(
                  character: character,
                ));
      default:
        return null;
    }
  }
}
