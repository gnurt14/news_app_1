import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{
  final bool isSelected;
  final String label;
  final void Function() onPress;
  const CustomElevatedButton({super.key, required this.isSelected, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: isSelected ? ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ) : ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.grey,
        backgroundColor: Colors.grey.withOpacity(0.1),
      ),
      child: Text(label),
    );
  }

}