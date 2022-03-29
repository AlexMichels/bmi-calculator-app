import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
Function onPress;

  CustomActionButton({required this.icon, this.color, required this.onPress});
  
  @override
  
   Color? color = Colors.grey[400];
  final IconData icon;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPress(),
                  elevation: 3,
                  constraints: BoxConstraints.tightFor(
                    width: 56.0,
                    height: 56.0,
                  ),
                  fillColor: color,
                  shape: CircleBorder(),
                  child: Icon(icon),
    );
  }
}

