import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';
import 'package:paqy_yat/data/constants.dart';
import 'package:paqy_yat/quran.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Azzkar extends StatefulWidget {
  const Azzkar({super.key});
  @override
  State<Azzkar> createState() => _AzzkarState();
}

int zekrtit = 0;
final zkrcon = TextEditingController();
final azkarcontroller = TextEditingController();
List zekrs = zkr;
var size = 'a';
dynamic iColor = Colors.white;
double zzSize = 20.0;
String? selectedPage;
int ncounterr = 0;
int con = 0;

PageController pcazkar = PageController(initialPage: initpageazkar);

class _AzzkarState extends State<Azzkar> {
  //Search
  void searchZekr(String query) {
    final suggestions = zkr.where((zekr) {
      final zekrName = zekr.toString().toLowerCase();
      final input = query.toLowerCase();
      return zekrName.contains(input);
    }).toList();
    setState(() {
      zekrs = suggestions;
    });
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
                          'أذكار المسلم',
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
              child: SizedBox(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 140,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 28,
                              bottom: 16,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: zekrs.length,
                            itemBuilder: (context, index) {
                              final zekr = zekrs[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return FadeInUp(
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          child: SafeArea(
                                            child: Scaffold(
                                                backgroundColor: backColor,
                                                body: SizedBox(
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: 104,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: backColor,
                                                              image:
                                                                  const DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/azkarback.png"),
                                                                fit: BoxFit
                                                                    .cover,
                                                                opacity: 0.5,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  bottom: 16,
                                                                ),
                                                                child: Text(
                                                                  zekr!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'BigVesta-Arabic-Regular',
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              color: quranback
                                                                  ?.withOpacity(
                                                                      0.3),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const SizedBox(
                                                            height: 68,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 4,
                                                              right: 4,
                                                              left: 4,
                                                            ),
                                                            child: Card(
                                                              color: itemColor,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                  8.0,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              Navigator.pop(context);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                itemColor,
                                                                            padding:
                                                                                const EdgeInsets.symmetric(
                                                                              horizontal: 16,
                                                                              vertical: 8,
                                                                            ),
                                                                            child:
                                                                                const Icon(
                                                                              Icons.arrow_back_ios,
                                                                              color: Colors.white,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        //copy
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              Clipboard.setData(ClipboardData(
                                                                                text: '$zekr\n"${azkr[zekr][initpageazkar]["zekr"]}"\n*تطبيق باقيات*',
                                                                              ));
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  backgroundColor: Colors.transparent,
                                                                                  elevation: 0,
                                                                                  content: Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                      bottom: 48,
                                                                                    ),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: backColor,
                                                                                        borderRadius: BorderRadius.circular(16),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            "تم النسخ الى الحافظة",
                                                                                            textDirection: TextDirection.rtl,
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'me_quran',
                                                                                              wordSpacing: 4,
                                                                                              height: 1.33,
                                                                                              fontSize: MediaQuery.of(context).size.width / 32,
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
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                itemColor,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                const Icon(
                                                                              Icons.copy,
                                                                              color: Colors.white,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //share
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              Share.share(
                                                                                '$zekr\n"${azkr[zekr][initpageazkar]["zekr"]}"\n*تطبيق باقيات*',
                                                                              );
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                itemColor,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                const Icon(
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
                                                              onPageChanged:
                                                                  (value) {
                                                                initpageazkar =
                                                                    value;
                                                              },
                                                              controller:
                                                                  pcazkar,
                                                              physics:
                                                                  const BouncingScrollPhysics(),
                                                              children: [
                                                                for (ncounterr =
                                                                        0;
                                                                    ncounterr <
                                                                        azkr[zekr]
                                                                            .length;
                                                                    ncounterr++)
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      right: 4,
                                                                      left: 4,
                                                                    ),
                                                                    child: Card(
                                                                      shape:
                                                                          const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4),
                                                                          topRight:
                                                                              Radius.circular(4),
                                                                          bottomRight:
                                                                              Radius.circular(24),
                                                                          bottomLeft:
                                                                              Radius.circular(24),
                                                                        ),
                                                                      ),
                                                                      color:
                                                                          itemColor,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            12.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: GestureDetector(
                                                                                  onTap: () async {
                                                                                    SharedPreferences pref3 = await SharedPreferences.getInstance();
                                                                                    setState(() {
                                                                                      allcounter = allcounter + 1;
                                                                                      pcazkar.nextPage(
                                                                                        duration: const Duration(milliseconds: 400),
                                                                                        curve: Curves.easeInOut,
                                                                                      );
                                                                                      pref3.setInt("allcounter", allcounter);
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    color: itemColor,
                                                                                    child: Center(
                                                                                      child: SingleChildScrollView(
                                                                                        physics: const BouncingScrollPhysics(),
                                                                                        child: Text(
                                                                                          '${azkr[zekr][ncounterr]["zekr"]}.',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                            fontFamily: 'me_quran',
                                                                                            wordSpacing: 4,
                                                                                            fontSize: zzSize,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Container(
                                                                                    height: 1,
                                                                                    width: MediaQuery.of(context).size.width - 24,
                                                                                    color: Colors.white.withOpacity(0.3),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 12,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${azkr[zekr][ncounterr]['count']}',
                                                                                        style: const TextStyle(
                                                                                          color: Colors.white,
                                                                                          fontFamily: 'Amiri-Regular',
                                                                                          fontSize: 14,
                                                                                          height: 1.33,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        '${azkr[zekr].length} / ${ncounterr + 1}'.toArabicNumbers,
                                                                                        style: const TextStyle(
                                                                                          color: Colors.white,
                                                                                          fontFamily: 'Amiri-Regular',
                                                                                          fontSize: 14,
                                                                                          height: 1.33,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              )
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
                                                            height: 8,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                                child: Card(
                                  color: itemColor,
                                  margin: EdgeInsets.only(
                                    top: 4,
                                    right: 8,
                                    left: 8,
                                    bottom: index == 131 ? 72 : 0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(
                                      child: Text(
                                        zekr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        zekrtit == 0
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  right: 4,
                                  left: 4,
                                ),
                                child: FadeInUp(
                                  duration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  child: Card(
                                    elevation: 5,
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
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
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
                                              PopupMenuButton(
                                                color: itemColor,
                                                elevation: 0,
                                                shape: Border.all(
                                                  color: Colors.white,
                                                  width: 0.3,
                                                ),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      setState(() {
                                                        zzSize = 16;
                                                      });
                                                    },
                                                    child: newMethodZekrFont(
                                                      'خط صغير',
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      setState(() {
                                                        zzSize = 24;
                                                      });
                                                    },
                                                    child: newMethodZekrFont(
                                                      'خط متوسط',
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      setState(() {
                                                        zzSize = 32;
                                                      });
                                                    },
                                                    child: newMethodZekrFont(
                                                      'خط كبير',
                                                    ),
                                                  ),
                                                ],
                                                child: Container(
                                                  color: itemColor,
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  child: Text(
                                                    'الخط',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'BigVesta-Arabic-Regular',
                                                      height: 1.5,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    zekrtit = 1;
                                                  });
                                                },
                                                child: Container(
                                                  color: itemColor,
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
                                                  child: const Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                    size: 28,
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
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4,
                                  left: 4,
                                  right: 4,
                                ),
                                child: FadeInLeft(
                                  duration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  child: Card(
                                    elevation: 5,
                                    color: itemColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                zekrtit = 0;
                                                zekrs = zkr;
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
                                          Expanded(
                                            child: Card(
                                              elevation: 2,
                                              color: backColor,
                                              child: TextField(
                                                controller: azkarcontroller,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      'BigVesta-Arabic-Regular',
                                                  fontSize: 16,
                                                  height: 1.2,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'البحث في أذكار المسلم',
                                                  hintStyle: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontFamily:
                                                        'BigVesta-Arabic-Regular',
                                                    fontSize: 16,
                                                    height: 1.2,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        azkarcontroller.clear();
                                                        zekrs = zkr;
                                                      });
                                                    },
                                                    child: Container(
                                                      color: backColor,
                                                      padding:
                                                          const EdgeInsets.all(
                                                        8,
                                                      ),
                                                      child: const Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onChanged: searchZekr,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
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

  //ZekrFont
  Row newMethodZekrFont(
    String name,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'BigVesta-Arabic-Regular',
            fontSize: MediaQuery.of(context).size.width / 24,
          ),
        ),
      ],
    );
  }
}
