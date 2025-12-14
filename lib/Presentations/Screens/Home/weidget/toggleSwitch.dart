import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';

class SettingSwitchTile extends StatefulWidget {
  final String title;
  final IconData icon;

  const SettingSwitchTile({super.key, required this.title, required this.icon});

  @override
  State<SettingSwitchTile> createState() => _SettingSwitchTileState();
}

class _SettingSwitchTileState extends State<SettingSwitchTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(widget.icon, color: AppColors.bodyText),
      title: Text(widget.title),
      trailing: Transform.scale(
        scale: 0.9,
        child: Switch(
          value: _value,
          onChanged: (v) {
            setState(() {
              _value = v;
            });
          },

          trackColor: WidgetStateProperty.resolveWith((states) {
            return Colors.grey.shade300;
          }),

          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),

          thumbColor: WidgetStateProperty.all(Colors.white),

          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
