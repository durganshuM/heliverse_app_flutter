import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:provider/provider.dart';

import 'emp_list_tile.dart';

class EmpCardList extends StatefulWidget {
  const EmpCardList({
    super.key,
    required this.minIndex,
    required this.maxIndex,
  });
  final int minIndex;
  final int maxIndex;

  @override
  State<EmpCardList> createState() => _EmpCardListState();
}

class _EmpCardListState extends State<EmpCardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HeliverseData>(builder: (context, heliverseData, child) {
      List indexedList = [];
      for (int i = widget.minIndex; i <= widget.maxIndex; i++) {
        indexedList.add(heliverseData.getEmpData[i]);
      }
      return ListView.builder(
        itemCount: indexedList.length,
        itemBuilder: (BuildContext context, int index) {
          final cardData = indexedList[index];

          return EmpListTile(
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
        },
      );
    });
  }
}
