import 'package:paqy_yat/QuranApi/json.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

String arabicFont = 'quran';
double arabicFontSize = 20;
double mushafFontSize = 24;

Future<void> saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('arabicFontSize', arabicFontSize);
  await prefs.setDouble('mushafFontSize', mushafFontSize);
}

Future<void> getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = prefs.getDouble('arabicFontSize') ?? arabicFontSize;
    mushafFontSize = prefs.getDouble('mushafFontSize') ?? mushafFontSize;
  } catch (e) {
    arabicFontSize = 20;
    mushafFontSize = 24;
  }
}

saveBookMark(surah, ayah) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

readBookmark() async {
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}

List<Map> arabicName = [
  {
    "surah": "1",
    "name": "سُورَةُ ٱلْفَاتِحَةِ",
    "type": "مكية",
  },
  {
    "surah": "2",
    "name": "سُورَةُ البَقَرَةِ",
    "type": "مدنية",
  },
  {
    "surah": "3",
    "name": "سُورَةُ آلِ عِمۡرَانَ",
    "type": "مدنية",
  },
  {
    "surah": "4",
    "name": "سُورَةُ النِّسَاءِ",
    "type": "مدنية",
  },
  {
    "surah": "5",
    "name": "سُورَةُ المَائـِدَةِ",
    "type": "مدنية",
  },
  {
    "surah": "6",
    "name": "سُورَةُ الأَنۡعَامِ",
    "type": "مكية",
  },
  {
    "surah": "7",
    "name": "سُورَةُ الأَعۡرَافِ",
    "type": "مكية",
  },
  {
    "surah": "8",
    "name": "سُورَةُ الأَنفَالِ",
    "type": "مدنية",
  },
  {
    "surah": "9",
    "name": "سُورَةُ التَّوۡبَةِ",
    "type": "مدنية",
  },
  {
    "surah": "10",
    "name": "سُورَةُ يُونُسَ",
    "type": "مكية",
  },
  {
    "surah": "11",
    "name": "سُورَةُ هُودٍ",
    "type": "مكية",
  },
  {
    "surah": "12",
    "name": "سُورَةُ يُوسُفَ",
    "type": "مكية",
  },
  {
    "surah": "13",
    "name": "سُورَةُ الرَّعۡدِ",
    "type": "مدنية",
  },
  {
    "surah": "14",
    "name": "سُورَةُ إِبۡرَاهِيمَ",
    "type": "مكية",
  },
  {
    "surah": "15",
    "name": "سُورَةُ الحِجۡرِ",
    "type": "مكية",
  },
  {
    "surah": "16",
    "name": "سُورَةُ النَّحۡلِ",
    "type": "مكية",
  },
  {
    "surah": "17",
    "name": "سُورَةُ الإِسۡرَاءِ",
    "type": "مكية",
  },
  {
    "surah": "18",
    "name": "سُورَةُ الكَهۡفِ",
    "type": "مكية",
  },
  {
    "surah": "19",
    "name": "سُورَةُ مَرۡيَمَ",
    "type": "مكية",
  },
  {
    "surah": "20",
    "name": "سُورَةُ طه",
    "type": "مكية",
  },
  {
    "surah": "21",
    "name": "سُورَةُ الأَنبِيَاءِ",
    "type": "مكية",
  },
  {
    "surah": "22",
    "name": "سُورَةُ الحَجِّ",
    "type": "مدنية",
  },
  {
    "surah": "23",
    "name": "سُورَةُ المُؤۡمِنُونَ",
    "type": "مكية",
  },
  {
    "surah": "24",
    "name": "سُورَةُ النُّورِ",
    "type": "مدنية",
  },
  {
    "surah": "25",
    "name": "سُورَةُ الفُرۡقَانِ",
    "type": "مكية",
  },
  {
    "surah": "26",
    "name": "سُورَةُ الشُّعَرَاءِ",
    "type": "مكية",
  },
  {
    "surah": "27",
    "name": "سُورَةُ النَّمۡلِ",
    "type": "مكية",
  },
  {
    "surah": "28",
    "name": "سُورَةُ القَصَصِ",
    "type": "مكية",
  },
  {
    "surah": "29",
    "name": "سُورَةُ العَنكَبُوتِ",
    "type": "مكية",
  },
  {
    "surah": "30",
    "name": "سُورَةُ الرُّومِ",
    "type": "مكية",
  },
  {
    "surah": "31",
    "name": "سُورَةُ لُقۡمَانَ",
    "type": "مكية",
  },
  {
    "surah": "32",
    "name": "سُورَةُ السَّجۡدَةِ",
    "type": "مكية",
  },
  {
    "surah": "33",
    "name": "سُورَةُ الأَحۡزَابِ",
    "type": "مدنية",
  },
  {
    "surah": "34",
    "name": "سُورَةُ سَبَإٍ",
    "type": "مكية",
  },
  {
    "surah": "35",
    "name": "سُورَةُ فَاطِرٍ",
    "type": "مكية",
  },
  {
    "surah": "36",
    "name": "سُورَةُ يسٓ",
    "type": "مكية",
  },
  {
    "surah": "37",
    "name": "سُورَةُ الصَّافَّاتِ",
    "type": "مكية",
  },
  {
    "surah": "38",
    "name": "سُورَةُ صٓ",
    "type": "مكية",
  },
  {
    "surah": "39",
    "name": "سُورَةُ الزُّمَرِ",
    "type": "مكية",
  },
  {
    "surah": "40",
    "name": "سُورَةُ غَافِرٍ",
    "type": "مكية",
  },
  {
    "surah": "41",
    "name": "سُورَةُ فُصِّلَتۡ",
    "type": "مكية",
  },
  {
    "surah": "42",
    "name": "سُورَةُ الشُّورَىٰ",
    "type": "مكية",
  },
  {
    "surah": "43",
    "name": "سُورَةُ الزُّخۡرُفِ",
    "type": "مكية",
  },
  {
    "surah": "44",
    "name": "سُورَةُ الدُّخَانِ",
    "type": "مكية",
  },
  {
    "surah": "45",
    "name": "سُورَةُ الجَاثِيَةِ",
    "type": "مكية",
  },
  {
    "surah": "46",
    "name": "سُورَةُ الأَحۡقَافِ",
    "type": "مكية",
  },
  {
    "surah": "47",
    "name": "سُورَةُ مُحَمَّدٍ",
    "type": "مدنية",
  },
  {
    "surah": "48",
    "name": "سُورَةُ الفَتۡحِ",
    "type": "مدنية",
  },
  {
    "surah": "49",
    "name": "سُورَةُ الحُجُرَاتِ",
    "type": "مدنية",
  },
  {
    "surah": "50",
    "name": "سُورَةُ قٓ",
    "type": "مكية",
  },
  {
    "surah": "51",
    "name": "سُورَةُ الذَّارِيَاتِ",
    "type": "مكية",
  },
  {
    "surah": "52",
    "name": "سُورَةُ الطُّورِ",
    "type": "مكية",
  },
  {
    "surah": "53",
    "name": "سُورَةُ النَّجۡمِ",
    "type": "مكية",
  },
  {
    "surah": "54",
    "name": "سُورَةُ القَمَرِ",
    "type": "مكية",
  },
  {
    "surah": "55",
    "name": "سُورَةُ الرَّحۡمَٰن",
    "type": "مدنية",
  },
  {
    "surah": "56",
    "name": "سُورَةُ الوَاقِعَةِ",
    "type": "مكية",
  },
  {
    "surah": "57",
    "name": "سُورَةُ الحَدِيدِ",
    "type": "مدنية",
  },
  {
    "surah": "58",
    "name": "سُورَةُ المُجَادلَةِ",
    "type": "مدنية",
  },
  {
    "surah": "59",
    "name": "سُورَةُ الحَشۡرِ",
    "type": "مدنية",
  },
  {
    "surah": "60",
    "name": "سُورَةُ المُمۡتَحنَةِ",
    "type": "مدنية",
  },
  {
    "surah": "61",
    "name": "سُورَةُ الصَّفِّ",
    "type": "مدنية",
  },
  {
    "surah": "62",
    "name": "سُورَةُ الجُمُعَةِ",
    "type": "مدنية",
  },
  {
    "surah": "63",
    "name": "سُورَةُ المُنَافِقُونَ",
    "type": "مدنية",
  },
  {
    "surah": "64",
    "name": "سُورَةُ التَّغَابُنِ",
    "type": "مدنية",
  },
  {
    "surah": "65",
    "name": "سُورَةُ الطَّلَاقِ",
    "type": "مدنية",
  },
  {
    "surah": "66",
    "name": "سُورَةُ التَّحۡرِيمِ",
    "type": "مدنية",
  },
  {
    "surah": "67",
    "name": "سُورَةُ المُلۡكِ",
    "type": "مكية",
  },
  {
    "surah": "68",
    "name": "سُورَةُ القَلَمِ",
    "type": "مكية",
  },
  {
    "surah": "69",
    "name": "سُورَةُ الحَاقَّةِ",
    "type": "مكية",
  },
  {
    "surah": "70",
    "name": "سُورَةُ المَعَارِجِ",
    "type": "مكية",
  },
  {
    "surah": "71",
    "name": "سُورَةُ نُوحٍ",
    "type": "مكية",
  },
  {
    "surah": "72",
    "name": "سُورَةُ الجِنِّ",
    "type": "مكية",
  },
  {
    "surah": "73",
    "name": "سُورَةُ المُزَّمِّلِ",
    "type": "مكية",
  },
  {
    "surah": "74",
    "name": "سُورَةُ المُدَّثِّرِ",
    "type": "مكية",
  },
  {
    "surah": "75",
    "name": "سُورَةُ القِيَامَةِ",
    "type": "مكية",
  },
  {
    "surah": "76",
    "name": "سُورَةُ الإِنسَانِ",
    "type": "مدنية",
  },
  {
    "surah": "77",
    "name": "سُورَةُ المُرۡسَلَاتِ",
    "type": "مكية",
  },
  {
    "surah": "78",
    "name": "سُورَةُ النَّبَإِ",
    "type": "مكية",
  },
  {
    "surah": "79",
    "name": "سُورَةُ النَّازِعَاتِ",
    "type": "مكية",
  },
  {
    "surah": "80",
    "name": "سُورَةُ عَبَسَ",
    "type": "مكية",
  },
  {
    "surah": "81",
    "name": "سُورَةُ التَّكۡوِيرِ",
    "type": "مكية",
  },
  {
    "surah": "82",
    "name": "سُورَةُ الانفِطَارِ",
    "type": "مكية",
  },
  {
    "surah": "83",
    "name": "سُورَةُ المُطَفِّفِينَ",
    "type": "مكية",
  },
  {
    "surah": "84",
    "name": "سُورَةُ الانشِقَاقِ",
    "type": "مكية",
  },
  {
    "surah": "85",
    "name": "سُورَةُ البُرُوجِ",
    "type": "مكية",
  },
  {
    "surah": "86",
    "name": "سُورَةُ الطَّارِقِ",
    "type": "مكية",
  },
  {
    "surah": "87",
    "name": "سُورَةُ الأَعۡلَىٰ",
    "type": "مكية",
  },
  {
    "surah": "88",
    "name": "سُورَةُ الغَاشِيَةِ",
    "type": "مكية",
  },
  {
    "surah": "89",
    "name": "سُورَةُ الفَجۡرِ",
    "type": "مكية",
  },
  {
    "surah": "90",
    "name": "سُورَةُ البَلَدِ",
    "type": "مكية",
  },
  {
    "surah": "91",
    "name": "سُورَةُ الشَّمۡسِ",
    "type": "مكية",
  },
  {
    "surah": "92",
    "name": "سُورَةُ اللَّيۡلِ",
    "type": "مكية",
  },
  {
    "surah": "93",
    "name": "سُورَةُ الضُّحَىٰ",
    "type": "مكية",
  },
  {
    "surah": "94",
    "name": "سُورَةُ الشَّرۡحِ",
    "type": "مكية",
  },
  {
    "surah": "95",
    "name": "سُورَةُ التِّينِ",
    "type": "مكية",
  },
  {
    "surah": "96",
    "name": "سُورَةُ العَلَقِ",
    "type": "مكية",
  },
  {
    "surah": "97",
    "name": "سُورَةُ القَدۡرِ",
    "type": "مكية",
  },
  {
    "surah": "98",
    "name": "سُورَةُ البَيِّنَةِ",
    "type": "مدنية",
  },
  {
    "surah": "99",
    "name": "سُورَةُ الزَّلۡزَلَةِ",
    "type": "مدنية",
  },
  {
    "surah": "100",
    "name": "سُورَةُ العَادِيَاتِ",
    "type": "مكية",
  },
  {
    "surah": "101",
    "name": "سُورَةُ القَارِعَةِ",
    "type": "مكية",
  },
  {
    "surah": "102",
    "name": "سُورَةُ التَّكَاثُرِ",
    "type": "مكية",
  },
  {
    "surah": "103",
    "name": "سُورَةُ العَصۡرِ",
    "type": "مكية",
  },
  {
    "surah": "104",
    "name": "سُورَةُ الهُمَزَةِ",
    "type": "مكية",
  },
  {
    "surah": "105",
    "name": "سُورَةُ الفِيلِ",
    "type": "مكية",
  },
  {
    "surah": "106",
    "name": "سُورَةُ قُرَيۡشٍ",
    "type": "مكية",
  },
  {
    "surah": "107",
    "name": "سُورَةُ المَاعُونِ",
    "type": "مكية",
  },
  {
    "surah": "108",
    "name": "سُورَةُ الكَوۡثَرِ",
    "type": "مكية",
  },
  {
    "surah": "109",
    "name": "سُورَةُ الكَافِرُونَ",
    "type": "مكية",
  },
  {
    "surah": "110",
    "name": "سُورَةُ النَّصۡرِ",
    "type": "مدنية",
  },
  {
    "surah": "111",
    "name": "سُورَةُ المَسَدِ",
    "type": "مكية",
  },
  {
    "surah": "112",
    "name": "سُورَةُ الإِخۡلَاصِ",
    "type": "مكية",
  },
  {
    "surah": "113",
    "name": "سُورَةُ الفَلَقِ",
    "type": "مكية",
  },
  {
    "surah": "114",
    "name": "سُورَةُ النَّاسِ",
    "type": "مكية",
  }
];

List<int> noOfVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

List quran = [jsoon["quran"]];
