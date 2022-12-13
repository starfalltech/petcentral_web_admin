import 'package:flutter/material.dart';

class HoverCardWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const HoverCardWidget({
    Key? key,
    required this.child,
    required this.padding,
  }) : super(key: key);

  @override
  State<HoverCardWidget> createState() => _HoverCardWidgetState();
}

class _HoverCardWidgetState extends State<HoverCardWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Container(
        width: double.infinity,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isHover ? BorderRadius.circular(8) : BorderRadius.circular(0),
          boxShadow: [
            if (isHover)
              BoxShadow(
                color: const Color(0xff898989).withOpacity(
                  0.08,
                ),
                offset: const Offset(0, 2),
                blurRadius: 32,
              )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
