part of 'my_cubit.dart';

@immutable
// todo => "sealed" class meaning all possible subclasses of MyState must be defined in this file.
sealed class MyState {}

final class MyInitial extends MyState {}

class CharactersLoaded extends MyState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}
