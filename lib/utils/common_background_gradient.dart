import 'package:flutter/material.dart';

class CommonBackgroundGradient extends StatelessWidget {
  const CommonBackgroundGradient({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.teal,
            Colors.orange,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child != null ? Row(children: [Expanded(child: child!)]) : null,
    );
  }
}
