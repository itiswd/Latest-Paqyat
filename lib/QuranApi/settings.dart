import 'package:flutter/material.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';
import 'package:paqy_yat/quran.dart';
import 'constant.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 72,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(
                right: 16,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.rtl,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            "إعدادات الخط",
            style: TextStyle(
              fontFamily: 'BigVesta-Arabic-Regular',
              height: 0.8,
              fontSize: MediaQuery.of(context).size.width / 18,
              color: Colors.white,
            ),
          ),
          backgroundColor: itemColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                72 -
                MediaQuery.of(context).padding.top,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'خط المصحف المقسم :',
                    style: TextStyle(
                      fontFamily: 'BigVesta-Arabic-Regular',
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.black,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      tickMarkShape: const RoundSliderTickMarkShape(
                        tickMarkRadius: 5,
                      ),
                      trackShape: const RectangularSliderTrackShape(),
                      thumbShape: const RoundSliderThumbShape(
                        disabledThumbRadius: 0,
                        enabledThumbRadius: 6,
                        pressedElevation: 0,
                        elevation: 0,
                      ),
                    ),
                    child: Slider(
                      activeColor: itemColor,
                      inactiveColor: Colors.black.withOpacity(0.2),
                      value: arabicFontSize,
                      min: 16,
                      max: 40,
                      onChanged: (value) {
                        setState(() {
                          arabicFontSize = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيم${'1'.toArabicNumbers}',
                    style: TextStyle(
                      fontFamily: 'KFGQPC',
                      fontSize: arabicFontSize,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Text(
                    'خط المصحف العادي :',
                    style: TextStyle(
                      fontFamily: 'BigVesta-Arabic-Regular',
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.black,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      tickMarkShape: const RoundSliderTickMarkShape(
                        tickMarkRadius: 5,
                      ),
                      trackShape: const RectangularSliderTrackShape(),
                      thumbShape: const RoundSliderThumbShape(
                        disabledThumbRadius: 0,
                        enabledThumbRadius: 6,
                        pressedElevation: 0,
                        elevation: 0,
                      ),
                    ),
                    child: Slider(
                      activeColor: itemColor,
                      inactiveColor: Colors.black.withOpacity(0.2),
                      value: mushafFontSize,
                      min: 18,
                      max: 44,
                      onChanged: (value) {
                        setState(() {
                          mushafFontSize = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيم${'1'.toArabicNumbers}',
                    style: TextStyle(
                      fontFamily: 'KFGQPC',
                      fontSize: mushafFontSize,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(itemColor),
                            shape: WidgetStateProperty.all(
                              const RoundedRectangleBorder(),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              arabicFontSize = 20;
                              mushafFontSize = 24;
                              saveSettings();
                            });
                          },
                          child: Text(
                            'الإعدادات الاصلية',
                            style: TextStyle(
                              fontFamily: 'BigVesta-Arabic-Regular',
                              fontSize: MediaQuery.of(context).size.width / 32,
                              color: Colors.white,
                            ),
                          )),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(itemColor),
                          shape: WidgetStateProperty.all(
                            const RoundedRectangleBorder(),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            saveSettings();
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          'حفظ',
                          style: TextStyle(
                            fontFamily: 'BigVesta-Arabic-Regular',
                            fontSize: MediaQuery.of(context).size.width / 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
