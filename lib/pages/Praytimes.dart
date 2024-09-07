// ignore_for_file: file_names
import 'package:adhan/adhan.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';
import 'package:paqy_yat/data/constants.dart';
import 'package:paqy_yat/quran.dart';
import 'package:searchfield/searchfield.dart';

class SalahT extends StatefulWidget {
  const SalahT({
    super.key,
  });

  @override
  State<SalahT> createState() => _SalahTState();
}

dynamic cl;
int paryint = 0;
String? gov = 'القاهرة';
final HijriCalendar _today = HijriCalendar.now();
double? latitude, longitude;
final prayController = PageController();
final praysearch = TextEditingController();
hegryMonth(String month) {
  if (month == '1') {
    return 'مُحَرَّم';
  } else if (month == '2') {
    return 'صَفَر';
  } else if (month == '3') {
    return 'ربيع الأول';
  } else if (month == '4') {
    return 'ربيع الآخر';
  } else if (month == '5') {
    return 'جمادى الأولى';
  } else if (month == '6') {
    return 'جمادى الآخرة';
  } else if (month == '7') {
    return 'رجب';
  } else if (month == '8') {
    return 'شَعْبَان';
  } else if (month == '9') {
    return 'رمضان';
  } else if (month == '10') {
    return 'شَوَّال';
  } else if (month == '11') {
    return 'ذو القعدة';
  } else if (month == '12') {
    return 'ذو الحجة';
  }
}

