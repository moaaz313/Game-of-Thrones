// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_app/constants/colors.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../data/models/model.dart';
import '../../logic/cubit/my_cubit.dart';
import 'item_of_character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  late List<Character> searchOfCharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyCubit>(context).getAllCharacters();
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColor.myGray,
      decoration: InputDecoration(
          hintText: " Find a Character",
          hintStyle: TextStyle(color: MyColor.myGray, fontSize: 16)),
      style: TextStyle(color: MyColor.myGray, fontSize: 16),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  // search of list which start with the wrriten letter
  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchOfCharacters = allCharacter
        .where((character) => character.fullName!
            .toLowerCase()
            .startsWith(searchedCharacter.toLowerCase()))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColor.myGray,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearching,
            icon: Icon(
              Icons.search,
              color: MyColor.myGray,
            ))
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearcing));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearcing() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<MyCubit, MyState>(builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacter = (state).characters;
        return buildLoadedWidgets();
      } else {
        return Center(child: CircularProgressIndicator(color: MyColor.myBlack));
      }
    });
  }

  Widget buildLoadedWidgets() {
    return SingleChildScrollView(
      child: GridView.builder(
        padding: const EdgeInsetsDirectional.all(5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: searchTextController.text.isEmpty
            ? allCharacter.length
            : searchOfCharacters.length,
        itemBuilder: (context, index) => ItemOfCharacter(
          allCharacters: searchTextController.text.isEmpty
              ? allCharacter[index]
              : searchOfCharacters[index],
        ),
      ),
    );
  }

  Widget buildAppBarTitle() {
    return Text(
      " Game Of Thrones",
      style: TextStyle(color: MyColor.myGray),
    );
  }

  Widget buildNoInternet() {
    return Center(
      child: const Column(
        children: [
          Icon(
            size: 25,
            Icons.warning_rounded,
            color: MyColor.myYellow,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            " check internet",
            style: TextStyle(color: MyColor.myBlack),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: isSearching
              ? BackButton(
                  color: MyColor.myGray,
                )
              : Container(),
          backgroundColor: MyColor.myGreen,
          title: isSearching ? buildSearchField() : buildAppBarTitle(),
          actions: buildAppBarActions(),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return buildBlocWidget();
            } else {
              return buildNoInternet();
            }
          },
          child: Center(
            child: CircularProgressIndicator(
              color: MyColor.myGreen,
            ),
          ),
        ));
  }
}
