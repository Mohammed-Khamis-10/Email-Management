import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final text;
  final bool hasNavigation;
  const ProfileListItem(
      {this.icon, this.hasNavigation = true, this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: [
          Icon(
            this.icon,
            size: 30,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            this.text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              Icons.navigate_next,
              size: 30,
            )
        ],
      ),
    );
  }
}
