// ignore_for_file: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:paqy_yat/quran.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sebha extends StatefulWidget {
  const Sebha({
    super.key,
  });
  @override
  State<Sebha> createState() => _SebhaState();
}

int sebvar = 0;

class _SebhaState extends State<Sebha> {
  var x = 1000;
  double newMax = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor!,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            child: Stack(
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
                          'السبحة',
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
                FadeInUp(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  child: Column(
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
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            //Restart
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  sebvar = 0;
                                                });
                                              },
                                              child: Container(
                                                color: itemColor,
                                                padding: const EdgeInsets.all(
                                                  8,
                                                ),
                                                child: Icon(
                                                  Icons.refresh,
                                                  color: Colors.white,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      14,
                                                ),
                                              ),
                                            ),
                                            //Total Count
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        elevation: 0,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                40.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            itemColor,
                                                        content: SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width
                                                                  .toDouble() /
                                                              2,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width
                                                                  .toDouble() /
                                                              2.3,
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Colors
                                                                            .white54,
                                                                        size: MediaQuery.of(context).size.width.toDouble() /
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width
                                                                          .toDouble() /
                                                                      40,
                                                                ),
                                                                Text(
                                                                  "عدد التسبيحات الكلي حتى الآن",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .amber,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        36,
                                                                    fontFamily:
                                                                        'BigVesta-Arabic-Regular',
                                                                    wordSpacing:
                                                                        2,
                                                                    height: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width
                                                                          .toDouble() /
                                                                      10,
                                                                ),
                                                                Text(
                                                                  "$allcounter",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        8,
                                                                    fontFamily:
                                                                        'quran',
                                                                    height: 0.5,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width
                                                                            .toDouble() /
                                                                        50),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    SharedPreferences
                                                                        pref3 =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    setState(
                                                                      () {
                                                                        allcounter =
                                                                            0;
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    );
                                                                    pref3.setInt(
                                                                        "allcounter",
                                                                        allcounter);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              32),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          bottom:
                                                                              4,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "جديد",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'BigVesta-Arabic-Regular',
                                                                            wordSpacing:
                                                                                2,
                                                                            fontSize:
                                                                                MediaQuery.of(context).size.width.toDouble() / 28,
                                                                            height:
                                                                                1.33,
                                                                            color:
                                                                                Colors.amber,
                                                                          ),
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
                                                    },
                                                  );
                                                });
                                              },
                                              child: Container(
                                                color: itemColor,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Icon(
                                                  Icons.analytics_outlined,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width
                                                          .toDouble() /
                                                      14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
          const Spacer(
            flex: 3,
          ),
          FadeInUp(
            duration: const Duration(
              milliseconds: 400,
            ),
            child: GestureDetector(
              onTap: () async {
                SharedPreferences pref2 = await SharedPreferences.getInstance();
                SharedPreferences pref3 = await SharedPreferences.getInstance();
                setState(() {
                  allcounter = allcounter + 1;
                  if (sebvar >= 0 && sebvar < newMax) {
                    sebvar = sebvar + 1;
                  } else {
                    sebvar = 0;
                  }
                  pref2.setInt("counter", sebvar);
                  pref3.setInt("allcounter", allcounter);
                });
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.width / 1.1,
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          strokeWidth: MediaQuery.of(context).size.width / 1.2,
                          value: sebvar / x,
                          color: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width / 1.13,
                        height: MediaQuery.of(context).size.width / 1.13,
                        decoration: BoxDecoration(
                          color: itemColor,
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 1.13 / 2,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/decore11.png',
                            ),
                            opacity: 0.05,
                            scale: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              '$sebvar',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 88,
                                fontFamily: 'quran',
                                wordSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          FadeInUp(
            duration: const Duration(
              milliseconds: 400,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (sebvar <= 33) {
                          newMax = 33;
                          x = 33;
                        } else {
                          sebvar = 0;
                          newMax = 33;
                        }
                      });
                    },
                    child: const Text(
                      '33',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'quran',
                        wordSpacing: 2,
                        height: -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (sebvar <= 100) {
                          newMax = 100;
                          x = 100;
                        } else {
                          sebvar = 0;
                          newMax = 100;
                        }
                      });
                    },
                    child: const Text(
                      '100',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'quran',
                        wordSpacing: 2,
                        height: -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (sebvar <= 1000) {
                          newMax = 1000;
                          x = 1000;
                        } else {
                          sebvar = 0;
                          newMax = 1000;
                        }
                      });
                    },
                    child: const Text(
                      '1000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'quran',
                        wordSpacing: 2,
                        height: -1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
