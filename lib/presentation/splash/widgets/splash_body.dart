import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_icons.dart';
import 'dots_section.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        Center(child: SvgPicture.asset(Assets.assetsIconsLogo)),
        const Spacer(),
        const DotsSection(),
        40.h.vSpace
      ],
    );
  }
}
