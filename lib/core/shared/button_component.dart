import 'package:flutter/material.dart';

import 'color_constant.dart';
import 'font_constant.dart';

class OutlineButtonBase extends StatelessWidget {
  const OutlineButtonBase(
      {Key? key,
      required this.title,
      this.textStyle,
      this.hasIcon = true,
      this.roundedRadius = 8.0,
      this.width,
      required this.icon,
      this.onClick,
      this.roundedRadiusColor = blue})
      : super(key: key);

  final String title;
  final String icon;
  final TextStyle? textStyle;
  final bool hasIcon;
  final double roundedRadius;
  final Color roundedRadiusColor;
  final double? width;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onClick,
        statesController: MaterialStatesController(),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: roundedRadiusColor,
            width: 1.0,
          ),
          textStyle: md14(color: blue),
          minimumSize: Size(width ?? double.infinity, 43),
          fixedSize: Size(width ?? double.infinity, 43),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(roundedRadius))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle,
            ),
            if (hasIcon)
              const SizedBox(
                height: 5.0,
              ),
            // if (hasIcon)
            // if (icon.contains('svg'))
            // SvgPicture.asset(
            //   icon,
            //   height: 18.0,
            //   width: 18.0,
            // )
            // else
            //   Image.asset(
            //     icon,
            //     height: 18.0,
            //     width: 18.0,
            //   ),
          ],
        ),
      ),
    );
  }
}

class OutLineButtonLoadingBase extends StatelessWidget {
  const OutLineButtonLoadingBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8.0)), border: Border.all(color: blue)),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonBase extends StatelessWidget {
  const ElevatedButtonBase({Key? key, required this.title, required this.onPressed, required this.style, this.bgColor = blue}) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final TextStyle style;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: SizedBox(
        height: 48.0,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                } else if (states.contains(MaterialState.disabled)) {
                  return blue100;
                }
                return blue;
                // Use the component's default.
              },
            ),
            minimumSize: MaterialStateProperty.resolveWith(
              (states) => const Size.fromHeight(48.0),
            ),
            textStyle: MaterialStateProperty.resolveWith((states) => md16(color: white)),
            shape: MaterialStateProperty.resolveWith((states) => const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
          ),
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonLoadingBase extends StatelessWidget {
  const ElevatedButtonLoadingBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: blue),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: white,
          ),
        ),
      ),
    );
  }
}
