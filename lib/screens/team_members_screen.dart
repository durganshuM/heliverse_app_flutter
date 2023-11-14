import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/team_cards_list.dart';

class TeamMembersScreen extends StatelessWidget {
  const TeamMembersScreen({
    super.key,
    required this.teamCategory,
  });

  final String teamCategory;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('$teamCategory Team'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: TeamMemCardList(
            teamCategory: teamCategory,
          ),
        ),
      ),
    );
  }
}
