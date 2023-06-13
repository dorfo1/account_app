import 'package:flutter/material.dart';
import 'package:flutter_dev/widgets/base_button.dart';

class AccountHomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;

  const AccountHomeButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onClick: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(
            width: 8,
          ),
          Text(title)
        ],
      ),
    );
  }
}
