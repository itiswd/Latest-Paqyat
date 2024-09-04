import 'package:flutter/material.dart';
import 'package:paqy_yat/QuranApi/constant.dart';
import 'package:paqy_yat/quran.dart';

class VerseBuilder extends StatelessWidget {
  final int index;
  final String text;
  const VerseBuilder({
    super.key,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  text,
                  style: TextStyle(
                    fontSize: arabicFontSize,
                    fontFamily: 'KFGQPC',
                    wordSpacing: 0,
                    letterSpacing: 0,
                    color: qurantext,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
