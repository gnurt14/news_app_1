import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeModeButton extends StatelessWidget{
  final String label;
  final bool isSelected;
  final void Function()? onTap;
  const ChangeModeButton({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                isSelected ? const Icon(Icons.check, color: Colors.green,) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}