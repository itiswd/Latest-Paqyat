// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paqy_yat/QuranApi/index.dart';
import 'package:paqy_yat/data/constants.dart';
import 'package:paqy_yat/pages/Masaa.dart';
import 'package:paqy_yat/pages/Praytimes.dart';
import 'package:paqy_yat/pages/Sabah.dart';
import 'package:paqy_yat/pages/Sebha.dart';
import 'package:paqy_yat/pages/azkar.dart';
import 'package:paqy_yat/pages/muslimtube.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Qrrr extends StatefulWidget {
  final int? tdd;
  final int? alc;
  final int? voc;
  final int? mahh;
  final int? mobb;
  final int? pagg;
  final int? audd;
  final int? aaa;
  final double? slide;
  final bool? vv;
  final bool? tran;
  final bool? tran2;
  final bool? tran3;
  final int? mod;
  const Qrrr({
    super.key,
    required this.tdd,
    required this.alc,
    required this.voc,
    required this.mahh,
    required this.mobb,
    required this.pagg,
    required this.audd,
    required this.aaa,
    required this.slide,
    required this.vv,
    required this.tran,
    required this.tran2,
    required this.tran3,
    required this.mod,
  });

  @override
  State<Qrrr> createState() => _QrrrState();
}

bool view = false;
int selAudio = 0;
int mobta = 0;
int volume = 0;
bool transvis = false;
bool transvis2 = false;
bool transvis3 = false;
int allcounter = 0;
bool saveloader = false;
String? num = "001";
String? twoDigitSeconds;
double valuee = 0;
double valueee = 0;
int a = 0;
int aa = 0;
dynamic pagenumm;
int vh = 0;
int mah = 0;
Color? backColor;
Color? itemColor;
Color? textColor;
Color? qrColor;
Color? logo;
Color? qurantext;
Color? quranback;
double saver = 0;
IconData? ic;
AudioPlayer? player = AudioPlayer();
int? td = 0;
int maxSug = 0;
int maxSug2 = 0;
int mood = 1;
bool sho = false;
int initpage = 0;
int initpagesab = 0;
int initpagemasa = 0;
int initpageazkar = 0;
int initpageallah = 0;
int? timeer;
int quranTitle = 0;
List<String>? imageUrls = [];
var selectedSurah = 'الفاتحة';
String cach =
    "https://is5-ssl.mzstatic.com/image/thumb/Purple49/v4/73/14/23/731423bc-28a2-378b-956b-0ac5586cac47/source/512x512bb.jpg";
String nam = "محمود خليل الحصري";
String ur = 'https://drive.google.com/uc?export=view&id=';
PageController pc = PageController(initialPage: initpage);
final sf = TextEditingController();
final sp = TextEditingController();
final ayatcon = TextEditingController();
PageController homee = PageController();
final GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> dKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> ayatKey = GlobalKey<ScaffoldState>();
AudioPlayer? audioPlayer;
bool isPlaying = false;
Duration position = const Duration();
Duration? duration = const Duration(seconds: 0);
Duration poss = const Duration(seconds: 0);
String selectedValue = 'الفاتحة';
String? lin = "https://server13.mp3quran.net/husr/";
initPlayer() async {
  await player?.setSource(UrlSource("$lin$num.mp3"));
  duration = await player?.getDuration();
}

bool isPlayingg = false;
AudioPlayer? playerr = AudioPlayer();
Duration? durationb = const Duration(seconds: 0);
Duration positionb = const Duration();

//Url Launcher
Future<void> _launchUrl(dynamic linkk, dynamic x) async {
  if (!await launchUrl(
    Uri.parse(linkk),
    mode: x,
  )) {
    throw 'Could not launch ${Uri.parse(linkk)}';
  }
}

//Light Mode
light() {
  backColor = const Color(0xff44a1a0);
  itemColor = const Color(0xff0d5c63);
  textColor = Colors.black;
  qrColor = Colors.transparent;
  qurantext = Colors.black;
  quranback = Colors.white;
  logo = Colors.white;
  ic = Icons.light_mode;
  td = 0;
}

