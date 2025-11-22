import 'package:flutter/material.dart';

class CustmElevatedButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String? text;
  final TextStyle? styleOfChild;
  final Color? BGcolor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool? isRouned;
  final bool? haseBorder;
  final Color? borderColor;

  const CustmElevatedButton({
    super.key,
    required this.onpressed,
    this.text,
    this.styleOfChild,
    this.BGcolor,
    this.padding,
    this.borderRadius,
    this.isRouned = true,
    this.haseBorder,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool rounded = isRouned ?? true; // ✅ ensures it's never null
    final bool hasBorder = haseBorder ?? false; // ensures default is false

    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: BGcolor,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
        side: hasBorder
            ? BorderSide(color: borderColor ?? Colors.black, width: 2)
            : BorderSide.none,
        shape: rounded
            ? null
            : RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
              ),
      ),
      child: Text(text ?? "", style: styleOfChild),
    );
  }
}
