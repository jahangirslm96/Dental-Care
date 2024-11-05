import 'package:responsive_sizer/responsive_sizer.dart';

class AppFontSize {
  AppFontSize._();

  // Store device type once and reuse it for cleaner code
  static final bool isTablet = Device.screenType == ScreenType.tablet;

  static double get f40 => isTablet ? 44.0 : 40.0;
  static double get f32 => isTablet ? 36.0 : 32.0;
  static double get f31 => isTablet ? 36.0 : 31.0;
  static double get f30 => isTablet ? 34.0 : 30.0;
  static double get f28 => isTablet ? 32.0 : 28.0;
  static double get f27 => isTablet ? 30.0 : 27.0;
  static double get f26 => isTablet ? 29.0 : 26.0;
  static double get f24 => isTablet ? 28.0 : 24.0;
  static double get f25 => isTablet ? 30.0 : 25.0;
  static double get f22 => isTablet ? 26.0 : 22.0;
  static double get f21 => isTablet ? 24.0 : 21.0;
  static double get f20 => isTablet ? 23.0 : 20.0;
  static double get f19 => isTablet ? 22.0 : 19.0;
  static double get f18 => isTablet ? 21.0 : 18.0;
  static double get f17 => isTablet ? 20.0 : 17.0;
  static double get f16 => isTablet ? 19.0 : 16.0;
  static double get f15 => isTablet ? 18.0 : 15.0;
  static double get f14 => isTablet ? 17.0 : 14.0;
  static double get f13 => isTablet ? 16.0 : 13.0;
  static double get f12 => isTablet ? 14.0 : 12.0;
  static double get f11 => isTablet ? 13.0 : 11.0;
  static double get f10 => isTablet ? 12.0 : 10.0;
  static double get f9  => isTablet ? 11.0 : 9.0;
  static double get f8  => isTablet ? 10.0 : 8.0;
}


