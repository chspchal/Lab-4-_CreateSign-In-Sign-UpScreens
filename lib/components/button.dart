// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todolist_app/constant/constant.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String Title;
  const Button({
    Key? key,
    required this.onTap,
    required this.Title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: highlightTextColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            Title,
            style: ButtonText,
          ),
        ),
      ),
    );
  }
}
