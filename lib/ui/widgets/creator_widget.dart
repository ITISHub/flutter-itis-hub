import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/data/api.dart';
import 'package:itis_hub/domain/models/developer.dart';
import 'package:itis_hub/ui/theme/colors.dart';
import 'package:itis_hub/ui/theme/type.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/models/developer.dart';

class DeveloperWidget extends StatelessWidget {
  final Developer developer;

  DeveloperWidget({required this.developer});

  @override
  Widget build(BuildContext context) {
    final imagePath = ApiClient.host + developer.avatarPath;
    return Container(
      height: 88.0,
      child: Row(
        children: [
          Container(
              height: 88.0,
              width: 88.0,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: Image.network(imagePath, fit: BoxFit.cover),
              )),
          Container(
              margin: EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (developer.name + " " + developer.surname).trim(),
                    style: textTitle.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    developer.about.trim(),
                    style: textSubtitle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    height: 32.0,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () async {
                              if (!await launch(developer.githubUrl))
                                throw 'Could not launch conspectus';
                            },
                            child: Icon(Icons.code, color: colorPrimary, size: 32.0)),
                        InkWell(
                            onTap: () async {
                              if (!await launch(developer.telegramUrl))
                                throw 'Could not launch conspectus';
                            },
                            child: Icon(Icons.telegram, color: colorPrimary, size: 32.0)),
                        InkWell(
                            onTap: () async {
                              if (!await launch(developer.vkUrl))
                                throw 'Could not launch conspectus';
                            },
                            child: Icon(Icons.person, color: colorPrimary, size: 32.0)),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
