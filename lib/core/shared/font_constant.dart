
import 'package:flutter/material.dart';

import 'color_constant.dart';

const danaRegular = 'dana_regular';
const danaLight = 'dana_light';
const danaMedium = 'dana_medium';
const danaBold = 'dana_bold';
const danaDemiBold = 'dana_demiBold';

const sm8 = TextStyle(
  fontFamily: danaRegular,
  fontSize: 8.0,
);

TextStyle sm10({Color color = Colors.black, double height = 1}) {
  return TextStyle(fontFamily: danaRegular, fontSize: 10.0, color: color, height: height);
}

TextStyle sm11({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaRegular, fontSize: 11.0, color: color);
}

TextStyle sm12({Color color = Colors.black, TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: danaRegular,
    fontSize: 12.0,
    color: color,
    decoration: decoration,
  );
}

TextStyle sm14({Color color = Colors.black, TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: danaRegular,
    fontSize: 14.0,
    color: color,
    decoration: decoration,
  );
}

TextStyle sm16({Color color = Colors.black, TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: danaRegular,
    fontSize: 16.0,
    color: color,
    decoration: decoration,
  );
}

const sm18 = TextStyle(
  fontFamily: danaRegular,
  fontSize: 18.0,
);
const sm20 = TextStyle(
  fontFamily: danaRegular,
  fontSize: 20.0,
);

TextStyle sm22({Color color = Colors.black, TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: danaRegular,
    fontSize: 22.0,
    color: color,
    decoration: decoration,
  );
}

const sm26 = TextStyle(
  fontFamily: danaRegular,
  fontSize: 26.0,
);

const xs8 = TextStyle(
  fontFamily: danaLight,
  fontSize: 8.0,
);
const xs10 = TextStyle(
  fontFamily: danaLight,
  fontSize: 10.0,
);
const xs11 = TextStyle(
  fontFamily: danaLight,
  fontSize: 11.0,
);
const xs12 = TextStyle(
  fontFamily: danaLight,
  fontSize: 12.0,
);
const xs14 = TextStyle(
  fontFamily: danaLight,
  fontSize: 14.0,
);
const xs16 = TextStyle(
  fontFamily: danaLight,
  fontSize: 16.0,
);
const xs18 = TextStyle(
  fontFamily: danaLight,
  fontSize: 18.0,
);
const xs20 = TextStyle(
  fontFamily: danaLight,
  fontSize: 20.0,
);
const xs22 = TextStyle(
  fontFamily: danaLight,
  fontSize: 22.0,
);
const xs26 = TextStyle(
  fontFamily: danaLight,
  fontSize: 26.0,
);

const md8 = TextStyle(
  fontFamily: danaMedium,
  fontSize: 8.0,
);

TextStyle md10({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 10.0, color: color);
}

TextStyle md11({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 12.0, color: color);
}

TextStyle md12({
  Color color = Colors.black,
  TextDecoration? textDecoration,
}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 12.0, decoration: textDecoration, color: color);
}

TextStyle md12Underline({
  Color color = Colors.black,
  TextDecoration? textDecoration,
}) {
  return TextStyle(
    fontFamily: danaMedium,
    fontSize: 12.0,
    decoration: textDecoration,
    shadows: [
      Shadow(color: color, offset: const Offset(0, -2)),
    ],
    color: Colors.transparent,
    decorationColor: blue,
  );
}

TextStyle md14({Color color = Colors.black, TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 14.0, color: color, decoration: decoration);
}

TextStyle md14Underline({
  Color color = Colors.black,
  TextDecoration? textDecoration,
}) {
  return TextStyle(
    fontFamily: danaMedium,
    fontSize: 14.0,
    decoration: textDecoration,
    shadows: [
      Shadow(color: color, offset: const Offset(0, -2)),
    ],
    color: Colors.transparent,
    decorationColor: blue,
  );
}

TextStyle md16({Color color = Colors.black, TextDecoration? decoration}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 16.0, color: color, decoration: decoration);
}

TextStyle md18({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 18.0, color: color);
}

TextStyle md20({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 20.0, color: color);
}

TextStyle md22({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaMedium, fontSize: 22.0, color: color);
}

const md26 = TextStyle(
  fontFamily: danaMedium,
  fontSize: 26.0,
);
const md30 = TextStyle(
  fontFamily: danaMedium,
  fontSize: 30.0,
);
const md45 = TextStyle(
  fontFamily: danaMedium,
  fontSize: 45.0,
);

const lg8 = TextStyle(
  fontFamily: danaBold,
  fontSize: 8.0,
);
const lg10 = TextStyle(
  fontFamily: danaBold,
  fontSize: 10.0,
);
const lg11 = TextStyle(
  fontFamily: danaBold,
  fontSize: 11.0,
);
const lg12 = TextStyle(
  fontFamily: danaBold,
  fontSize: 12.0,
);
const lg14 = TextStyle(
  fontFamily: danaDemiBold,
  fontSize: 14.0,
);

TextStyle lg16({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaDemiBold, fontSize: 16.0, color: color);
}

TextStyle lg18({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaDemiBold, fontSize: 18.0, color: color);
}

TextStyle lg20({Color color = Colors.black}) {
  return TextStyle(fontFamily: danaDemiBold, fontSize: 20.0, color: color);
}

const lg22 = TextStyle(
  fontFamily: danaDemiBold,
  fontSize: 22.0,
);
const lg26 = TextStyle(
  fontFamily: danaDemiBold,
  fontSize: 26.0,
);
const lg30 = TextStyle(
  fontFamily: danaDemiBold,
  fontSize: 30.0,
);
const lg45 = TextStyle(
  fontFamily: danaDemiBold,
  fontSize: 45.0,
);
