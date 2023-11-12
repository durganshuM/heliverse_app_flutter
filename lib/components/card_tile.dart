import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.avatarURL,
    required this.domain,
    required this.available,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String avatarURL;
  final String domain;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$firstName $lastName'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: $id'),
          Text(email),
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(avatarURL),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 5.0,
            backgroundColor: available ? Colors.green : Colors.red,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            gender,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            domain,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
