import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/emp_card_tile.dart';
import 'package:heliverse_app_flutter/networking/network_helper.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkHelper>(builder: (context, networkHelper, child) {
      return ListView.builder(
        // itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final cardData = networkHelper.getEmpData[index];
          return CardTile(
            id: cardData['id'],
            firstName: cardData['first_name'],
            lastName: cardData['last_name'],
            email: cardData['email'],
            gender: cardData['gender'],
            avatarURL: cardData['avatar'],
            domain: cardData['domain'],
            available: cardData['available'],
            onAddToTeamPress: () {
              networkHelper.addToTeamList(empInfo: cardData);
            },
          );
        },
      );
    });
  }
}
