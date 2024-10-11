import 'package:flutter/material.dart';
import 'package:todolist_app/constant/constant.dart';

class DividerPart extends StatelessWidget {
  const DividerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR", style: SubHead),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
