import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  const IconBadge({
    required this.icon,
    required this.value,
    required this.color,
    super.key,
  });

  final Widget icon;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          icon,
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                color: color,
              ),
              height: 25,
              width: 25,
              child: FittedBox(
                child: Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: h5RegularWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
