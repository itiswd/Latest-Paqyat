import 'package:flutter/material.dart';
import 'package:paqy_yat/QuranApi/constant.dart';
import 'package:paqy_yat/quran.dart';

class Translation extends StatelessWidget {
  final int index;
  final String text;
  final String language;
  const Translation({
    super.key,
    required this.index,
    required this.text,
    required this.language,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            language,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto-Regular',
                              color: qurantext?.withOpacity(0.6),
                            ),
                          ),
                          SelectableText(
                            text,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: arabicFontSize > 24
                                  ? arabicFontSize - 8.0
                                  : arabicFontSize - 4.0,
                              fontFamily: 'Roboto-Regular',
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
