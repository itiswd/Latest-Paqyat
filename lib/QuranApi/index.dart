import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: FadeInUp(
        duration: const Duration(milliseconds: 500),
        child: SafeArea(
          child: Column(
            children: [
              //App bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
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
                    const SizedBox(width: 4),
                    Text(
                      "القرآن الكريم",
                      style: TextStyle(
                        fontFamily: 'BigVesta-Arabic-Regular',
                        fontSize: MediaQuery.of(context).size.width / 14,
                        wordSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
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
                                    suraName: arabicName[bookmarkedSura - 1]
                                        ['name'],
                                    ayah: bookmarkedAyah,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Icon(
                        Icons.bookmark,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
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
                              ),
                              decoration: BoxDecoration(
                                color: itemColor!.withOpacity(.75),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                children: [
                                  //Surah number
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: backColor,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${i + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: i < 99 ? 16 : 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
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
                                  const SizedBox(width: 8.0),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
