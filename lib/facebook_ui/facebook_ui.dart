import 'package:facebook_ui/facebook_ui/widgets/circle_button.dart';
import 'package:facebook_ui/facebook_ui/widgets/publication_item.dart';
import 'package:facebook_ui/facebook_ui/widgets/quick_action.dart';
import 'package:facebook_ui/facebook_ui/widgets/stories.dart';
import 'package:facebook_ui/facebook_ui/widgets/what_is_on_your_mind.dart';
import 'package:facebook_ui/icons/custom_icons.dart';
import 'package:facebook_ui/model/publication.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class FacebookUI extends StatelessWidget {
  const FacebookUI({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = <Publication>[];
    for (int i = 0; i < 50; i++) {
      final random = faker.randomGenerator;

      final publication = Publication(
        currenUserReaction: Reaction
            .values[random.integer(Reaction.values.length - 1)],
        user: User(
          avatar: faker.image.image(),
          username: faker.person.name(),
        ),
        title: faker.lorem.sentence(),
        time: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commenstCount: random.integer(50000),
        shareCount: random.integer(5000),
      );
      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SvgPicture.asset(
          "assets/logos/facebook.svg",
          width: 150,
          colorFilter: const ColorFilter.mode(
            Colors.blue,
            BlendMode.srcIn,
          ),
        ),
        actions: const [
          CircleButton(
            color: Colors.grey,
            icon: CustomIcons.search,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Colors.red,
            icon: CustomIcons.bell,
          ),
          SizedBox(width: 15),
          CircleButton(
            valor: true,
            color: Colors.blue,
            icon: CustomIcons.user_friends,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Color.fromARGB(255, 19, 72, 162),
            icon: CustomIcons.messenger,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          WhatIsOnYourMind(),
          SizedBox(
            height: 30,
          ),
          QuickActions(),
          SizedBox(
            height: 30,
          ),
          Stories(),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_,index) => PublicationItem(publication: publications[index]),
            itemCount: publications.length,
          ),
        ],
      ),
    );
  }
}
