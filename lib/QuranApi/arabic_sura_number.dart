import 'package:flutter/material.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3F${(i + 1).toString().toArabicNumbers}\uFD3E",
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'me_quran',
        fontSize: 20,
        letterSpacing: 0,
        wordSpacing: 0,
      ),
    );
  }
}
