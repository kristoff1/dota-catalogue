import 'package:flutter/material.dart';

class HighlightedCharacterComponent extends StatelessWidget {
  final String characterImageUrl;

  final String characterTag;

  const HighlightedCharacterComponent({
    Key? key,
    required this.characterImageUrl,
    required this.characterTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(characterImageUrl, fit: BoxFit.contain)),
        Positioned(
          child: Text(
            characterTag,
            style: Theme.of(context).textTheme.caption,
          ),
          left: 12,
          bottom: 12,
        )
      ],
    );
  }
}
