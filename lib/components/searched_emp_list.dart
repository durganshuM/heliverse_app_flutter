import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:provider/provider.dart';

import 'emp_list_tile.dart';

class SearchedEmpList extends StatefulWidget {
  const SearchedEmpList({
    super.key,
    required this.searchedList,
  });
  final List searchedList;

  @override
  State<SearchedEmpList> createState() => _SearchedEmpListState();
}

class _SearchedEmpListState extends State<SearchedEmpList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HeliverseData>(builder: (context, heliverseData, child) {
      return ListView.builder(
        itemCount: widget.searchedList.length,
        itemBuilder: (BuildContext context, int index) {
          final cardData = widget.searchedList[index];

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
