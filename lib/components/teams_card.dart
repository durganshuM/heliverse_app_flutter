import 'package:flutter/material.dart';

import '../screens/team_members_screen.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TeamMembersScreen(teamCategory: teamTitle),
              ),
            );
          },
          child: Card(
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text(
                teamTitle.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
