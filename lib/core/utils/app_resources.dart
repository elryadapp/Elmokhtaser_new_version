// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AppUi {
  static _AppColors get colors => _AppColors();
  static _AppAssets get assets => _AppAssets();
  static _AppFonts get fonts => _AppFonts();
}

class _AppColors {
  final activeColor = const Color(0xff4FAB79);
  final correctCardColor = const Color(0xff7518DD);
  final emptyAnsCardColor = const Color(0xff3D67E7);
  final titleColor = const Color(0xff484848);
  final subTitleColor = const Color(0xff727272);
  final btnBgColor = const Color(0xffF3F3F3);
  final shadeColor = const Color.fromARGB(255, 191, 203, 207);
  final mainColor = const Color(0xff29B4E3);
  final secondryColor = const Color(0xffF3F3F3);
  final bgColor = const Color(0xffF9F9F9);
  final buttonColor = const Color(0xffED7565);

  final borderColor = const Color(0xffDADADA);

  final whiteColor = Colors.white;
}

class _AppFonts {}

const basePathImages = "assets/images/";
const basePathIcons = "assets/icons/";
const basePathLottie = "assets/lottie/";

class _AppAssets {
  final lottieNotification = '${basePathLottie}lottie/notification.json';
  final contest = '${basePathImages}contest.jpg';
  final madaLogo = '${basePathIcons}Mada_Logo.png';
  final visaLogo = '${basePathIcons}visa.png';
  final signture = '${basePathImages}signature.png';
  final certificateBg = '${basePathImages}certificate_bg.png';
  final certificateShape1 = '${basePathImages}shape1.png';
  final certificateShape2 = '${basePathImages}shape2.png';

  final pdfIcon = '${basePathIcons}pdf.png';
  final zoomIcon = '${basePathIcons}zoom_icon.png';
  final zoom = '${basePathIcons}zoom.png';

  final empty = '${basePathLottie}empty.json';
  final noInternetLottie = '${basePathLottie}no-internet.json';
  final networkImageBaseLink = 'https://emary.azq1.com/Mo5tsr/';
  final gradCap = '${basePathIcons}grad_cap.png';
  final homeFake1 = '${basePathImages}home_fake1.png';
  final logo = '${basePathImages}logo.png';
  final cardIcon = '${basePathIcons}card_icon.png';
  final onBoarding = '${basePathImages}onboarding.png';
  final logoName = '${basePathImages}logo_name.png';
  final fakeCourseImg = '${basePathImages}fake_couse_img.png';

  final couresImg = '${basePathImages}cour_img.png';
  final testImg = '${basePathImages}test_img.png';
  final loadingLottie = '${basePathLottie}loading.json';
  final examImg = '${basePathImages}exam.png';
}
