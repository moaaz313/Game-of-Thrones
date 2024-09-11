import 'package:game_of_thrones_app/data/web_services/web_services.dart';

import '../models/model.dart';

// todo => This class is responsible for fetching data from a web service
class Repo {
  final WebServices webServices; //instance of the WebServices class.
  Repo(this.webServices);
  Future<List<Character>> getAllCharacters() async {
    var response = await webServices.getAllCharacters();
    return response
        .map((character) => Character.fromJson(character.toJson()))
        .toList();
  }
}

// The await keyword is used to wait for the response before moving to the next line of code.
