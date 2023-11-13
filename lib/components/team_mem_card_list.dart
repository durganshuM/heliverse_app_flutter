import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/team_mem_list_tile.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:provider/provider.dart';

class TeamMemCardList extends StatefulWidget {
  const TeamMemCardList({super.key, required this.teamCategory});

  final String teamCategory;

  @override
  State<TeamMemCardList> createState() => _TeamMemCardListState();
}

class _TeamMemCardListState extends State<TeamMemCardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HeliverseData>(builder: (context, heliverseData, child) {
      return ListView.builder(
        // itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final cardData = heliverseData.getTeamData[index];

          if (cardData['domain'] == widget.teamCategory) {
            return TeamMemListTile(
              id: cardData['id'],
              firstName: cardData['first_name'],
              lastName: cardData['last_name'],
              email: cardData['email'],
              gender: cardData['gender'],
              avatarURL: cardData['avatar'],
              domain: cardData['domain'],
              available: cardData['available'],
              onAddToTeamPress: () {
                setState(() {
                  cardData['available'] =
                      heliverseData.addToTeamList(empInfo: cardData);
                });
              },
            );
          }
          return null;
        },
      );
    });
  }
}
