import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/ui/widgets/creator_widget.dart';

import '../../data/api.dart';
import '../../domain/models/developer.dart';
import '../theme/colors.dart';
import '../widgets/itis_hub_bar.dart';

class DevelopersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DevelopersScreenState();
}

class DevelopersScreenState extends State<DevelopersScreen> {
  late Future<List<Developer>> _futureDevelopers;
  final apiClient = ApiClient();

  @override
  void initState() {
    super.initState();
    _futureDevelopers = apiClient.fetchDevelopers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: colorBackground,
      body: Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(children: [
            ItisHubBar("Разработчики"),
            Expanded(
                child: FutureBuilder(
              future: _futureDevelopers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data as List<Developer>;
                  return ListView.builder(
                      primary: false,
                      itemCount: snap.length,
                      itemBuilder: (_, i) {
                        return Container(
                            height: 94.0,
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Center(
                                child: DeveloperWidget(developer: snap[i])));
                      });
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error!"));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ))
          ])));
}
