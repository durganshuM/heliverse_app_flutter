import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:provider/provider.dart';

import '../components/teams_card.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> teamCategories = [];
    for (var emp in Provider.of<HeliverseData>(context).getEmpData) {
      teamCategories.add(emp['domain']);
    }
    teamCategories = teamCategories.toSet().toList();
    List<TeamCard> teamList = [];
    for (var teamName in teamCategories) {
      teamList.add(TeamCard(teamTitle: teamName));
    }

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teams'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: teamList,
          ),
        ),
      ),
    );
  }
}
