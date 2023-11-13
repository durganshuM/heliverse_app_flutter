import 'package:flutter/material.dart';

class EmpListTile extends StatelessWidget {
  const EmpListTile({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.avatarURL,
    required this.domain,
    required this.available,
    required this.onAddToTeamPress,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String avatarURL;
  final String domain;
  final bool available;
  final VoidCallback onAddToTeamPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border.symmetric(
        horizontal: BorderSide(
          width: 1.0,
          color: Color(0xff424242),
        ),
      ),
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
          available
              ? GestureDetector(
                  onTap: onAddToTeamPress,
                  child: const Text(
                    'Add to Team',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              : const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5.0,
                ),
          // available
          //     ? TextButton(
          //         onPressed: onAddToTeamPress,
          //         child: const Text('Add to Team'),
          //       )
          //     : const SizedBox(
          //         width: 0,
          //         height: 0,
          //       ),
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
