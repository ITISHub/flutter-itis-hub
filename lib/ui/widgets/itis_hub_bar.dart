import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/ui/theme/type.dart';

class ItisHubBar extends StatelessWidget {
  String title;
  Function()? onBack;
  Function()? onAction;

  ItisHubBar(this.title, {Function()? onBack, Function()? onAction}) {
    this.onBack = onBack;
    this.onAction = onAction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
              visible: onBack != null,
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    onBack?.call();
                  },
                  icon: Icon(Icons.arrow_back_ios))),
          Container(
              child: Text(
            title,
            style: textTitle.copyWith(fontSize: 20.0,fontWeight: FontWeight.w600),
          )),
          Visibility(
              visible: onAction != null,
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    onAction?.call();
                  },
                  icon: Icon(Icons.settings)))
        ],
      ),
    );
  }
}
