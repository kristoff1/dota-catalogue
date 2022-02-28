import 'package:character_project/global/hero_attribute_enum.dart';
import 'package:flutter/material.dart';

class AttributeMarker extends StatelessWidget {
  final String attribute;

  AttributeMarker(this.attribute);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.circle,
            size: 10,
            color: attributeDotGenerator(attribute),
          ),
        ),
        Text(attribute, style: Theme.of(context).textTheme.bodyText2,),
      ],
    );
  }

  Color attributeDotGenerator(String attribute) {
    if (attribute.toLowerCase() == HeroPrimaryAttribute.str.name) {
      return Colors.red;
    } else if (attribute.toLowerCase() == HeroPrimaryAttribute.int.name) {
      return Colors.blue;
    } else if (attribute.toLowerCase() == HeroPrimaryAttribute.agi.name) {
      return Colors.green;
    } else {
      return Colors.transparent;
    }
  }
}
