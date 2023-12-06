import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.approutes,
  });

  final List<String> approutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        children: [
          Row(
              children: approutes
                  .map((e) => Row(
                        children: [
                          Text(
                            e,
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.grey.shade400,
                          )
                        ],
                      ))
                  .toList()),
          Spacer(),
          Row(
            children: [
              Icon(Icons.share_outlined, color: Colors.greenAccent),
              SizedBox(width: 10),
              Icon(Icons.view_list_outlined, color: Colors.greenAccent),
            ],
          ),
        ],
      ),
    );
  }
}
