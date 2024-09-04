// ignore_for_file: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';
import 'package:paqy_yat/data/constants.dart';
import 'package:paqy_yat/quran.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sabah extends StatefulWidget {
  const Sabah({super.key});

  @override
  State<Sabah> createState() => _SabahState();
}

class _SabahState extends State<Sabah> {
  var size = 'a';
  dynamic iColor = Colors.white;
  dynamic tSize = 20.0;
  PageController pcsab = PageController(initialPage: initpagesab);
  int sabint = 0;

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
                      opacity: 0.5,
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
                          'أذكار الصباح',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BigVesta-Arabic-Regular',
                            fontSize: MediaQuery.of(context).size.width / 12,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      right: 4,
                      left: 4,
                    ),
                    child: Card(
                      color: itemColor,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sKey.currentState?.openDrawer();
                                    });
                                  },
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                //Refresh
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pcsab.animateToPage(
                                        0,
                                        duration: (const Duration(
                                            milliseconds: 1500)),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                      for (int p = 0;
                                          p < asab['asab'].length;
                                          p++) {
                                        asab['asab'][p]["sabvar"] = 0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: itemColor,
                                    padding: const EdgeInsets.all(
                                      8,
                                    ),
                                    child: const Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                //Font Size
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (tSize >= 16) {
                                        tSize = tSize - 2.0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: itemColor,
                                    padding: const EdgeInsets.all(
                                      8,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                //Font Size
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (tSize <= 36) {
                                        tSize = tSize + 2.0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: itemColor,
                                    padding: const EdgeInsets.all(
                                      8,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                //Copy
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Clipboard.setData(ClipboardData(
                                        text:
                                            'أذكار الصباح\n${asab['asab'][initpagesab]["zekr"]}\n*تطبيق باقيات*',
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 160,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: backColor,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "تم النسخ الى الحافظة",
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontFamily: 'me_quran',
                                                      wordSpacing: 4,
                                                      height: 1.33,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              32,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    color: itemColor,
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                //Share
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Share.share(
                                        'أذكار الصباح\n${asab['asab'][initpagesab]["zekr"]}\n*تطبيق باقيات*',
                                      );
                                    });
                                  },
                                  child: Container(
                                    color: itemColor,
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 24,
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
                  Expanded(
                    child: PageView(
                      controller: pcsab,
                      onPageChanged: (value) async {
                        SharedPreferences prefinitpagesab =
                            await SharedPreferences.getInstance();
                        setState(() {
                          initpagesab = value;
                        });
                        prefinitpagesab.setInt('initpagesab', initpagesab);
                      },
                      physics: const BouncingScrollPhysics(),
                      children: [
                        for (int ncounterr = 0;
                            ncounterr < asab['asab'].length;
                            ncounterr++)
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 4,
                              left: 4,
                            ),
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                ),
                              ),
                              color: itemColor,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            SharedPreferences pref3 =
                                                await SharedPreferences
                                                    .getInstance();
                                            setState(() {
                                              allcounter = allcounter + 1;
                                              if (asab['asab'][ncounterr]
                                                      ["sabvar"] <
                                                  asab['asab'][ncounterr]
                                                      ["int"]) {
                                                asab['asab'][ncounterr]
                                                    ["sabvar"]++;
                                              }
                                              if (asab['asab'][ncounterr]
                                                      ["sabvar"] ==
                                                  asab['asab'][ncounterr]
                                                      ["int"]) {
                                                pcsab.animateToPage(
                                                  ncounterr + 1,
                                                  duration: (const Duration(
                                                      milliseconds: 600)),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              pref3.setInt(
                                                  "allcounter", allcounter);
                                            });
                                          },
                                          child: Container(
                                            color: itemColor,
                                            child: Center(
                                              child: SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${asab['asab'][ncounterr]["zekr"]}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'me_quran',
                                                        wordSpacing: 4,
                                                        fontSize: tSize,
                                                      ),
                                                    ),
                                                    Visibility(
                                                        visible: asab['asab'][
                                                                            ncounterr]
                                                                        [
                                                                        "reference"] ==
                                                                    "" &&
                                                                asab['asab'][
                                                                            ncounterr]
                                                                        [
                                                                        "description"] ==
                                                                    ""
                                                            ? false
                                                            : true,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Divider(
                                                              height: 12,
                                                              endIndent: 24,
                                                              indent: 24,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.3),
                                                            ),
                                                            Visibility(
                                                              visible: asab['asab']
                                                                              [
                                                                              ncounterr]
                                                                          [
                                                                          "description"] ==
                                                                      ""
                                                                  ? false
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                ),
                                                                child: Text(
                                                                  '${asab['asab'][ncounterr]["description"]}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.8),
                                                                    height: 2,
                                                                    fontFamily:
                                                                        'Amiri-Regular',
                                                                    wordSpacing:
                                                                        0,
                                                                    fontSize:
                                                                        tSize /
                                                                            1.2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Visibility(
                                                              visible: asab['asab']
                                                                              [
                                                                              ncounterr]
                                                                          [
                                                                          "reference"] ==
                                                                      ""
                                                                  ? false
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                child: Text(
                                                                  '${asab['asab'][ncounterr]["reference"]}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .yellow
                                                                        .withOpacity(
                                                                            0.8),
                                                                    fontFamily:
                                                                        'Amiri-Regular',
                                                                    wordSpacing:
                                                                        0,
                                                                    fontSize:
                                                                        tSize /
                                                                            1.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                '${asab['asab'][ncounterr]['count']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Amiri-Regular',
                                                  fontSize: 14,
                                                  height: 1.33,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 64,
                                            width: 64,
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 64,
                                                  width: 64,
                                                  child: CircularProgressIndicator(
                                                      value: asab['asab']
                                                                  [ncounterr]
                                                              ["sabvar"] /
                                                          asab['asab']
                                                                  [ncounterr]
                                                              ["int"],
                                                      strokeWidth: 2,
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(0.2)),
                                                ),
                                                Center(
                                                  child: Text(
                                                    '${asab['asab'][ncounterr]["sabvar"]}'
                                                        .toArabicNumbers,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 32,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                '${asab['asab'].length} / ${ncounterr + 1}'
                                                    .toArabicNumbers,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Amiri-Regular',
                                                  fontSize: 14,
                                                  height: 1.33,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
