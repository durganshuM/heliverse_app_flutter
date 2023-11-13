import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/networking/network_helper.dart';
import 'package:provider/provider.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> teamCategories = [];
    for (var emp in Provider.of<NetworkHelper>(context).getEmpData) {
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

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.teamTitle,
  });

  final String teamTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: GestureDetector(
          onTap: () {
            //
          },
          child: Card(
            child: Center(
              child: Text(teamTitle),
            ),
          ),
        ),
      ),
    );
  }
}
