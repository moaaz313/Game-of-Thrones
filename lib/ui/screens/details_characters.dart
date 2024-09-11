// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones_app/constants/colors.dart';

import '../../data/models/model.dart';

class DetailsCharaterScreen extends StatelessWidget {
  const DetailsCharaterScreen({super.key, required this.character});
  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 550,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGreen,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.title.toString(),
          style: const TextStyle(color: MyColor.myGray),
          textAlign: TextAlign.center,
        ),
        background: Hero(
          tag: character.id!.toInt(),
          child: Image.network(
            character.imageUrl.toString(),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColor.myBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: value,
              style: TextStyle(color: MyColor.myGreen, fontSize: 16))
        ]));
  }

  Widget buildDivider(double endIndebt) {
    return Divider(
      color: MyColor.myYellow,
      height: 30,
      endIndent: endIndebt,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(14),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // todo : الفيديو اال 12 الدقيقة  39  و38  مهم 
                    characterInfo("Full Name : ", character.fullName!.splitMapJoin(' / ')),
                    buildDivider(285),
                    characterInfo("Title : ", character.title.toString()),
                    buildDivider(320),
                    characterInfo("Family : ", character.family.toString()),
                    buildDivider(300),
                    SizedBox(height: 600,)
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
