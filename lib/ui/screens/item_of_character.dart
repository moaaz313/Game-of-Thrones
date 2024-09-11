// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game_of_thrones_app/constants/colors.dart';

import '../../constants/strings.dart';
import '../../data/models/model.dart';

class ItemOfCharacter extends StatelessWidget {
  ItemOfCharacter({super.key, required this.allCharacters});

  late final Character allCharacters;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, detailsCharacterScreen,arguments:allCharacters );
      },
      child: 
      GridTile(
        footer: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black54,
          height: 40,
          width: double.infinity,
          child: Text(
            allCharacters.fullName.toString(),
            style: const TextStyle(
                height: 1.3,
                color: MyColor.myGray,
                fontSize: 16,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Hero(tag: allCharacters.id!.toInt(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              allCharacters.imageUrl.toString(),
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    color: MyColor.myBlack,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ),
    );
  }
}
 