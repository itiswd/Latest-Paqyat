import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paqy_yat/QuranApi/settings.dart';
import 'package:paqy_yat/quran.dart';
import 'constant.dart';
import 'surah_builder.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FadeInUp(
        duration: const Duration(
          milliseconds: 500,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ),
          child: FloatingActionButton(
            tooltip: 'الذهاب الى الإشارة المرجعية',
            backgroundColor: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            onPressed: () async {
              fabIsClicked = true;
              if (await readBookmark() == true) {
                setState(
                  () {
                    view = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: bookmarkedSura - 1,
                          suraName: arabicName[bookmarkedSura - 1]['name'],
                          ayah: bookmarkedAyah,
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: CircleAvatar(
                backgroundColor: itemColor?.withOpacity(0.4),
                radius: 20,
                child: const Icon(
                  Icons.bookmark,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          FadeInRight(
            duration: const Duration(milliseconds: 500),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        leading: const SizedBox(),
        leadingWidth: 0,
        elevation: 0,
        toolbarHeight: 75,
        title: FadeInRight(
          duration: const Duration(milliseconds: 500),
          child: Row(
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
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "القرآن الكريم",
                style: TextStyle(
                  fontFamily: 'BigVesta-Arabic-Regular',
                  fontSize: MediaQuery.of(context).size.width / 14,
                  wordSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: itemColor,
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: backColor!.withOpacity(0.5),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              for (int i = 0; i < 114; i++)
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        fabIsClicked = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahBuilder(
                              arabic: quran[0],
                              sura: i,
                              suraName: arabicName[i]['name'],
                              ayah: 0,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(
                      top: 4,
                      left: 4,
                      right: 4,
                    ),
                    decoration: BoxDecoration(
                      color: itemColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        //Surah number
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: Stack(
                            children: [
                              Image.asset(
                                width: 44,
                                height: 44,
                                color: Colors.white,
                                'assets/images/hexagon.png',
                              ),
                              Center(
                                child: Text(
                                  '${i + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        //Sura name
                        Text(
                          arabicName[i]['name'],
                          style: const TextStyle(
                            fontSize: 28,
                            wordSpacing: 4,
                            color: Colors.white,
                            fontFamily: 'KFGQPC',
                          ),
                        ),
                        const Spacer(),
                        //Sura type
                        Text(
                          '${arabicName[i]['type']} -',
                          style: const TextStyle(
                            fontSize: 16,
                            wordSpacing: 4,
                            height: 0,
                            color: Colors.white,
                            fontFamily: 'KFGQPC',
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        //Sura ayas number
                        Text(
                          noOfVerses[i].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            wordSpacing: 4,
                            height: 0,
                            color: Colors.white,
                            fontFamily: 'KFGQPC',
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          noOfVerses[i] <= 10 ? 'آيات' : 'آية',
                          style: const TextStyle(
                            fontSize: 16,
                            wordSpacing: 4,
                            height: 0,
                            color: Colors.white,
                            fontFamily: 'KFGQPC',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
