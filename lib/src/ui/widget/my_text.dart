//====== Font Size 8 =====//
import 'package:flutter/material.dart';

const _s16Normal = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
const _s18Normal = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
const _s22Normal = TextStyle(fontSize: 22, fontWeight: FontWeight.w400);
const _s24Normal = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
const _s32Normal = TextStyle(fontSize: 32, fontWeight: FontWeight.w400);

final _s16Bold = _s16Normal.copyWith(fontWeight: FontWeight.w700);
final _s18Bold = _s18Normal.copyWith(fontWeight: FontWeight.w700);
final _s22Bold = _s22Normal.copyWith(fontWeight: FontWeight.w700);
final _s24Bold = _s24Normal.copyWith(fontWeight: FontWeight.w700);
final _s32Bold = _s32Normal.copyWith(fontWeight: FontWeight.w700);

Widget _myText(String data,
    {TextStyle? style, int? maxLines, TextAlign? textAlign}) {
  return Text(
    data,
    textAlign: textAlign,
    maxLines: maxLines,
    style: style,
  );
}

Widget text16Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text16Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text18Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text18Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text22Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text22Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text22BoldBlack(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(
        overflow: overflow, color: Colors.black, decoration: decoration),
  );
}

Widget text22BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}

Widget text24Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text24BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}

Widget text24Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}
