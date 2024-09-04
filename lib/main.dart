// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paqy_yat/QuranApi/constant.dart';
import 'package:paqy_yat/quran.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences mainprefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainprefs = await SharedPreferences.getInstance();
  final tdd = mainprefs.getInt("Dark") ?? 0;
  final alc = mainprefs.getInt("allcounter") ?? 0;
  final voc = mainprefs.getInt("Mute") ?? 0;
  final mahh = mainprefs.getInt("madina") ?? 0;
  final mobb = mainprefs.getInt("mobb") ?? 0;
  final pagg = mainprefs.getInt("initpage") ?? 0;
  final audd = mainprefs.getInt("audio") ?? 0;
  final slide = mainprefs.getDouble("slider") ?? 0;
  final vv = mainprefs.getBool("view") ?? false;
  final aaa = mainprefs.getInt("prefsa") ?? 0;
  final tran = mainprefs.getBool("transvis") ?? false;
  final tran2 = mainprefs.getBool("transvis2") ?? false;
  final tran3 = mainprefs.getBool("transvis3") ?? false;
  final mod = mainprefs.getInt('moody') ?? 0;
  runApp(MyApp(
    tdd: tdd,
    alc: alc,
    voc: voc,
    mahh: mahh,
    mobb: mobb,
    pagg: pagg,
    audd: audd,
    slide: slide,
    vv: vv,
    aaa: aaa,
    tran: tran,
    tran2: tran2,
    tran3: tran3,
    mod: mod,
  ));
}

class MyApp extends StatefulWidget {
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

  const MyApp({
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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get ayah => null;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      home: Qrrr(
        tdd: widget.tdd,
        alc: widget.alc,
        voc: widget.voc,
        mahh: widget.mahh,
        mobb: widget.mobb,
        pagg: widget.pagg,
        audd: widget.audd,
        slide: widget.slide,
        vv: widget.vv,
        aaa: widget.aaa,
        tran: widget.tran,
        tran2: widget.tran2,
        tran3: widget.tran3,
        mod: widget.mod,
      ),
    );
  }
}
