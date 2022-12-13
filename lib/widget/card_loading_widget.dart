import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';

class CardLoadingWidget extends StatefulWidget {
  final double width;
  final double height;
  final Duration period;
  final bool evaluation;

  const CardLoadingWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.period,
    required this.evaluation,
  }) : super(key: key);

  @override
  State<CardLoadingWidget> createState() => _CardLoadingWidgetState();
}

class _CardLoadingWidgetState extends State<CardLoadingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: widget.period,
      vsync: this,
    )..repeat(
      min: 0.2,
      reverse: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        padding: const EdgeInsets.only(left: 16, top: 17, bottom: 17),
        decoration: BoxDecoration(
          color: const Color(0xffEEF6FE),
          borderRadius: BorderRadius.circular(8),
          boxShadow: widget.evaluation
              ? <BoxShadow>[
            BoxShadow(
              color: ColorValues.primaryBlue.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(1, 2),
            )
          ]
              : [],
        ),
      ),
    );
  }
}
