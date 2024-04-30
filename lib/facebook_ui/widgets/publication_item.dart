import 'package:facebook_ui/facebook_ui/widgets/avatar.dart';
import 'package:facebook_ui/model/publication.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeago/timeago.dart' as timeago;

class PublicationItem extends StatelessWidget {
  final Publication publication;
  const PublicationItem({
    super.key,
    required this.publication,
  });

  String _getEmpjiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return "assets/emojis/like.svg";
      case Reaction.love:
        return "assets/emojis/heart.svg";
      case Reaction.lauhing:
        return "assets/emojis/laughing.svg";
      case Reaction.sad:
        return "assets/emojis/sad.svg";
      case Reaction.shocking:
        return "assets/emojis/shocked.svg";
      case Reaction.angry:
        return "assets/emojis/angry.svg";
    }
  }

  String _formatCount(int value) {
    if (value <= 100) {
      return value.toString();
    } else {
      return "${(value / 1000).toStringAsFixed(1)}k";
    }
  }

  @override
  Widget build(BuildContext context) {
    const reactions = Reaction.values;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        width: 6,
        color: Color(0xffEBEBEB),
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Avatar(
                  size: 38,
                  asset: "assets/users/1.jpg",
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  publication.user.username,
                ),
                const Spacer(),
                Text(
                  timeago.format(publication.time),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 19 / 9,
            child: CachedNetworkImage(
              imageUrl: publication.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ).copyWith(
              top: 15,
            ),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final isActive =
                            reaction == publication.currenUserReaction;
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 7,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmpjiPath(reaction),
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Icon(
                                Icons.circle,
                                color:
                                    isActive ? Colors.red : Colors.transparent,
                                size: 5,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            "${_formatCount(publication.commenstCount)} Comments",
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${_formatCount(publication.shareCount)} Shares",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