class _SalahTState extends State<SalahT> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: backColor,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/azkarback.png"),
                      fit: BoxFit.fitHeight,
                      opacity: 0.6,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          'مواقيت الصلاة',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BigVesta-Arabic-Regular',
                            fontSize: MediaQuery.of(context).size.width / 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: quranback?.withOpacity(0.3),
                  ),
                )
              ],
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    paryint == 0
                        ? FadeInUp(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                right: 4,
                                left: 4,
                              ),
                              child: Card(
                                color: itemColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Future.delayed(
                                                  const Duration(
                                                      milliseconds: 150),
                                                  () {
                                                    sKey.currentState
                                                        ?.openDrawer();
                                                  },
                                                );
                                              });
                                            },
                                            child: Container(
                                              color: itemColor,
                                              padding: const EdgeInsets.all(8),
                                              child: const Icon(
                                                Icons.more_vert,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     setState(() {
                                          //       prayController.jumpToPage(0);
                                          //     });
                                          //   },
                                          //   child: Container(
                                          //     color: itemColor,
                                          //     padding: const EdgeInsets.all(8),
                                          //     child: const Icon(
                                          //       Icons.location_on,
                                          //       size: 24,
                                          //       color: Colors.white,
                                          //     ),
                                          //   ),
                                          // ),

                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                paryint = 1;
                                                maxSug2 = 5;
                                              });
                                            },
                                            child: Container(
                                              color: itemColor,
                                              padding: const EdgeInsets.all(8),
                                              child: const Icon(
                                                Icons.search,
                                                size: 28,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        : FadeInRight(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                right: 4,
                                left: 4,
                              ),
                              child: Card(
                                color: itemColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (maxSug2 == 5) {
                                              maxSug2 = 0;
                                              Future.delayed(
                                                const Duration(
                                                    milliseconds: 400),
                                                () {
                                                  setState(() {
                                                    paryint = 0;
                                                  });
                                                },
                                              );
                                            } else {
                                              setState(() {
                                                paryint = 0;
                                              });
                                            }
                                          });
                                        },
                                        child: Container(
                                          color: itemColor,
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      //search icon
                                      Expanded(
                                        child: Card(
                                          color: backColor,
                                          child: SearchField(
                                              searchStyle: const TextStyle(
                                                fontFamily: 'KFGQPC',
                                                wordSpacing: 2,
                                                fontSize: 14,
                                                height: 1.33,
                                                color: Colors.white,
                                              ),
                                              hint: 'اسم المحافظة',
                                              searchInputDecoration:
                                                  InputDecoration(
                                                border: InputBorder.none,
                                                prefixIcon: const Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 22,
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      praysearch.clear();
                                                    });
                                                  },
                                                  child: Container(
                                                    color: backColor,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                ),
                                                hintStyle: TextStyle(
                                                  fontFamily: 'KFGQPC',
                                                  wordSpacing: 2,
                                                  fontSize: 18,
                                                  height: 1.2,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              itemHeight: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  22,
                                              maxSuggestionsInViewPort: maxSug2,
                                              controller: praysearch,
                                              inputType: TextInputType.name,
                                              suggestionState:
                                                  Suggestion.expand,
                                              suggestions: govves
                                                  .map((e) =>
                                                      SearchFieldListItem(
                                                        e.toString(),
                                                        item: e,
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 16,
                                                              ),
                                                              child: Text(
                                                                e,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  height: 1.33,
                                                                  fontFamily:
                                                                      'KFGQPC',
                                                                  wordSpacing:
                                                                      2,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                              onSubmit: (value) {
                                                for (int pray = 0;
                                                    pray < govves.length;
                                                    pray++) {
                                                  if (value == govves[pray]) {
                                                    prayController
                                                        .jumpToPage(pray);
                                                  }
                                                }
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    //date
                    FadeInUp(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      child: Card(
                        color: itemColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Card(
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                                color: Colors.white.withOpacity(0.2),
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text.rich(
                                    TextSpan(
                                        text: _today
                                            .toFormat('dd ')
                                            .toString()
                                            .toArabicNumbers,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          wordSpacing: 2,
                                          height: 0.4,
                                          color: Colors.yellow,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${hegryMonth(_today.toFormat('mm').toString()).toString()} ',
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.3,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          TextSpan(
                                            text: _today
                                                .toFormat('yyyy')
                                                .toString()
                                                .toArabicNumbers,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.4,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Card(
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                                color: Colors.white.withOpacity(0.2),
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text.rich(
                                    TextSpan(
                                        text: DateFormat('dd ')
                                            .format(DateTime.now())
                                            .toArabicNumbers,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          wordSpacing: 2,
                                          height: 0.4,
                                          color: Colors.yellow,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: ' /  ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.3,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          TextSpan(
                                            text: DateFormat('M ')
                                                .format(DateTime.now())
                                                .toArabicNumbers,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.4,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' /  ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.3,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          TextSpan(
                                            text: DateFormat('yyyy')
                                                .format(DateTime.now())
                                                .toArabicNumbers,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontFamily:
                                                  'BigVesta-Arabic-Regular',
                                              wordSpacing: 2,
                                              height: 0.4,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 440,
                      child: Center(
                        child: PageView(
                          physics: const BouncingScrollPhysics(),
                          controller: prayController,
                          children: [
                            //prayTimes in other governorates
                            for (int oodd = 0; oodd < govves.length; oodd++)
                              newMethodMainPrayerWidget(
                                egoves[govves[oodd]][1],
                                egoves[govves[oodd]][2],
                                govves[oodd],
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //MainPrayerWidget
  FutureBuilder<Object?> newMethodMainPrayerWidget(
    double latitude,
    double longitude,
    String name,
  ) {
    return FutureBuilder(
      builder: (context, snapshot) {
        final cairoCoordinates = Coordinates(
          latitude,
          longitude,
        );
        final cParams = CalculationMethod.egyptian.getParameters();
        cParams.madhab = Madhab.shafi;
        final cairoPrayerTimes = PrayerTimes.today(cairoCoordinates, cParams);
        return FadeInUp(
          duration: const Duration(
            milliseconds: 500,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //prayTimes in your location
              newMethodCairoTimes(
                context,
                cairoPrayerTimes,
                name,
              ),
            ],
          ),
        );
      },
      future: null,
    );
  }

  //Prayer at selected
  Container newMethodCairoTimes(
    BuildContext context,
    PrayerTimes cairoPrayerTimes,
    String gover,
  ) {
    return Container(
      height: 440,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: itemColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/decor05.png'),
          opacity: 0.02,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16,
            ),
            child: Text.rich(
              TextSpan(
                  text: 'مواقيت الصلاة في ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'BigVesta-Arabic-Regular',
                    height: 1,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: gover,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'BigVesta-Arabic-Regular',
                        height: 1,
                        color: Colors.yellow,
                      ),
                    )
                  ]),
            ),
          ),
          newMethod003('الفجر', cairoPrayerTimes.fajr),
          newMethod003('الشروق', cairoPrayerTimes.sunrise),
          newMethod003('الظهر', cairoPrayerTimes.dhuhr),
          newMethod003('العصر', cairoPrayerTimes.asr),
          newMethod003('المغرب', cairoPrayerTimes.maghrib),
          newMethod003('العشاء', cairoPrayerTimes.isha),
        ],
      ),
    );
  }

  //Get times
  Card newMethod003(String prayName, DateTime fm) {
    return Card(
      color: backColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                prayName,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'BigVesta-Arabic-Regular',
                  wordSpacing: 2,
                  height: 1,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                '( ${DateFormat.jm().format(fm)} )',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'BigVesta-Arabic-Regular',
                  wordSpacing: 2,
                  height: 1,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
