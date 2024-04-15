import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:translator/translator.dart';
import 'package:untitled/api/call.api.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import 'package:untitled/utils/routes.util.dart';
import '../../../models/news.model.dart';
import '../../inApp/view/inApp.view.dart';

class CollapsibleSidebarLanguageController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  RxBool isBottomBarVisible = true.obs;
  RxList? newsList = [].obs;
  RxInt totalPages = 0.obs;
  List<String> categoryList = [
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology"
  ];
  int categoryIndex = 0;
  int pagination = 1;
  String category = "general";
  RxBool isPlaying = false.obs;
  RxString language = "en".obs;
  List<String> languageList = [
    "en-IN",
    "hi-IN",
    "mr-IN",
    "gu-IN",
    "kn-IN",
    "bn-IN",
    "pa-IN",
    "ml-IN",
    "ta-IN",
    "te-IN"
  ];
  List<String> newsHeadlineList = [
    "ED issues 7th summons to CM Arvind Kejriwal in Delhi excise policy probe",
    "शराब घोटाले में पूछताछ के लिए केजरीवाल को सातवां समन, बढ़ सकती है दिल्ली सीएम की परेशानी",
    "चीनची अरेरावी, मागे हटायला तयार नाही, अखेर भारताच्या संरक्षण सचिवांच मोठं विधान",
    "અમીન સાયાની અને ગુજરાત:ગાંધીજીએ અમીન સાયાનીને કઈ રીતે રેડિયો સ્ટાર બનાવ્યા? નાના ગાંધીજીના અંગત ડૉક્ટર હતા, મા-દીકરા બંનેને પદ્મશ્રી મળ્યો",
    "ಸಾಲ ಮಾಡಿ ತುಪ್ಪ ತಿಂದ ಬೊಮ್ಮಾಯಿ, ಬಡ್ಡಿ ಕಟ್ಟುತ್ತಿರುವ ಪ್ರಿಯಾಂಕ್ ಖರ್ಗೆ : ಸದನದಲ್ಲಿ ಏನಿದು?",
    "গোটা পাকিস্তান ‘কিনতে’ পারে টাটা! ভারতের একটি রাজ্যই ছুঁয়ে ফেলছে প্রতিবেশী দেশের জিডিপিকে",
    "ਆਮਦਨ ਤੋਂ ਵੱਧ ਜਾਇਦਾਦ ਮਾਮਲੇ 'ਚ ਬਿਹਾਰ ਕੇਡਰ ਦੇ ਸੇਵਾਮੁਕਤ ਆਈਏਐੱਸ ਅਧਿਕਾਰੀ ਖ਼ਿਲਾਫ਼ ਸੀਬੀਆਈ ਦੀ ਕਾਰਵਾਈ, ਦਿੱਲੀ ਸਥਿਤ ਰਿਹਾਇਸ਼ ਦੀ ਤਲਾਸ਼ੀ",
    "സൗദിക്ക് മാത്രമല്ല, യുഎഇക്കും ഇറാഖിനും ഇന്ത്യയില്‍ വന്‍ തിരിച്ചടി: എല്ലാത്തിനും കാരണം ആ രാജ്യം",
    "சிறையில் இருந்தே குற்றவாளி வாதாட ஐகோர்ட் அனுமதி.",
    "ఎఫ్‌డీ వడ్డీ రేట్లు పెంచిన ఐసీఐసీఐ బ్యాంక్.. మరి SBI, HDFC‌లతో పోలిస్తే ఎందులో ఎక్కువ?",
  ];
  List<String> newsContentList = [
    "The financial crimes probe agency has so far filed six charge sheets in the excise policy probe against 31 individuals and entities, including former deputy CM Manish Sisodia. The Enforcement Directorate (ED) has issued fresh summons to the Delhi chief minister Arvind Kejriwal in its excise policy money laundering probe asking him to appear before it on February 26, people familiar with the development said on Thursday. The latest (seventh) summons were issued after the Aam Aadmi Party (AAP) convener continued to skip interrogation by the financial crimes probe agency since November 2 last year.",
    "केजरीवाल को इससे पहले ईडी छह समन भेज चुकी है, लेकिन दिल्ली सीएम किसी ना किसी वजह से ईडी के सामने पेश नहीं हुए हैं। ईडी ने दिल्ली सीएम अरविंद केजरीवाल को दिल्ली शराब घोटाले में पूछताछ के लिए सातवां समन भेज दिया है। केजरीवाल को इससे पहले ईडी छह समन भेज चुकी है, लेकिन दिल्ली सीएम किसी ना किसी वजह से ईडी के सामने पेश नहीं हुए हैं। अब सातवां समन जारी होने से अरविंद केजरीवाल की मुश्किल बढ़ सकती है। दिल्ली शराब घोटाले में कथित मनी लॉन्ड्रिंग के आरोप लगे हैं और इसी मामले में पूछताछ के लिए ईडी ने दिल्ली सीएम अरविंद केजरीवाल को समन जारी किया है। इससे पहले बीती 14 फरवरी को भी ईडी ने केजरीवाल को पूछताछ के लिए समन भेजा था, लेकिन केजरीवाल छठे समन पर भी ईडी के सामने पेश नहीं हुए थे।",
    "महिला प्रीमियर लीगचा (डब्ल्यूपीएल) दुसरा हंगाम २३ फेब्रुवारीपासून सुरू होणार आहे. गतविजेत्या मुंबई इंडियन्स आणि दिल्ली कॅपिटल्स यांच्यातील स्पर्धेतील पहिला सामना बंगळुरूच्या एम चिन्नास्वामी स्टेडियमवर होणार आहे. या सामन्यापूर्वी बीसीसीआय एक शानदार उद्घाटन सोहळा आयोजित करणार आहे. त्यात बॉलिवूडचे स्टार्स परफॉर्म करणार आहेत. अभिनेता शाहरुख खानही उद्घाटन सोहळ्यात परफॉर्म करणार आहे. त्याच्यासोबत चित्रपटसृष्टीतील सर्व कलाकार रसिकांचे मनोरंजन करताना दिसणार आहेत.२३ फेब्रुवारी रोजी सायंकाळी ६.३० वाजता उद्घाटन सोहळा सुरू होईल. यामध्ये कार्तिक आर्यन, टायगर श्रॉफ, वरुण धवन, सिद्धार्थ मल्होत्रा ​​आणि शाहिद कपूर परफॉर्म करणार आहेत. गेल्या वेळी, कियारा अडवाणी आणि क्रिती सेनॉन सारख्या स्टार्सने उद्घाटन समारंभात परफॉर्म केले होते.",
    "વડાપ્રધાન નરેન્દ્ર મોદી આજે ગુજરાતના પ્રવાસે છે અને પોતાના આ પ્રવાસ દરમિયાન તેઓ રાજ્યમાં વિવિધ 57 હજાર કરોડ રૂપિયાથી વધુના વિકાસ પ્રોજેક્ટનું ઉદ્ઘાટન અને શિલાન્યાસ કરશે. વડાપ્રધાન નરેન્દ્ર મોદી સવારે 10:20 વાગ્યે અમદાવાદ એરપોર્ટ પર પહોંચ્યા હતા. તેમને રિસિવ કરવા રાજ્યના મુખ્યમંત્રી અને શહેરના મેયર પ્રતિભા જૈન પહોંચ્યા હતા. વડાપ્રધાન મોદી  GCMMFની સુવર્ણ જયંતીની ઉજવણીમાં હાજરી આપવા નમો સ્ટેડિયમમાં પહોંચી ગયા છે. આજે વડાપ્રધાન ગુજરાતના પ્રવાસે છે. પોતાના પ્રવાસ દરમિયાન તેઓ વિવિધ કાર્યક્રમમાં હાજરી આપશે. અમદાવાદથી બપોરે મહેસાણામાં વાળીનાથ મહાદેવ મંદિરે પૂજા અર્ચના કરશે. આ ઉપરાંત તેઓ મહેસાણામાં એક જાહેર સભામાં શિલાન્યાસ કરશે અને 8,350 કરોડ રૂપિયાના વિકાસ પ્રોજેક્ટનું ઉદ્ઘાટન કરશે.",
    "ಹಣಕಾಸಿನ ಶಿಸ್ತು ದಾರಿ ತಪ್ಪುತ್ತಿದೆ, ಏಳನೇ ವೇತನ ಆಯೋಗ ಬರುತ್ತಿದೆ. ಅದನ್ನೇ ಜಾರಿ ಮಾಡಲೇ ಬೇಕಿದೆ, ಅದಕ್ಕೆ ಹೆಚ್ಚುವರಿಯಾಗಿ ಇಪ್ಪತ್ತು ಸಾವಿರ ಕೋಟಿ ರೂಪಾಯಿ ಬೇಕೆಂದು ನಿಮ್ಮ ಸರ್ಕಾರವೇ ಹೇಳಿದೆ. ಆದರೆ ಅದಕ್ಕೆ ಬಜೆಟ್ ನಲ್ಲಿ ದುಡ್ಡನ್ನು ಒದಗಿಸಿಲ್ಲ. ಹೀಗಿರುವಾಗ, ಅಭಿವೃದ್ದಿಗೆ ದುಡ್ಡು ಎಲ್ಲಿದೆ ಎಂದು ಮಾಜಿ ಸಿಎಂ ಬೊಮ್ಮಾಯಿ ಸರ್ಕಾರವನ್ನು ಪ್ರಶ್ನಿಸಿದರು. ಅಭಿವೃದ್ದಿಗಳನ್ನು ನಿಲ್ಲಿಸಿ ಗ್ಯಾರಂಟಿಗೆ ಹಣವನ್ನು ನೀಡುತ್ತಾ ಹೋದರೆ, ಎಷ್ಟರ ಮಟ್ಟಿಗೆ ಮುಂಬರುವ ದಿನಗಳಲ್ಲಿ ರಾಜ್ಯ ಸಾಲದ ಸುಳಿವಿಗೆ ಸಿಕ್ಕುವುದಿಲ್ಲ ಎಂದು ಪ್ರಶ್ನೆ ಮಾಡಿದ ಬೊಮ್ಮಾಯಿಗೆ ಸಚಿವ ಪ್ರಿಯಾಂಕ್ ಖರ್ಗೆ ತಿರುಗೇಟು ನೀಡಿದರು.",
    "২০০৮ সালের ২৬ নভেম্বর। ভয়াবহ জঙ্গি হামলায় কেঁপে উঠেছিল মুম্বই। ২৬/১১ হামলার মূলচক্রী ছিলেন জঙ্গিগোষ্ঠী লস্কর-ই-তইবার প্রতিষ্ঠাতা হাফিজ মহম্মদ সইদ। আর সেই কারণেই হামলার নেপথ্যে পাকিস্তানের হাত ছিল বলে দাবি করেছিল ভারত। যদিও পাকিস্তান তা স্বীকার করেনি। ভারতের বাণিজ্যনগরীর যে জায়গাগুলিতে জঙ্গিরা হামলা চালিয়েছিল তার মধ্যে অন্যতম ছিল তাজ হোটেল। জঙ্গি হানায় ক্ষতবিক্ষত সেই বিলাসবহুল হোটেলের স্মৃতি এখনও বহু মানুষের মনে তাজা। তবে সেই তাজ হোটেলের মূল গোষ্ঠী, অর্থাৎ টাটারা চাইলে বর্তমানে পুরো পাকিস্তান দেশটাকেই কিনে নিতে পারে।",
    "ਜੇਐੱਨਐੱਨ, ਪਟਨਾ : ਸੀਬੀਆਈ ਨੇ ਆਮਦਨ ਤੋਂ ਵੱਧ ਜਾਇਦਾਦ ਦੇ ਮਾਮਲੇ ਵਿੱਚ ਬਿਹਾਰ ਕੇਡਰ ਦੇ ਸੇਵਾਮੁਕਤ ਭਾਰਤੀ ਪ੍ਰਸ਼ਾਸਨਿਕ ਸੇਵਾ ਅਧਿਕਾਰੀ ਰਮੇਸ਼ ਅਭਿਸ਼ੇਕ ਖ਼ਿਲਾਫ਼ ਕਾਰਵਾਈ ਕੀਤੀ ਹੈ। ਉਸ 'ਤੇ ਭ੍ਰਿਸ਼ਟਾਚਾਰ ਦੇ ਦੋਸ਼ ਹਨ। ਅਧਿਕਾਰੀ ਅਭਿਸ਼ੇਕ ਦੇ ਦਿੱਲੀ ਸਥਿਤ ਰਿਹਾਇਸ਼ੀ ਕੰਪਲੈਕਸ ਦੀ ਤਲਾਸ਼ੀ ਲੈਣ ਦੀ ਜਾਣਕਾਰੀ ਸਾਹਮਣੇ ਆ ਰਹੀ ਹੈ। ਉਸ ਦੇ ਰਿਹਾਇਸ਼ੀ ਅਤੇ ਦਫ਼ਤਰ ਦੀ ਤਲਾਸ਼ੀ ਲਈ ਗਈ ਹੈ। ਉਹ ਫਾਰਵਰਡ ਮਾਰਕੀਟ ਕਮਿਸ਼ਨ ਦੇ ਚੇਅਰਮੈਨ ਵਜੋਂ ਵੀ ਕੰਮ ਕਰ ਚੁੱਕੇ ਹਨ। ਸੇਵਾਮੁਕਤੀ ਤੋਂ ਬਾਅਦ ਉਹ ਇਸ ਸਮੇਂ ਇੱਕ ਪ੍ਰਾਈਵੇਟ ਕੰਪਨੀ ਵਿੱਚ ਕੰਮ ਕਰ ਰਹੇ ਹਨ।ਏਜੰਸੀ ਭ੍ਰਿਸ਼ਟਾਚਾਰ ਦੇ ਮਾਮਲੇ ਵਿੱਚ ਦਿੱਲੀ ਵਿੱਚ ਅਭਿਸ਼ੇਕ ਦੇ ਇੱਕ ਟਿਕਾਣੇ ਦੀ ਵੀ ਤਲਾਸ਼ੀ ਲੈ ਰਹੀ ਹੈ। ਭ੍ਰਿਸ਼ਟਾਚਾਰ ਰੋਕੂ ਇਕਾਈ ਲੋਕਪਾਲ ਰਮੇਸ਼ ਅਭਿਸ਼ੇਕ ਵਿਰੁੱਧ ਆਮਦਨ ਤੋਂ ਵੱਧ ਜਾਇਦਾਦ ਦੇ ਦੋਸ਼ਾਂ ਦੀ ਵੀ ਜਾਂਚ ਕਰ ਰਹੀ ਹੈ।",
    "ഡല്‍ഹി: ഡിസംബറില്‍ ഇന്ത്യയിലേക്ക് ഏറ്റവും കൂടുതല്‍ ക്രൂഡ് ഓയില്‍ കയറ്റി അയച്ച രാജ്യങ്ങളുടെ പട്ടികയില്‍ ഒന്നാമതായി റഷ്യ. കഴിഞ്ഞ കുറച്ച് മാസങ്ങളായി തുടരുന്ന സ്ഥാനം റഷ്യ ഡിംസംബറിലും നിലനിർത്തുകയായിരുന്നു. റഷ്യയില്‍ നിന്നുള്ള ക്രൂഡ് ഇറക്കുമതി കഴിഞ്ഞ വർഷം നവംബറിലെ 3.61 ബില്യൺ ഡോളറിൽ നിന്ന് 8% വർദ്ധിച്ചതായി കണക്കുകള്‍ വ്യക്തമാക്കുന്നു. 2023-ൽ ഇന്ത്യയിലേക്കുള്ള ഏറ്റവും വലിയ ക്രൂഡ് വിതരണക്കാരായിരുന്നു റഷ്യ.",
    "சென்னை:சென்னை அடையாறு காந்தி நகரில், 'விஸ்வபிரியா பைனான்ஸ் சர்வீஸ், செக்யூரிட்டி பிரைவேட் லிமிடெட்'",
    "Bank FDs: ఐసీఐసీఐ బ్యాంక్ ఇటీవలే ఎంపిక చేసిన టెన్యూర్లపై ఫిక్స్‌డ్ డిపాజిట్ వడ్డీ రేట్లను పెంచింది. తాజా సవరణ తర్వాత ఐసీఐసీఐ బ్యాంక్ 7 రోజుల నుంచి 10 ఏళ్ల టెన్యూర్లపై జనరల్ కస్టమర్లకు 3 శాతం నుంచి 7.2 శాతం మేర వడ్డీ రేట్లు అందిస్తోంది. అలాగే సీనియర్ సిటిజన్లకు అదనంగా 50 బేసిస్ పాయింట్లు అంటే 3.5 శాతం నుంచి 7.75 శాతం వరకు వడ్డీ కల్పిస్తోంది. 15 నెలల నుంచి రెండేళ్ల మెచ్యూరిటీ పీరియడ్ పై ఐసీఐసీఐ బ్యాంక్ జనరల్ కస్టమర్లకు గరిష్ఠంగా 7.20 శాతం వడ్డీ అందిస్తుండగా.. సీనియర్ సిటిజన్లకు 7.75 శాతం వడ్డీ ఆఫర్ చేస్తోంది. కొత్త వడ్డీ రేట్లు ఫిబ్రవరి 17వ తేదీ నుంచే అమలులోకి వచ్చాయి.అయితే, ఐసీఐసీఐ బ్యాంక్ ఫిక్స్‌డ్ డిపాజిట్లపై వడ్డీ రేట్లు సవరించిన క్రమంలో ఇతర దిగ్గజ బ్యాంకులతో పోల్చి చూసుకుని డిపాజిట్ చేస్తే మంచి రాబడి పొందవచ్చు.",
  ];

  PageController pageController = PageController();

  init(String category) {
    this.category = category;
    hiveGet();
    isConnected();
    print(
        "-----------------------------------------------------------------------------End------------------------------------------------------------");
  }

  CollapsibleSidebarLanguageController() {
    pageController.addListener(() {
      if (pageController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isBottomBarVisible.value = false;
      } else {
        isBottomBarVisible.value = true;
      }
    });
    super.onInit();
  }

  void isConnected({int page = 0}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);

    if (connectivityResult != ConnectivityResult.none) {
      // hivePut();
      if (page == 0 || ((newsList!.length - 5) == (page + 1))) {
        if (page == 0) {
          newsList?.value = [];
          totalPages.value = 0;
        }
        apiCall(category: category, page: pagination);
      }
    } else {
      // if (newsList!.isEmpty) {
      //   hiveGet();
      // }
    }
  }

  apiCall({String category = "general", page}) async {
    var res = await ApiCall.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&page=$page&apiKey=26ef454f72424685bb87ab491ee9c446");

    NewsModel newsRes = NewsModel.fromJson(res);

    if (newsRes.status == "ok") {
      print("Pagination: $page");
      if (newsRes.articles!.isNotEmpty) {
        hivePut(newsRes.articles!);
        hiveGet();

        print("Api response- totalResults: ${newsRes.totalResults}  $category");
      }
    }
  }

  onPageChange(int page) {
    print("${page + 1} ${newsList?.length}");
    isConnected(page: page);
    stopSpeaking();
    // if (!isDataAvailable) return;
    if ((page == (totalPages.value - 6)) &&
        (categoryList.length != categoryIndex)) {
      pagination++;
    }
    if (page == (newsList!.length - 1)) {
      SnackbarHelper.error("End of page");
    }
  }

  onReadMoreClick(String? source) async {
    RoutesUtil.to(() => InAppView(
        url: source ??
            "https://api.flutter.dev/flutter/widgets/PageView-class.html"));

    // var url = Uri.parse("https://api.flutter.dev/flutter/widgets/PageView-class.html" ?? "");
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // }
  }

  hivePut(List<Articles> articles) async {
    var box = await Hive.openBox("user");

    box.put("newsData", articles);

    // await box.close();
  }

  hiveGet() async {
    var box = await Hive.openBox("user");
    var res = box.get("newsData");

    if (res == null) {
      SnackbarHelper.error("No Data Found");
    } else {
      newsList?.addAll(res);
      totalPages.value = newsList!.length;
      print("Total pages: ${totalPages.value}");
      print("Hive get: Data available");
    }

    // await box.close();
  }

  Future<void> speak(String text, String language) async {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value == false) {
      await flutterTts.pause();
      return;
    }
    // print("Translating");
    // var translation = await translator.translate(text, to: 'bn');
    // print(translation);

    print("Speaking");
    print(language);
    print(text);
    await flutterTts.setLanguage(language);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    flutterTts.setCompletionHandler(() => stopSpeaking());
  }

  stopSpeaking() async {
    isPlaying.value = false;
    await flutterTts.stop();
  }

  onLanguageClick() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          onClosing: () {
            Get.back();
          },
          builder: (context) {
            return Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Wrap(
                children: [
                  MaterialButton(
                    onPressed: () {
                      language.value = languageList[0];
                    },
                    minWidth: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 0,
                    child: const Text(
                      "English",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
