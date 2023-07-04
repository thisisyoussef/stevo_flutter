import 'package:flutter/material.dart';

//This is a custom button widget that can be used throughout the app. It has a text and an icon. The icon is optional.
//The button has a border radius of 10.0. The button has a height of 50.0. The button has a width of 200.0.
//The button has a text size of 20.0. The button has a text weight of bold. The button has a text alignment of center.
//The button has a border width of 1.0. The button has a shadow color of black. The button has a shadow offset of 0.0.
//The button has a shadow blur radius of 10.0. The button has a shadow spread radius of 0.0.
//The button has a shadow opacity of 0.0. The button has a margin of 10.0.
//The button has a padding of 10.0. The button has a splash color of white.
//The button has a splash radius of 10.0. The button has a splash opacity of 0.0.
//The button has a shape of RoundedRectangleBorder. The button has an elevation of 0.0.
//The button has a highlight elevation of 0.0. The button has an on pressed function that prints "Button Pressed!" to the console and executes the function passed in as an argument.
//The function passed in as an argument is optional.

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button Pressed!');
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 25),
        maximumSize: const Size(300, 100),
        primary: Theme.of(context).primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20,
          bottom: 20,
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
            const SizedBox(width: 10),
          ],
          Text(text),
        ],
      ),
    );
  }
}
