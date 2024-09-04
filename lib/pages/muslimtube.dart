import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paqy_yat/quran.dart';
import 'package:url_launcher/url_launcher.dart';

class Muslim extends StatefulWidget {
  const Muslim({super.key});

  @override
  State<Muslim> createState() => _MuslimState();
}

var size = 'a';
dynamic iColor = Colors.white;
dynamic tSize = 24.0;
dynamic nSize = 12.0;
Future<void> _launchUrl(dynamic linkk, dynamic x) async {
  if (!await launchUrl(
    Uri.parse(linkk),
    mode: x,
  )) {
    throw 'Could not launch ${Uri.parse(linkk)}';
  }
}

class _MuslimState extends State<Muslim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: itemColor,
        scrolledUnderElevation: 5,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: FadeInRight(
          duration: const Duration(
            milliseconds: 500,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    final paly1 = AudioPlayer();
                    if (volume == 0) {
                      paly1.play(AssetSource("sounds/turnpage-99756.mp3"));
                    }
                    Future.delayed(
                      const Duration(milliseconds: 150),
                      () {
                        sKey.currentState?.openDrawer();
                      },
                    );
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
                child: Text(
                  'روابط خير',
                  style: TextStyle(
                    fontFamily: 'BigVesta-Arabic-Regular',
                    height: 0.7,
                    fontSize: MediaQuery.of(context).size.width / 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FadeInUp(
        duration: const Duration(
          milliseconds: 500,
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                newMethoditemm(
                  'https://youtube.com/playlist?list=PL1i_D1Vw3d5MtZyd56B0IRjyEPCCHs1zd',
                  'https://youtube.com/@-alaahamed5232',
                  'assets/muslim playlists/القصص النبوي ( دورة علمني رسول الله ).jpg',
                  'assets/muslim people/علاء حامد.jpg',
                  'القصص النبوي ( دورة علمني رسول الله )',
                  'علاء حامد',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PL7PzPXcv-qizzewQ_1GufiGsNdZn6IMPJ',
                  'https://youtube.com/@abdelkafytube',
                  'assets/muslim playlists/عمر عبد الكافي.jpg',
                  'assets/muslim people/عمر عبد الكافي.jpeg',
                  'مدرسة رمضان مع دكتور عمر عبد الكافي',
                  'عمر عبد الكافي',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PL3znWKWhVTRZMQFgmVKd604byJjOns0JP',
                  'https://youtube.com/@Way2allahCom',
                  'assets/muslim playlists/رمضان و التغيير.jpg',
                  'assets/muslim people/شبكة الطريق إلى الله .jpg',
                  'رمضان كاست | الحلقات كاملة',
                  'شبكة الطريق إلى الله ',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PL1i_D1Vw3d5OdEWLlSZpbTlKPO9t76WkC',
                  'https://youtube.com/@-alaahamed5232',
                  'assets/muslim playlists/باسمك نحيا.jpeg',
                  'assets/muslim people/علاء حامد.jpg',
                  'باسمك نحيا',
                  'علاء حامد',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLgqtKVxUxe2qvIstyXOFumOVzbGXmmluJ',
                  'https://youtube.com/@mohelghaleez',
                  'assets/muslim playlists/كتابك - رمضان 1440.jpg',
                  'assets/muslim people/الغليظ.jpg',
                  'كتابك - رمضان 1440',
                  'محمد الغليظ',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLgqtKVxUxe2pPUNKfNNbE6EjzlDJrTfFo',
                  'https://youtube.com/@mohelghaleez',
                  'assets/muslim playlists/برنامج شهادة تقدير - رمضان 1442.jpeg',
                  'assets/muslim people/الغليظ.jpg',
                  'برنامج شهادة تقدير - رمضان 1442',
                  'محمد الغليظ',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLCpK4282MCT-lBXi4Nodjzq1TDZsK9qwr',
                  'https://youtube.com/@waie',
                  'assets/muslim playlists/بودكاست وعي.jpg',
                  'assets/muslim people/وعي.jpg',
                  'بودكاست وعي',
                  'وعي',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLSSxr3Rf2_X2oKwiy4UhzIdj4ACzB6dee',
                  'https://youtube.com/@ahmedamer2692',
                  'assets/muslim playlists/السيرة النبوية.jpeg',
                  'assets/muslim people/احمد عامر.jpg',
                  'سلسلة السيرة النبوية',
                  'احمد عامر',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLVdjsGOClzyHqLF_bgbxdPxAKHpGdkqx2',
                  'https://youtube.com/@YasserMamdouh',
                  'assets/muslim playlists/فيديو الجمعة.jpg',
                  'assets/muslim people/ياسر ممدوح.jpeg',
                  'فيديو الجمعة',
                  'ياسر ممدوح',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLg2VgXJ7dHj8r_CSlu7cT24L9lIVcMbsN',
                  'https://youtube.com/@KareemEsmail',
                  'assets/muslim playlists/صلى الله عليه و سلم.jpg',
                  'assets/muslim people/كريم اسماعيل.jpg',
                  'صلى الله عليه و سلم',
                  'كريم اسماعيل',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLxStOxSnFsAzi-Nn-PRITQLFiUIcFIDq2',
                  'https://youtube.com/@user-rm6vp9xb3z',
                  'assets/muslim playlists/ايه المشكلة.jpg',
                  'assets/muslim people/المشكلة.jpg',
                  'بودكاست إيه المشكلة',
                  'إيه المشكلة',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLSSxr3Rf2_X1KkCTVpfCVEVcoY16ACSuf',
                  'https://youtube.com/@ahmedamer2692',
                  'assets/muslim playlists/اصحاب رسول الله.jpeg',
                  'assets/muslim people/احمد عامر.jpg',
                  'أصحاب رسول الله',
                  'احمد عامر',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLCpK4282MCT8jibbOQsc3JBUtRWoI5mZe',
                  'https://youtube.com/@waie',
                  'assets/muslim playlists/الاخلاق.jpg',
                  'assets/muslim people/وعي.jpg',
                  'سلسلة الأخلاق',
                  'وعي',
                ),
                newMethoditemm(
                  'https://youtu.be/pJ0auP7dbcY',
                  'https://youtube.com/@thmanyahPodcasts',
                  'assets/muslim playlists/الخزيمي.jpeg',
                  'assets/muslim people/ثمانية.jpg',
                  'كيف تنجح العلاقات',
                  'ثمانية',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLSSxr3Rf2_X0LhahU5RFyX87dKBAjIkZj',
                  'https://youtube.com/@ahmedamer2692',
                  'assets/muslim playlists/مجالس القرآن.jpeg',
                  'assets/muslim people/احمد عامر.jpg',
                  'مجالس القرآن',
                  'احمد عامر',
                ),
                newMethoditemm(
                  'https://youtube.com/playlist?list=PLSSxr3Rf2_X1QNGSYhHRVM4xW9_CWQe4B',
                  'https://youtube.com/@ahmedamer2692',
                  'assets/muslim playlists/رحلة.jpg',
                  'assets/muslim people/احمد عامر.jpg',
                  'رحلة الى الدار الآخرة',
                  'احمد عامر',
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.width / 10,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        MediaQuery.of(context).size.width / 8,
                      ),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _launchUrl(
                          'https://www.youtube.com/@ibrahimtharwat/playlists',
                          LaunchMode.externalApplication,
                        );
                      });
                    },
                    child: Text(
                      'المزيد من قوائم التشغيل و الفيديوهات',
                      style: TextStyle(
                        fontFamily: 'BigVesta-Arabic-Regular',
                        wordSpacing: 2,
                        height: 1,
                        fontSize: MediaQuery.of(context).size.width / 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'إذا كنت تريد اقتراح قوائم تشغيل قم بالتواصل معنا ',
                      style: TextStyle(
                        fontFamily: 'BigVesta-Arabic-Regular',
                        wordSpacing: 2,
                        height: 1,
                        fontSize: MediaQuery.of(context).size.width / 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _launchUrl(
                            'https://api.whatsapp.com/send?phone=2001553889243&text=%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%20%D8%B9%D9%84%D9%8A%D9%83%D9%85%D8%8C%20%20%D9%83%D9%8A%D9%81%20%D8%A7%D9%84%D8%AD%D8%A7%D9%84!%20',
                            LaunchMode.externalApplication,
                          );
                        });
                      },
                      child: Text(
                        '"اتصل بنا"',
                        style: TextStyle(
                          fontFamily: 'BigVesta-Arabic-Regular',
                          wordSpacing: 2,
                          height: 1,
                          fontSize: MediaQuery.of(context).size.width / 42,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column newMethoditemm(
    String lin1,
    String lin2,
    String image1,
    String image2,
    String playname,
    String playername,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _launchUrl(
                lin1,
                LaunchMode.platformDefault,
              );
            });
          },
          child: Image.asset(
            image1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _launchUrl(
                        lin2,
                        LaunchMode.externalApplication,
                      );
                    });
                  },
                  child: SizedBox(
                    width: 47.6,
                    height: 47.6,
                    child: Stack(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            value: 1,
                            strokeWidth: 13,
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              image2,
                              width: 47.5,
                              height: 47.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _launchUrl(
                      lin1,
                      LaunchMode.platformDefault,
                    );
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playname,
                      style: TextStyle(
                        fontFamily: 'BigVesta-Arabic-Regular',
                        wordSpacing: 2,
                        height: 1,
                        fontSize: MediaQuery.of(context).size.width / 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      playername,
                      style: TextStyle(
                        fontFamily: 'BigVesta-Arabic-Regular',
                        wordSpacing: 2,
                        height: 1,
                        fontSize: MediaQuery.of(context).size.width / 42,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
