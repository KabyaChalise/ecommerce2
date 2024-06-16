import 'package:flutter/material.dart';

class MyListtile extends StatelessWidget {
  final IconData? icon;
  final String data;
  void Function()? onTap;
   MyListtile({super.key,required this.data, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(data),
        onTap: onTap,
      ),
    );
  }
}
