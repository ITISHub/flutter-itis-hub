import 'package:flutter/material.dart';
import 'package:itis_hub/ui/theme/colors.dart';
import 'package:itis_hub/ui/theme/shapes.dart';
import 'package:itis_hub/ui/theme/type.dart';

class SubjectCard extends StatelessWidget {
  String _title = "undefined";
  String _route = "undefined";
  Function() _onClick = () {};

  SubjectCard(String title, String route, Function() onClick) {
    _title = title;
    _route = route;
    _onClick = onClick;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onClick,
      borderRadius: BorderRadius.circular(16.0),
      child: Card(
          color: colorSurface,
          shape: shapeCard,
          child: Center(
              child:
                  Text(_title, style: textTitle, textAlign: TextAlign.center))),
    );
  }
}
