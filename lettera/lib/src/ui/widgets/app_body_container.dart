import 'package:flutter/material.dart';

class AppBodyContainer extends StatelessWidget {
  final List<Widget> children;
  final Widget? header;
  final CrossAxisAlignment crossAxisAlignment;

  const AppBodyContainer({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Align(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );

    if (header != null) {
      content = Column(
        children: [
          header!,
          Expanded(
            child: content,
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: content,
    );
  }
}
