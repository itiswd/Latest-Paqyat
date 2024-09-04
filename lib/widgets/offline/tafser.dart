import 'package:flutter/material.dart';
import 'package:paqy_yat/QuranApi/constant.dart';
import 'package:paqy_yat/quran.dart';

class Tafser extends StatelessWidget {
  final int index;
  final String text;
  const Tafser({
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'التفسير',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Amiri-Regular",
                              color: qurantext?.withOpacity(0.6),
                            ),
                          ),
                          SelectableText(
                            text,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              wordSpacing: -2,
                              fontSize: arabicFontSize > 24
                                  ? arabicFontSize - 8.0
                                  : arabicFontSize - 4.0,
                              fontFamily: "Amiri-Regular",
                              color: qurantext,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
