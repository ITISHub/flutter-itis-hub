import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/ui/theme/type.dart';
import 'package:itis_hub/ui/widgets/itis_hub_bar.dart';

class PracticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(children: [
        ItisHubBar("Практика"),
        Expanded(
            child: Center(
          child: Text(
            "Контент в разработке!",
            style: textTitle.copyWith(fontSize: 24.0),
          ),
        ))
      ]);
}
