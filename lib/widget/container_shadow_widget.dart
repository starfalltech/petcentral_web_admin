import 'package:flutter/material.dart';

class ContainerShadowWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ContainerShadowWidget({
    Key? key,
    this.width,
    this.height,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff898989).withOpacity(
              0.08,
            ),
            offset: const Offset(0, 2),
            blurRadius: 32,
          )
        ],
      ),
      child: child,
    );
  }
}
