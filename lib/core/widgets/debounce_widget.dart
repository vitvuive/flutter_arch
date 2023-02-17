import 'package:flutter/material.dart';

class DebounceWidget extends StatefulWidget {
  const DebounceWidget({
    required this.child,
    required this.onTap,
    Key? key,
    this.intervalMs = 500,
  }) : super(key: key);

  final Widget child;
  final GestureTapCallback onTap;
  final int intervalMs;

  @override
  State<DebounceWidget> createState() => _DebounceWidgetState();
}

class _DebounceWidgetState extends State<DebounceWidget> {
  int lastTimeClicked = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          final now = DateTime.now().millisecondsSinceEpoch;
          if (now - lastTimeClicked < widget.intervalMs) {
            return;
          }
          lastTimeClicked = now;
          widget.onTap();
        },
        child: widget.child,
      ),
    );
  }
}