//Dark Mode
dark() {
  backColor = Colors.black;
  itemColor = const Color(0xff212529);
  textColor = Colors.white;
  qrColor = Colors.black;
  qurantext = Colors.white;
  quranback = Colors.black;
  logo = const Color(0xff0d5c63);
  ic = Icons.dark_mode;
  td = 1;
}

//Set Mode
settt() {
  if (td == 0) {
    light();
  } else if (td == 1) {
    dark();
  }
}

//set slide value
class MyAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    SharedPreferences prefslidVal = await SharedPreferences.getInstance();
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      player?.onPositionChanged.listen(
        (Duration d) {
          valuee = d.inSeconds.toDouble();
        },
      );
    }
    prefslidVal.setDouble('slider', valuee);
  }
}

@override
class _QrrrState extends State<Qrrr> {
  //set Sheikh
  setSheikg() {
    lin = sh["links"][selAudio];
    cach = sh["images"][selAudio];
    nam = sh["quraa"][selAudio];
    vh = selAudio;
  }

  //set Surah
  setSurah() {
    selectedSurah = surat[aa];
    if (selectedSurah == surat[aa] && aa >= 0 && aa < 9) {
      setState(
        () {
          num = "00${aa + 1}";
        },
      );
    } else if (selectedSurah == surat[aa] && aa >= 9 && aa < 99) {
      setState(
        () {
          num = "0${aa + 1}";
        },
      );
    } else if (selectedSurah == surat[aa] && aa >= 99 && aa < 114) {
      setState(
        () {
          num = "${aa + 1}";
        },
      );
    }
  }

