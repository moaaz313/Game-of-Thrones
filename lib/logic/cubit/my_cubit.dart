// ignore_for_file: depend_on_referenced_packages, unnecessary_this

import 'package:bloc/bloc.dart';

// todo =>  provides annotations like @immutable that used in cubit file
import 'package:meta/meta.dart';

import '../../data/models/model.dart';
import '../../data/repositry/repo.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final Repo myRepo;
  List<Character>? characters;

  MyCubit(this.myRepo) : super(MyInitial());

  void getAllCharacters() {
    myRepo.getAllCharacters().then((characterList) {
      emit(CharactersLoaded(characterList));

      // todo => then() > method is used to register a callback 
      //that will be executed when the future completes successfully.
    });
  }
}
