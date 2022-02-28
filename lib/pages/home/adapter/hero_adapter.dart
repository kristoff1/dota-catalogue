import 'package:character_project/atom/attribute_marker.dart';
import 'package:flutter/material.dart';

import '../../../model/hero_adapter_model.dart';

class HeroAdapter extends StatelessWidget {
  final HeroAdapterModel heroAdapterModel;
  final double reservedHeight;
  final Function() onTap;

  const HeroAdapter({
    Key? key,
    required this.heroAdapterModel,
    required this.reservedHeight,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        height: reservedHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(heroAdapterModel.imageUrl,
                  fit: BoxFit.contain, height: reservedHeight * 0.5),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          heroAdapterModel.name,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          heroAdapterModel.tags,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: AttributeMarker(heroAdapterModel.attribute),
                        /*child: Text(
                          heroAdapterModel.attribute,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),*/
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