  @override
  void initState() {
    mood = widget.mod!;
    view = widget.vv!;
    aa = widget.aaa!;
    transvis = widget.tran!;
    transvis2 = widget.tran2!;
    transvis3 = widget.tran3!;
    initpage = widget.pagg!;
    valuee = widget.slide!;
    td = widget.tdd!;
    selAudio = widget.audd!;
    allcounter = widget.alc!;
    volume = widget.voc!;
    mah = widget.mahh!;
    mobta = widget.mobb!;
    super.initState();
    WidgetsBinding.instance.addObserver(MyAppLifecycleObserver());
    initPlayer();
    player?.seek(Duration(seconds: valuee.toInt()));
    settt();
    setSheikg();
    setSurah();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
      MyAppLifecycleObserver(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onBackpressed(context);
      },
      child: Scaffold(
        backgroundColor: itemColor,
        key: sKey,
        drawer: mainDrawer(context),
        body: SizedBox(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      controller: homee,
                      scrollDirection: Axis.horizontal,
                      children: [
                        quranScaffold(context),
                        const Sabah(),
                        const Masaa(),
                        const Azzkar(),
                        const Sebha(),
                        const SalahT(),
                        const Muslim(),
                        const IndexPage(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: itemColor!,
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 72,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        bottomAppBar(
                          mah == 0
                              ? FlutterIslamicIcons.quran
                              : FlutterIslamicIcons.quran2,
                          mah == 0 ? Colors.redAccent : Colors.amber,
                          0,
                        ),
                        bottomAppBar(
                          Icons.book,
                          Colors.brown,
                          7,
                        ),
                        bottomAppBar(
                          Icons.sunny,
                          Colors.yellow,
                          1,
                        ),
                        bottomAppBar(
                          Icons.nightlight,
                          Colors.white,
                          2,
                        ),
                        bottomAppBar(
                          FlutterIslamicIcons.prayer,
                          Colors.tealAccent,
                          3,
                        ),
                        bottomAppBar(
                          FlutterIslamicIcons.tasbih2,
                          const Color.fromARGB(255, 220, 97, 53),
                          4,
                        ),
                        bottomAppBar(
                          FlutterIslamicIcons.mosque,
                          Colors.red,
                          5,
                        ),
                        bottomAppBar(
                          Icons.groups,
                          Colors.blue,
                          6,
                        ),
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

  int navBarIndex = 0;
  //Bottom appBar
  GestureDetector bottomAppBar(
    IconData barrIcon,
    Color barrColor,
    int barrNum,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          navBarIndex = barrNum;
          if (maxSug == 5) {
            maxSug = 0;
            Future.delayed(
              const Duration(milliseconds: 400),
              () {
                setState(() {
                  homee.jumpToPage(
                    barrNum,
                  );
                });
              },
            );
          } else if (maxSug2 != 0) {
            maxSug2 = 0;
            Future.delayed(
              const Duration(milliseconds: 400),
              () {
                setState(() {
                  homee.jumpToPage(
                    barrNum,
                  );
                });
              },
            );
          } else {
            setState(() {
              homee.jumpToPage(
                barrNum,
              );
            });
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: navBarIndex == barrNum ? Colors.white.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(48.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            barrIcon,
            color: navBarIndex == barrNum ? Colors.yellow[700] : Colors.white,
            size: MediaQuery.of(context).size.width / 16,
          ),
        ),
      ),
    );
  }

  //Quran Scaffold
  Scaffold quranScaffold(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: sho
          ? newMethodAudioplayer(context)
          : Padding(
              padding: const EdgeInsets.only(
                bottom: 68.0,
              ),
              child: newMethodaudioIcon(),
            ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: itemColor,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: quranTitle == 0
            ? FadeInLeft(
                duration: const Duration(
                  milliseconds: 500,
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
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              SharedPreferences pref9 =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                if (mah == 0) {
                                  mah = 1;
                                } else {
                                  mah = 0;
                                }
                              });
                              pref9.setInt("madina", mah);
                            },
                            child: Container(
                              color: itemColor,
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  Text(
                                    'القرآن الكريم',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              16,
                                      fontFamily: 'BigVesta-Arabic-Regular',
                                      wordSpacing: 2,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    mah == 0 ? 'مصحف المدينة' : 'تدبر و عمل',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              38,
                                      fontFamily: 'BigVesta-Arabic-Regular',
                                      wordSpacing: 2,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        //Search
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              maxSug = 5;
                              quranTitle = 1;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size:
                                  MediaQuery.of(context).size.width.toDouble() /
                                      14,
                            ),
                          ),
                        ),
                        //Theme Colors
                        newMethodSetCColors(context),
                      ],
                    ),
                  ],
                ),
              )
            : FadeInRight(
                duration: const Duration(
                  milliseconds: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (maxSug == 5) {
                              maxSug = 0;
                              Future.delayed(
                                const Duration(milliseconds: 400),
                                () {
                                  setState(() {
                                    quranTitle = 0;
                                  });
                                },
                              );
                            } else {
                              setState(() {
                                quranTitle = 0;
                              });
                            }
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
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
                            hint: 'اسم السورة',
                            searchInputDecoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 22,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sf.clear();
                                  });
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'KFGQPC',
                                wordSpacing: 2,
                                fontSize: 18,
                                height: 1.2,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            itemHeight: MediaQuery.of(context).size.height / 22,
                            maxSuggestionsInViewPort: maxSug,
                            controller: sf,
                            inputType: TextInputType.name,
                            suggestionState: Suggestion.expand,
                            suggestions: surat
                                .map((e) => SearchFieldListItem(
                                      e.toString(),
                                      item: e,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 16,
                                            ),
                                            child: Text(
                                              e,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                height: 1.33,
                                                fontFamily: 'KFGQPC',
                                                wordSpacing: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            onSubmit: (value) async {
                              SharedPreferences prefinitpage =
                                  await SharedPreferences.getInstance();
                              SharedPreferences prefsa =
                                  await SharedPreferences.getInstance();

                              selectedSurah = value;
                              for (a = 0; a < 114; a++) {
                                if (selectedSurah == surat[a] &&
                                    a >= 0 &&
                                    a < 9) {
                                  setState(
                                    () {
                                      num = "00${a + 1}";
                                      aa = a;
                                    },
                                  );
                                } else if (selectedSurah == surat[a] &&
                                    a >= 9 &&
                                    a < 99) {
                                  setState(
                                    () {
                                      num = "0${a + 1}";
                                      aa = a;
                                    },
                                  );
                                } else if (selectedSurah == surat[a] &&
                                    a >= 99 &&
                                    a < 114) {
                                  setState(
                                    () {
                                      num = "${a + 1}";
                                      aa = a;
                                    },
                                  );
                                }
                              }
                              for (int u = 0; u < 114; u++) {
                                if (selectedSurah == surat[u]) {
                                  setState(() {
                                    pc.jumpToPage(surahs[u]);
                                    initpage = surahs[u];
                                  });
                                }
                              }
                              await player?.seek(Duration.zero);
                              await player?.pause();
                              isPlaying = false;
                              quranTitle = 0;
                              maxSug = 0;
                              prefinitpage.setInt('initpage', initpage);
                              prefsa.setInt('prefsa', aa);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      backgroundColor: backColor,
      body: FadeInUp(
        duration: const Duration(
          milliseconds: 400,
        ),
        child: SizedBox(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      maxSug = 0;
                      Future.delayed(
                        const Duration(milliseconds: 400),
                        () {
                          setState(
                            () {
                              quranTitle = 0;
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    return PageView(
                      onPageChanged: (value) async {
                        SharedPreferences prefinitpage =
                            await SharedPreferences.getInstance();
                        initpage = value;
                        prefinitpage.setInt('initpage', initpage);
                      },
                      physics: const BouncingScrollPhysics(),
                      controller: pc,
                      children: [
                        for (int t = 0; t < topsurr!.length; t++)
                          mah == 0
                              ? newMethodpage2(
                                  madSur![t],
                                )
                              : newMethodpage(
                                  topsurr![t],
                                  bottomsurr![t],
                                ),
                      ],
                    );
                  },
                  future: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //main drawer
  Drawer mainDrawer(BuildContext context) {
    return Drawer(
      elevation: 0,
      key: dKey,
      backgroundColor: itemColor!,
      width: MediaQuery.of(context).size.width / 1.5,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: itemColor,
                image: const DecorationImage(
                  image: AssetImage("assets/images/azkarback.png"),
                  fit: BoxFit.fitHeight,
                  opacity: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 44,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/loggop.png",
                      height: 96,
                      color: logo!,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //المصحف بدون نت
            GestureDetector(
              onTap: () async {
                setState(() {
                  homee.jumpToPage(7);
                  sKey.currentState?.closeDrawer();
                });
              },
              child: Container(
                color: itemColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.brown[700],
                        size: 18,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'المصحف بدون نت',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //القرآن الكريم مصحف المدينة
            GestureDetector(
              onTap: () async {
                SharedPreferences pref9 = await SharedPreferences.getInstance();
                setState(() {
                  mah = 0;
                  homee.jumpToPage(0);
                  sKey.currentState?.closeDrawer();
                });
                pref9.setInt("madina", mah);
              },
              child: Container(
                color: itemColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FlutterIslamicIcons.quran,
                        color: Colors.redAccent,
                        size: 18,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'مصحف المدينة',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //القرآن الكريم تدبر و عمل
            GestureDetector(
              onTap: () async {
                SharedPreferences pref9 = await SharedPreferences.getInstance();
                setState(() {
                  mah = 1;
                  homee.jumpToPage(0);
                  sKey.currentState?.closeDrawer();
                });
                pref9.setInt("madina", mah);
              },
              child: Container(
                color: itemColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FlutterIslamicIcons.quran2,
                        color: Colors.orange,
                        size: 18,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'القرآن الكريم تدبر و عمل',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  homee.jumpToPage(6);
                  sKey.currentState?.closeDrawer();
                });
              },
              child: Container(
                color: itemColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.groups,
                        color: Colors.blue,
                        size: 18,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'روابط خير',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //مواقيت الصلاة
            newMethodlistTile(
              context,
              5,
              'مواقيت الصلاة',
              FlutterIslamicIcons.calendar,
              Colors.redAccent,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //أذكار الصباح
            newMethodlistTile(
              context,
              1,
              'أذكار الصباح',
              Icons.sunny,
              Colors.amberAccent,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //أذكار المساء
            newMethodlistTile(
              context,
              2,
              'أذكار المساء',
              Icons.nightlight,
              Colors.white,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //أذكار المسلم
            newMethodlistTile(
              context,
              3,
              'أذكار المسلم',
              FlutterIslamicIcons.prayer,
              Colors.greenAccent,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //السبحة
            newMethodlistTile(
              context,
              4,
              'السبحة',
              FlutterIslamicIcons.tasbih2,
              const Color.fromARGB(255, 220, 97, 53),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //اتصل بنا
            GestureDetector(
              onTap: () {
                setState(() {
                  _launchUrl(
                    'https://api.whatsapp.com/send?phone=2001553889243&text=%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%20%D8%B9%D9%84%D9%8A%D9%83%D9%85%D8%8C%20%20%D9%83%D9%8A%D9%81%20%D8%A7%D9%84%D8%AD%D8%A7%D9%84!%20',
                    LaunchMode.externalApplication,
                  );
                });
              },
              child: Container(
                color: itemColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.message,
                        size: 18,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'اتصل بنا',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          wordSpacing: 2,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white.withAlpha(90),
              height: 0,
            ),
            //دعاء
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "لا تنسونا من صالح الدعاء بظهر الغيب،\n ولا تنسوا ان الدال على الخير كفاعله،\n شير في الخير.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 40,
                  fontFamily: 'BigVesta-Arabic-Regular',
                  wordSpacing: 2,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Drawer list Tile
  GestureDetector newMethodlistTile(
    BuildContext context,
    int rout,
    String dd,
    IconData icon,
    Color coo,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          homee.jumpToPage(rout);
          sKey.currentState?.closeDrawer();
        });
      },
      child: Container(
        color: itemColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: coo,
                size: 18,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                dd,
                style: const TextStyle(
                  fontFamily: 'BigVesta-Arabic-Regular',
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Set Colors
  GestureDetector newMethodSetCColors(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences pref1 = await SharedPreferences.getInstance();
        setState(() {
          if (td == 0) {
            dark();
          } else if (td == 1) {
            light();
          }
        });
        pref1.setInt("Dark", td!);
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 4,
        ),
        child: Icon(
          ic,
          color: Colors.white,
          size: MediaQuery.of(context).size.width.toDouble() / 14,
        ),
      ),
    );
  }

  //Are You Sure
  Future<bool> onBackpressed(BuildContext context) async {
    bool exit = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeInUp(
            animate: true,
            duration: const Duration(
              milliseconds: 400,
            ),
            child: AlertDialog(
              backgroundColor: itemColor?.withOpacity(0.9),
              scrollable: true,
              content: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  "متأكد من الخروج و إغلاق التطبيق ؟؟",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    fontFamily: 'BigVesta-Arabic-Regular',
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "لا",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 32,
                      fontFamily: 'BigVesta-Arabic-Regular',
                      wordSpacing: 2,
                      color: Colors.green,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "نعم",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 32,
                      fontFamily: 'BigVesta-Arabic-Regular',
                      wordSpacing: 2,
                      color: const Color.fromARGB(255, 220, 116, 108),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    return exit;
  }

  //Audio Icon
  FadeInUp newMethodaudioIcon() {
    return FadeInUp(
      duration: const Duration(
        milliseconds: 500,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            sho = true;
          });
        },
        child: CircleAvatar(
          backgroundColor: itemColor?.withOpacity(0.4),
          radius: 20,
          child: const Icon(
            Icons.multitrack_audio,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  //Audio player
  FadeInDown newMethodAudioplayer(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 12,
              child: FutureBuilder(
                  future: initPlayer(),
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 156,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/azkarback.png"),
                            fit: BoxFit.fitHeight,
                            opacity: 0.5,
                          ),
                          color: itemColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            //slider
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 4,
                                activeTickMarkColor: Colors.transparent,
                                tickMarkShape: const RoundSliderTickMarkShape(
                                  tickMarkRadius: 0,
                                ),
                                trackShape: const RectangularSliderTrackShape(),
                                thumbShape: const RoundSliderThumbShape(
                                  disabledThumbRadius: 0,
                                  enabledThumbRadius: 0,
                                  pressedElevation: 0,
                                  elevation: 0,
                                ),
                              ),
                              child: Slider.adaptive(
                                onChangeEnd: (newValuee) async {
                                  setState(() {
                                    valuee = newValuee;
                                  });
                                  await player?.seek(
                                      Duration(seconds: newValuee.toInt()));
                                },
                                min: 0.0,
                                value: valuee,
                                max: (duration!.inSeconds).toDouble() == 0
                                    ? 10800
                                    : (duration!.inSeconds).toDouble(),
                                onChanged: (v) async {
                                  setState(() {
                                    valuee = v;
                                  });
                                },
                                activeColor: backColor,
                                inactiveColor: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            //Time counter and playback audio
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 23,
                                vertical: 0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${(valuee / 3600).floor()}:${((valuee / 60) % 60).floor()}:${(valuee % 60).floor()}",
                                        style: TextStyle(
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          wordSpacing: 2,
                                          height: 0.5,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              32,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "  /  ",
                                        style: TextStyle(
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          wordSpacing: 2,
                                          height: 0.5,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              36,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${duration!.inHours}:${(duration!.inMinutes % 60)}:${(duration!.inSeconds % 60)}",
                                        style: TextStyle(
                                          fontFamily: 'BigVesta-Arabic-Regular',
                                          wordSpacing: 2,
                                          height: 0.5,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              32,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  PopupMenuButton(
                                    position: PopupMenuPosition.over,
                                    color: itemColor,
                                    shape: Border.all(
                                      color: Colors.white,
                                      width: 0.3,
                                    ),
                                    itemBuilder: (context) => [
                                      newMethodplayBack(
                                        1.2,
                                        '1,2',
                                      ),
                                      newMethodplayBack(
                                        1.1,
                                        '1,1',
                                      ),
                                      newMethodplayBack(
                                        1,
                                        'عادي',
                                      ),
                                      newMethodplayBack(
                                        0.9,
                                        '0,9',
                                      ),
                                      newMethodplayBack(
                                        0.8,
                                        '0,8',
                                      ),
                                    ],
                                    child: const Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Audio Controllers
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Sellect Surah
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quranTitle = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      width: MediaQuery.of(context).size.width /
                                          4.3,
                                      decoration: BoxDecoration(
                                          color: backColor,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Center(
                                        child: Text(
                                          selectedSurah,
                                          style: const TextStyle(
                                            fontFamily:
                                                'BigVesta-Arabic-Regular',
                                            wordSpacing: 2,
                                            fontSize: 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Replay 10
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        player?.seek(Duration(
                                            seconds: valuee.toInt() - 10));
                                      });
                                    },
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 9,
                                      child: const Icon(
                                        Icons.forward_10,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  //Play Button
                                  InkWell(
                                    onTap: () async {
                                      await playerr?.pause();
                                      isPlayingg = false;
                                      SharedPreferences prefslidVal =
                                          await SharedPreferences.getInstance();
                                      if (isPlaying) {
                                        await player?.pause();
                                        setState(
                                          () {
                                            isPlaying = false;
                                          },
                                        );
                                      } else {
                                        await player?.resume();
                                        setState(
                                          () {
                                            isPlaying = true;
                                          },
                                        );
                                        player?.onPositionChanged.listen(
                                          (Duration d) {
                                            setState(
                                              () {
                                                valuee = d.inSeconds.toDouble();
                                              },
                                            );
                                          },
                                        );
                                      }
                                      prefslidVal.setDouble('slider', valuee);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        sh["images"][vh],
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.width /
                                              15,
                                      backgroundColor:
                                          const Color.fromARGB(255, 8, 78, 71),
                                      child: Center(
                                        child: Icon(
                                          isPlaying == false ||
                                                  valuee ==
                                                      (duration!.inSeconds)
                                                          .toDouble()
                                              ? Icons.play_arrow
                                              : Icons.pause,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Forward 10
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        player?.seek(Duration(
                                            seconds: valuee.toInt() + 10));
                                      });
                                    },
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 9,
                                      child: const Icon(
                                        Icons.replay_10,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  //Sellect Reader
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quranTitle = 0;
                                        maxSug = 0;
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return FadeIn(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2) -
                                                      150.0,
                                                  left: (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2) -
                                                      150.0,
                                                  top: (MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          2.1) -
                                                      320.0,
                                                  bottom:
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              2.1) -
                                                          280.0,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: itemColor
                                                        ?.withOpacity(0.9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  width: 300,
                                                  height: 600,
                                                  child: GridView.count(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    crossAxisCount: 3,
                                                    children: [
                                                      for (int i = 0;
                                                          i < 18;
                                                          i++)
                                                        GestureDetector(
                                                          onTap: () async {
                                                            SharedPreferences
                                                                prefAudio =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            setState(() {
                                                              player?.seek(
                                                                  Duration
                                                                      .zero);
                                                              lin = sh["links"]
                                                                  [i];
                                                              cach =
                                                                  sh["images"]
                                                                      [i];
                                                              nam = sh["quraa"]
                                                                  [i];
                                                              vh = i;
                                                              selAudio = i;
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            prefAudio.setInt(
                                                                'audio',
                                                                selAudio);
                                                          },
                                                          child: newMethood01(
                                                            sh["images"][i],
                                                            sh["quraa"][i],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.3,
                                      decoration: BoxDecoration(
                                          color: backColor,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Center(
                                        child: Text(
                                          nam,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily:
                                                'BigVesta-Arabic-Regular',
                                            wordSpacing: 2,
                                            fontSize: 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              bottom: 154,
              left: (MediaQuery.of(context).size.width / 3),
              right: (MediaQuery.of(context).size.width / 3),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    sho = false;
                  });
                },
                icon: CircleAvatar(
                  backgroundColor: itemColor?.withOpacity(0.6),
                  radius: 20,
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //PopupMenuItemSpeed
  PopupMenuItem<dynamic> newMethodplayBack(
    double rate,
    String name,
  ) {
    return PopupMenuItem(
      height: 32,
      onTap: () {
        setState(() {
          player?.setPlaybackRate(rate);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'BigVesta-Arabic-Regular',
              fontSize: 16,
              height: 0.5,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  //Quran pages
  Center newMethodpage(
    String url1,
    String url2,
  ) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        child: ImageFiltered(
          imageFilter: ColorFilter.mode(
            qrColor!,
            BlendMode.saturation,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: url1,
                placeholder: (context, url) => Center(
                  child: SpinKitThreeBounce(
                    size: 24,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.red
                              : const Color.fromARGB(255, 228, 137, 137),
                        ),
                      );
                    },
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error,
                            size: 32,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "تعذر الإتصال بالإنترنت",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 40,
                              fontFamily: 'me_quran',
                              wordSpacing: 2,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: url2,
                placeholder: (context, url) => Center(
                  child: SpinKitThreeBounce(
                    size: 24,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.red
                              : const Color.fromARGB(255, 228, 137, 137),
                        ),
                      );
                    },
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error,
                            size: 32,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "تعذر الإتصال بالإنترنت",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 40,
                              fontFamily: 'me_quran',
                              wordSpacing: 2,
                              color: Colors.red,
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
        ),
      ),
    );
  }

  //Quran Pages 2
  Center newMethodpage2(
    String url1,
  ) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            58,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ImageFiltered(
            imageFilter: ColorFilter.mode(
              qrColor!,
              BlendMode.saturation,
            ),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  62,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 80,
                ),
                child: CachedNetworkImage(
                  imageUrl: url1,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: SpinKitThreeBounce(
                      size: 24,
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.red
                                : const Color.fromARGB(255, 228, 137, 137),
                          ),
                        );
                      },
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error,
                              size: 32,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "تعذر الإتصال بالإنترنت",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 40,
                                fontFamily: 'me_quran',
                                wordSpacing: 2,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Reader item
  SizedBox newMethood01(
    String a,
    String b,
  ) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(a),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              b,
              style: const TextStyle(
                  fontFamily: 'BigVesta-Arabic-Regular',
                  wordSpacing: 2,
                  fontSize: 8,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
