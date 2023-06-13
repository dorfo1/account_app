import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final String image;
  final String name;
  final String branch;
  final String account;

  const AccountInfo({
    Key? key,
    required this.image,
    required this.name,
    required this.branch,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        child: Image.network(
          image,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("ag: $branch | cc: $account"),
    );
  }
}
