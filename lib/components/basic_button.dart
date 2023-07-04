import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  String routeName;
  String textButton;

  BasicButton({Key? key, required this.routeName, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Text(textButton),
    );
  }
}
