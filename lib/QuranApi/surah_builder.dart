// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, library_private_types_in_public_api
import 'dart:io';
import 'dart:ui' as ui;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:paqy_yat/QuranApi/to_arabic_no_converter.dart';
import 'package:paqy_yat/quran.dart';
import 'package:paqy_yat/widgets/offline/tafser.dart';
import 'package:paqy_yat/widgets/offline/translation.dart';
import 'package:paqy_yat/widgets/offline/verse_audio.dart';
import 'package:paqy_yat/widgets/offline/verse_builder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class SurahBuilder extends StatefulWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;

  SurahBuilder({
    super.key,
    this.sura,
    this.arabic,
    this.suraName,
    required this.ayah,
  });

  @override
  _SurahBuilderState createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Uint8List? imageBytes;

  //Screen Shots
  Future<void> captureScreenshot() async {
    try {
      RenderRepaintBoundary boundary = scaffoldKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 5.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      setState(() {
        imageBytes = byteData!.buffer.asUint8List();
      });
      _saveScreenshot();
    } catch (e) {
      debugPrint('Error capturing screenshot: $e');
    }
  }

  Future<void> _saveScreenshot() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/screenshot.png';
      File file = File(filePath);
      await file.writeAsBytes(imageBytes!);
      await ImageGallerySaver.saveFile(filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Screenshot saved successfully!')),
      );
    } catch (e) {
      print('Error saving screenshot: $e');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  //jumb to aya
  jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  // singleSuraBuilder
  SafeArea singleSuraBuilder(lenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view) {
      for (int i = 0; i < lenghtOfSura; i++) {
        fullSura += ('${quran.getVerse(
          widget.arabic[i + previousVerses]['sura_no'],
          widget.arabic[i + previousVerses]['aya_no'],
        )} ${(i + 1).toString().toArabicNumbers} ');
      }
    }
    return SafeArea(
      child: Container(
        color: quranback,
        child: view
            ? ScrollablePositionedList.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Visibility(
                              visible: false,
                              child: Text(''),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/pngegg (1).png',
                                height: 48,
                                color: qurantext,
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                        ),
                        child: Container(
                          color: quranback,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 24,
                              left: 16,
                              bottom: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: qurantext!.withOpacity(0.4),
                                      width: 0.7,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '${widget.arabic[index + previousVerses]['sura_no'].toString().toArabicNumbers}:${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers}',
                                        style: TextStyle(
                                          color: qurantext,
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          fontFamily: 'Roboto-Regular',
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    VerseAudio(
                                      index: index,
                                      previousVerses: previousVerses,
                                      av: quran.getAudioURLByVerse(
                                        widget.arabic[index + previousVerses]
                                            ['sura_no'],
                                        widget.arabic[index + previousVerses]
                                            ['aya_no'],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    PopupMenuButton(
                                      color: quranback,
                                      elevation: 0,
                                      shape: Border.all(
                                        color: qurantext!,
                                        width: 0.3,
                                      ),
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 20,
                                        color: qurantext,
                                      ),
                                      itemBuilder: (context) => [
                                        //Bookmark
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              saveBookMark(
                                                  widget.sura + 1, index);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 24,
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: textColor!
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'تم حفظ إشارة مرجعية',
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'me_quran',
                                                              wordSpacing: 4,
                                                              height: 1.33,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  32,
                                                              color: quranback,
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.bookmark_add,
                                                color: qurantext,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'حفظ إشارة مرجعية',
                                                style: TextStyle(
                                                  fontFamily: 'KFGQPC',
                                                  wordSpacing: 4,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          24,
                                                  color: qurantext,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Copy
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              Clipboard.setData(ClipboardData(
                                                text: '{ ${quran.getVerse(
                                                  widget.arabic[index +
                                                          previousVerses]
                                                      ['sura_no'],
                                                  widget.arabic[index +
                                                      previousVerses]['aya_no'],
                                                )} }\n[ سورة ${quran.getSurahNameArabic(widget.arabic[index + previousVerses]['sura_no'])} : ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ]\n${transvis == true ? 'English\n${quran.getVerseTranslation(
                                                    widget.arabic[index +
                                                            previousVerses]
                                                        ['sura_no'],
                                                    widget.arabic[index +
                                                            previousVerses]
                                                        ['aya_no'],
                                                  )}\n' : ''}${transvis2 == true ? 'France\n${widget.arabic[index + previousVerses]['frtext']}\n' : ''}${transvis3 == true ? 'التفسير\n${widget.arabic[index + previousVerses]['tafseer']}\n' : ''}*تطبيق باقيات*',
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 24,
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: textColor!
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            "تم النسخ الى الحافظة",
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'me_quran',
                                                              wordSpacing: 4,
                                                              height: 1.33,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  32,
                                                              color: quranback,
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.copy,
                                                color: qurantext,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    24,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'نسخ الآية',
                                                style: TextStyle(
                                                  fontFamily: 'KFGQPC',
                                                  wordSpacing: 4,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          20,
                                                  color: qurantext,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Share
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(
                                              () {
                                                Share.share(
                                                  '{ ${quran.getVerse(
                                                    widget.arabic[index +
                                                            previousVerses]
                                                        ['sura_no'],
                                                    widget.arabic[index +
                                                            previousVerses]
                                                        ['aya_no'],
                                                  )} }\n[ سورة ${quran.getSurahNameArabic(widget.arabic[index + previousVerses]['sura_no'])} : ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ]\n${transvis == true ? 'English\n${quran.getVerseTranslation(
                                                      widget.arabic[index +
                                                              previousVerses]
                                                          ['sura_no'],
                                                      widget.arabic[index +
                                                              previousVerses]
                                                          ['aya_no'],
                                                    )}\n' : ''}${transvis2 == true ? 'France\n${widget.arabic[index + previousVerses]['frtext']}\n' : ''}${transvis3 == true ? 'التفسير\n${widget.arabic[index + previousVerses]['tafseer']}\n' : ''}*تطبيق باقيات*',
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.share,
                                                color: qurantext,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'مشاركة',
                                                style: TextStyle(
                                                  fontFamily: 'KFGQPC',
                                                  wordSpacing: 4,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          24,
                                                  color: qurantext,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                            child: PopupMenuButton(
                                          color: quranback,
                                          elevation: 0,
                                          shape: Border.all(
                                            color: qurantext!,
                                            width: 0.3,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.save_alt,
                                                size: 20,
                                                color: qurantext,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'حفظ صورة',
                                                style: TextStyle(
                                                  fontFamily: 'KFGQPC',
                                                  wordSpacing: 4,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          24,
                                                  color: qurantext,
                                                ),
                                              ),
                                            ],
                                          ),
                                          itemBuilder: (context) => [
                                            newMethodnumm(
                                              context,
                                              'آية واحدة',
                                              "${arabicName[widget.arabic[index + previousVerses]['sura_no'] - 1]["name"]}",
                                              '${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers}',
                                            ),
                                            newMethodnumm(
                                              context,
                                              'آيتان',
                                              "${arabicName[widget.arabic[index + previousVerses]['sura_no'] - 1]["name"]}",
                                              '${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 1]['aya_no'].toString().toArabicNumbers}',
                                            ),
                                            newMethodnumm(
                                              context,
                                              'ثلاث آيات',
                                              "${arabicName[widget.arabic[index + previousVerses]['sura_no'] - 1]["name"]}",
                                              '${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 1]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 2]['aya_no'].toString().toArabicNumbers}',
                                            ),
                                            newMethodnumm(
                                              context,
                                              'اربع آيات',
                                              "${arabicName[widget.arabic[index + previousVerses]['sura_no'] - 1]["name"]}",
                                              '${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 1]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 2]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    3]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    3]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 3]['aya_no'].toString().toArabicNumbers}',
                                            ),
                                            newMethodnumm(
                                              context,
                                              'خمس آيات',
                                              "${arabicName[widget.arabic[index + previousVerses]['sura_no'] - 1]["name"]}",
                                              '${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    1]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 1]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    2]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 2]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    3]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    3]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 3]['aya_no'].toString().toArabicNumbers} ${quran.getVerse(
                                                widget.arabic[index +
                                                    previousVerses +
                                                    4]['sura_no'],
                                                widget.arabic[index +
                                                    previousVerses +
                                                    4]['aya_no'],
                                              )} ${widget.arabic[index + previousVerses + 4]['aya_no'].toString().toArabicNumbers}',
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          //Arabic
                          VerseBuilder(
                            index: index,
                            text: '${quran.getVerse(
                                  widget.arabic[index + previousVerses]
                                      ['sura_no'],
                                  widget.arabic[index + previousVerses]
                                      ['aya_no'],
                                ).toArabicNumbers}${widget.arabic[index + previousVerses]['aya_no'].toString().toArabicNumbers}',
                          ),
                          //English
                          Visibility(
                            visible: transvis,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                              ),
                              child: Translation(
                                index: index,
                                text: quran.getVerseTranslation(
                                  widget.arabic[index + previousVerses]
                                      ['sura_no'],
                                  widget.arabic[index + previousVerses]
                                      ['aya_no'],
                                ),
                                language: 'English',
                              ),
                            ),
                          ),
                          //French
                          Visibility(
                            visible: transvis2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                              ),
                              child: Translation(
                                index: index,
                                text: widget.arabic[index + previousVerses]
                                    ['frtext'],
                                language: 'Francais',
                              ),
                            ),
                          ),
                          //Tafseer
                          Visibility(
                            visible: widget.arabic[index + previousVerses]
                                        ['tafseer'] ==
                                    widget.arabic[index + previousVerses + 1]
                                        ['tafseer']
                                ? !transvis3
                                : transvis3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                              ),
                              child: Tafser(
                                index: index,
                                text: widget.arabic[index + previousVerses]
                                            ['tafseer'] ==
                                        "سبق الكلام عليها في أول سورة البقرة."
                                    ? "هذه الحروف وغيرها من الحروف المقطَّعة في أوائل السور فيها إشارة إلى إعجاز القرآن؛ فقد وقع به تحدي المشركين، فعجزوا عن معارضته، وهو مركَّب من هذه الحروف التي تتكون منها لغة العرب. فدَلَّ عجز العرب عن الإتيان بمثله -مع أنهم أفصح الناس- على أن القرآن وحي من الله."
                                    : widget.arabic[index + previousVerses]
                                        ['tafseer'],
                              ),
                            ),
                          ),
                          Divider(
                            indent: 24,
                            endIndent: 24,
                            thickness: 0.7,
                            color: qurantext?.withOpacity(0.3),
                          )
                        ],
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: lenghtOfSura,
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? Image.asset(
                                    'assets/images/pngegg (1).png',
                                    height: 48,
                                    color: qurantext,
                                  )
                                : const Visibility(
                                    visible: false,
                                    child: Text(''),
                                  ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SelectableText(
                                fullSura,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  wordSpacing: 0,
                                  letterSpacing: 0,
                                  fontSize: mushafFontSize,
                                  fontFamily: 'KFGQPC',
                                  color: qurantext,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  // PopupMenuItem
  PopupMenuItem<dynamic> newMethodnumm(
    BuildContext context,
    String numText,
    String suraName,
    String ayas,
  ) {
    return PopupMenuItem(
      child: PopupMenuButton(
        color: quranback,
        elevation: 0,
        child: Text(
          numText,
          style: TextStyle(
            fontFamily: 'KFGQPC',
            wordSpacing: -4,
            letterSpacing: -1,
            fontSize: MediaQuery.of(context).size.width / 24,
            color: qurantext,
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  captureScreenshot();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 24,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: textColor!.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "تم الحفظ في وحدة التخزين",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'me_quran',
                                  wordSpacing: 4,
                                  height: 1.33,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 32,
                                  color: quranback,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              },
              child: Center(
                child: SizedBox(
                  child: Stack(children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 0.3,
                          color: qurantext!,
                        )),
                        child: RepaintBoundary(
                          key: scaffoldKey,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: quranback,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    suraName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'KFGQPC',
                                      wordSpacing: -2,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 2,
                                      color: qurantext,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    ayas,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'KFGQPC',
                                      wordSpacing: -2,
                                      letterSpacing: 0,
                                      color: qurantext,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Image.asset(
                                  "assets/images/loggop - Copy.png",
                                  width: 32,
                                  color: qurantext,
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
                    Positioned(
                        bottom: 16,
                        right: 16,
                        child: Icon(
                          Icons.save_alt,
                          color: qurantext,
                          size: 24,
                        ))
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[widget.sura];
    return Scaffold(
      key: ayatKey,
      backgroundColor: quranback,
      appBar: AppBar(
        backgroundColor: quranback,
        surfaceTintColor: quranback,
        elevation: 0.9,
        shadowColor: qurantext?.withOpacity(0.5),
        toolbarHeight: 75,
        actions: [
          FadeInLeft(
            duration: const Duration(
              milliseconds: 700,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PopupMenuButton(
                  color: quranback,
                  elevation: 0,
                  shape: Border.all(
                    color: qurantext!,
                    width: 0.3,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      height: 32,
                      onTap: () async {
                        SharedPreferences transpref =
                            await SharedPreferences.getInstance();
                        SharedPreferences trans2pref =
                            await SharedPreferences.getInstance();
                        setState(
                          () {
                            transvis = true;
                            transvis2 = false;
                          },
                        );
                        transpref.setBool('transvis', transvis);
                        trans2pref.setBool('transvis2', transvis2);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/united-states-of-america.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'اللغة الإنجليزية',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.65,
                              color: qurantext,
                              wordSpacing: 4,
                              fontFamily: 'KFGQPC',
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        SharedPreferences trans2pref =
                            await SharedPreferences.getInstance();
                        SharedPreferences transpref =
                            await SharedPreferences.getInstance();
                        setState(() {
                          transvis2 = true;
                          transvis = false;
                        });
                        trans2pref.setBool('transvis2', transvis2);
                        transpref.setBool('transvis', transvis);
                      },
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/france.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'اللغة الفرنسية',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.65,
                              color: qurantext,
                              wordSpacing: 4,
                              fontFamily: 'KFGQPC',
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      height: 32,
                      onTap: () async {
                        SharedPreferences transpref =
                            await SharedPreferences.getInstance();
                        SharedPreferences trans2pref =
                            await SharedPreferences.getInstance();
                        setState(() {
                          transvis = false;
                          transvis2 = false;
                        });
                        transpref.setBool('transvis', transvis);
                        trans2pref.setBool('transvis2', transvis2);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.clear,
                            size: 20,
                            color: qurantext,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'الغاء الترجمة',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.65,
                              color: qurantext,
                              wordSpacing: 4,
                              fontFamily: 'KFGQPC',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  child: transvis == true && transvis2 == false
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 1,
                          ),
                          child: Image.asset(
                            'assets/images/united-states-of-america.png',
                            width: 24,
                            fit: BoxFit.fill,
                          ),
                        )
                      : transvis == false && transvis2 == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 1,
                              ),
                              child: Image.asset(
                                'assets/images/france.png',
                                width: 24,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Icon(
                              Icons.translate,
                              size: 24,
                              color: qurantext,
                            ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Tooltip(
                  message: 'تغيير وضع القراءة',
                  child: GestureDetector(
                    onTap: () async {
                      SharedPreferences presview =
                          await SharedPreferences.getInstance();
                      setState(() {
                        view = !view;
                      });
                      presview.setBool('view', view);
                    },
                    child: Icon(
                      Icons.chrome_reader_mode,
                      color: qurantext,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                PopupMenuButton(
                  elevation: 0,
                  color: quranback,
                  shape: Border.all(
                    color: qurantext!,
                    width: 0.3,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        height: 32,
                        onTap: () async {
                          SharedPreferences trans3pref =
                              await SharedPreferences.getInstance();
                          setState(() {
                            transvis3 = true;
                          });
                          trans3pref.setBool('transvis3', transvis3);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.note,
                              size: 20,
                              color: qurantext,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'التفسير',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.65,
                                color: qurantext,
                                wordSpacing: 4,
                                fontFamily: 'KFGQPC',
                              ),
                            ),
                          ],
                        )),
                    PopupMenuItem(
                      height: 32,
                      onTap: () async {
                        SharedPreferences trans3pref =
                            await SharedPreferences.getInstance();
                        setState(() {
                          transvis3 = false;
                        });
                        trans3pref.setBool('transvis3', transvis3);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.clear,
                            size: 20,
                            color: qurantext,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'الغاء التفسير',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.65,
                              color: qurantext,
                              wordSpacing: 4,
                              fontFamily: 'KFGQPC',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0.5,
                    ),
                    child: Icon(
                      Icons.more_vert,
                      color: qurantext,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ],
        leading: FadeInLeft(
          duration: const Duration(
            milliseconds: 700,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.rtl,
                size: 24,
                color: qurantext,
              ),
            ),
          ),
        ),
        title: FadeInLeft(
          duration: const Duration(
            milliseconds: 700,
          ),
          child: Text(
            widget.suraName,
            style: TextStyle(
              fontSize: 28,
              color: qurantext,
              wordSpacing: 4,
              height: 1,
              fontFamily: 'KFGQPC',
            ),
          ),
        ),
      ),
      body: FadeInUp(
          duration: const Duration(
            milliseconds: 700,
          ),
          child: singleSuraBuilder(lengthOfSura)),
    );
  }
}
