import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text.toUpperCase()),
        //style: ElevatedButton.styleFrom(primary: Colors.),
      ),
    );
  }
}
