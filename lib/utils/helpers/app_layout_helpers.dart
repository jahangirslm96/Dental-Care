import 'package:responsive_sizer/responsive_sizer.dart';

double cw(double width) {
  double screenWidth = 100.w; // Get the full width of the screen
  return (width / 375 * screenWidth); // Use 375 as the base reference
}

// General function to get the responsive height based on screen height
double ch(double height) {
  double screenHeight = 100.h; // Get the full height of the screen
  return (height / 812 * screenHeight); // Use 812 as the base reference
}




// double cw(double width) => ((width / 375) * 100).w;
// double ch(double height) => ((height / 812) * 100).h;

