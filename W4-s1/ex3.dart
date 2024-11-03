import 'package:flutter/material.dart';

enum IconAlignment {
  left(Alignment.centerLeft),
  right(Alignment.centerRight);

  final Alignment alignment;
  const IconAlignment(this.alignment);
}

enum ButtonStyle {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonStyle(this.color);
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.buttonStyle,
    required this.iconAlignment,
  });

  final String label;
  final IconData icon;
  final ButtonStyle buttonStyle;
  final IconAlignment iconAlignment;

  Color get buttonColor => buttonStyle.color;
  Alignment get iconPosition => iconAlignment.alignment;

  void onButtonPressed() {
    print("Button '$label' pressed");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconAlignment == IconAlignment.left) Icon(icon),
            SizedBox(width: 8),
            Text(label,
                style: const TextStyle(fontSize: 25, color: Colors.white)),
            if (iconAlignment == IconAlignment.right) Icon(icon),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Buttons Example',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
                label: "Submit",
                icon: Icons.check_box,
                buttonStyle: ButtonStyle.primary,
                iconAlignment: IconAlignment.left),
            CustomButton(
                label: "Timer",
                icon: Icons.timer,
                buttonStyle: ButtonStyle.secondary,
                iconAlignment: IconAlignment.left),
            CustomButton(
                label: "Disabled",
                icon: Icons.disabled_by_default_rounded,
                buttonStyle: ButtonStyle.disabled,
                iconAlignment: IconAlignment.left),
          ],
        ),
      ),
    ),
  ));
}