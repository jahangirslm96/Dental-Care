import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/asset_utils.dart';
import '../../utils/helpers/app_layout_helpers.dart';
import '../../view_model/splash/splash_viewModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Call the initializeApp method only once, when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashViewModel>(context, listen: false).initializeApp(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetUtils.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetUtils.uhcsDentalMainLogo,
              width: cw(253),
              height: ch(135),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
