import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_back_button.dart';
import 'package:uhcs_dental_app/ui/molecules/appbar/widgets/app_bar_search_icon.dart';
import 'package:uhcs_dental_app/ui/molecules/bottom_navigation/custom_bottom_navigation.dart';
import 'package:uhcs_dental_app/utils/app_dismiss_keyboard.dart';
import 'package:uhcs_dental_app/utils/font_size.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
import 'package:uhcs_dental_app/view/dashboard/payment_method/payment_method_view.dart';
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/widgets/activities_view.dart';
import 'package:uhcs_dental_app/view/dashboard/profile/my_profile/widgets/personal_info_view.dart';


import '../../../../ui/molecules/app_text/app_text.dart';
import '../../../../utils/asset_utils.dart';
import '../../../../utils/color_utils.dart';


class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDismissKeyboard(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAppBar(context),
              _buildBody(context), // Body will contain TabBarView
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          PersonalInfoView(),
          ActivitiesView(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ch(24)),
        Container(
          height: ch(270),
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 4.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: AppColor.c1573FE.withOpacity(0.41),
              ),
            ],
          ),
          child: Stack(

            children: [

              // Expanded(
              //   child: Stack(
              //     alignment: Alignment.center,
              //     children: [
              //       // Background container with blue and curve
              //       Positioned(
              //         top: 0,
              //         left: 0,
              //         right: 0,
              //         child: Container(
              //           height: 200, // Adjust as needed
              //           decoration: BoxDecoration(
              //             color: Colors.blue.shade900,
              //             borderRadius: BorderRadius.only(
              //               bottomLeft: Radius.circular(50),
              //               bottomRight: Radius.circular(50),
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //       // Profile image in circular shape
              //       // Positioned(
              //       //   top: 130, // Adjust based on how much overlap you want
              //       //   child: CircleAvatar(
              //       //     radius: 50, // Adjust size of the image
              //       //     // backgroundImage: AssetImage(AssetUtils.avatar), // Replace with actual image path
              //       //     backgroundColor: Colors.red, // White background for border
              //       //   ),
              //       // ),
              //
              //       Positioned(
              //         top: ch(130),
              //           child: Image.asset(
              //             AssetUtils.drAvatar
              //           ),
              //       ),
              //       // Person's name (Saleem Saeed)
              //       Positioned(
              //         top: 80,
              //         child: Column(
              //           children: [
              //             Text(
              //               'SALEEM',
              //               style: TextStyle(
              //                 fontSize: 24,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             ),
              //             Text(
              //               'SAEED',
              //               style: TextStyle(
              //                 fontSize: 24,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //       // Edit Icon at top right
              //       Positioned(
              //         top: 20,
              //         right: 20,
              //         child: IconButton(
              //           icon: Icon(Icons.edit, color: Colors.white),
              //           onPressed: () {
              //             // Add your edit action here
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),


              Image.asset(
                AssetUtils.profileBg,
                width: 100.w,
                // height: ch(195.54),
                height: ch(195.54 - 30),
                fit: BoxFit.fill,
                color: AppColor.c082755,
                filterQuality: FilterQuality.high,
              ),



              Positioned(
                top: ch(95),
                // top: ch(125),
                  left: cw(118),
                  right: cw(118),
                  // bottom: ch(0),
                  child: Image.asset(
                    AssetUtils.profileAvatar,
                    width: cw(124),
                    height: cw(124),
                    filterQuality: FilterQuality.high,
                  ),
              ),

              // ** Edit icon ** //
              Positioned(
                top: ch(19.09),
                right: cw(17.22),
                child: SvgPicture.asset(
                  AssetUtils.editIcon,
                  width: cw(23.27),
                  height: ch(22.41),
                  fit: BoxFit.contain,
                ),
              ),


              // //** Name **//
              // Positioned(
              //   top: ch(47.19),
              //   // left: cw(110),
              //   // right: cw(110),
              //   child: AppText(
              //     txt: "SALEEM SAEED",
              //     fontSize: AppFontSize.f27,
              //     color: AppColor.white,
              //     fontWeight: FontWeight.w600,
              //     lineHeight: 30,
              //     letterspacing: cw(-0.3),
              //   ),
              // ),

              /// remove this
              Positioned(
                top: ch(47.19),
                left: (MediaQuery.of(context).size.width - cw(180)) / 2, // 220 is the width of your text
                child: AppText(
                  txt: "SALEEM SAEED",
                  fontSize: AppFontSize.f27,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  lineHeight: 30,
                  letterspacing: cw(-0.3),
                ),
              ),


              // Placeholder for back button and search icon
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // AppBarBackButton(),
              //     // AppBarSearchIcon(),
              //   ],
              // ),

              // Spacer(),
              // Positioned(
              //   top: ch(60),
              //   child: TabBar(
              //     controller: _tabController,
              //     indicatorColor: AppColor.c082755,
              //     indicatorSize: TabBarIndicatorSize.tab,
              //     indicatorWeight: ch(5),
              //     labelStyle: const TextStyle(color: AppColor.c082755,fontSize: 13, fontWeight: FontWeight.w600,height: 1.3,fontFamily: "Poppins"),
              //     unselectedLabelStyle: const TextStyle( color: AppColor.c082755 , fontSize: 13, fontWeight: FontWeight.w500,height: 1.3,fontFamily: "Poppins"),
              //     tabs: [
              //
              //       Tab(
              //         child: Padding(
              //           padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              //           child: Text('Personal Info'.toUpperCase(),),
              //         ),
              //       ),
              //       Tab(
              //         child: Padding(
              //           padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              //           child: Text('Activities'.toUpperCase(), ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // ** TabBar ** //
              Positioned(
                bottom: ch(0),
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100.w,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColor.c082755,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: ch(5),
                      labelStyle: TextStyle(
                        color: AppColor.c082755,
                        fontSize: AppFontSize.f13,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        fontFamily: "Poppins",
                      ),
                      unselectedLabelStyle:  TextStyle(
                        color: AppColor.c082755,
                        fontSize: AppFontSize.f13,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        fontFamily: "Poppins",
                      ),
                      tabs: [
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                            child: Text('Personal Info'.toUpperCase()),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                            child: Text('Activities'.toUpperCase()),
                          ),
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
    );
  }
}



/// previous dashboard

// class DashboardMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> dashboardItems = [
//       {
//         "title": "Dashboard",
//         "image": AssetUtils.dashboardHomeIcon,
//         "onTap": () {
//           print("Navigate to Dashboard");
//           // Add your navigation logic for Dashboard here
//         },
//       },
//       {
//         "title": "Appointment",
//         "image": AssetUtils.appointment,
//         "onTap": () {
//           print("Navigate to Profile");
//           // Add your navigation logic for Profile here
//         },
//       },
//       {
//         "title": "Profile",
//         "image": AssetUtils.profile,
//         "onTap": () {
//           print("Navigate to Settings");
//           // Add your navigation logic for Settings here
//         },
//       },
//       {
//         "title": "Charts",
//         "image": AssetUtils.charts,
//         "onTap": () {
//         },
//       },{
//         "title": "Sessions Record",
//         "image": AssetUtils.sessionsRecord,
//         "onTap": () {
//
//                   },
//       },{
//         "title": "Orders",
//         "image": AssetUtils.orders,
//         "onTap": () {
//           print("Navigate to Messages");
//           // Add your navigation logic for Messages here
//         },
//       },{
//         "title": "Account Settings",
//         "image": AssetUtils.accountSettings,
//         "onTap": () {
//           print("Navigate to Messages");
//           // Add your navigation logic for Messages here
//         },
//       },
//
//     ];
//
//     return Scaffold(
//       drawer: CustomDrawer(),
//       body: Container(
//         height: 100.h,
//         width: 100.w,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AssetUtils.bg),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             // SizedBox(height: ch(24)),
//             // Background Image
//             Image.asset(
//               AssetUtils.dashboardAppBarback,
//               width: 100.w,
//               fit: BoxFit.cover,
//               filterQuality: FilterQuality.high,
//             ),
//
//
//             Builder(
//               builder: (BuildContext innerContext) {
//                 return Positioned(
//                   top: ch(32 + 7),
//                   left: cw(16),
//                   child: GestureDetector(
//                     onTap: () {
//                       // Use the innerContext to open the drawer
//                       Scaffold.of(innerContext).openDrawer();
//                     },
//                     child: SvgPicture.asset(
//                       AssetUtils.drawerIcon,
//                       width: cw(32),
//                       height: ch(18.67),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 );
//               },
//             ),
//
//             // Positioned Widgets on top of the background
//             Positioned(
//               top: ch(63), // Adjust based on where you want it
//               left: cw(57),
//               right: cw(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//
//                   //** Greeting Text **//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         txt: "Hi Saleem,",
//                           fontSize: AppFontSize.f20,
//                           color: AppColor.cFAFAFA,
//                           fontWeight: FontWeight.w600,
//                         lineHeight: 30,
//                         letterspacing: cw(-0.3),
//                       ),
//                       AppText(
//                         txt: "Welcome!",
//                         fontSize: AppFontSize.f16,
//                         color: AppColor.white,
//                         fontWeight: FontWeight.w400,
//                         lineHeight: 22.5,
//                         letterspacing: cw(-0.3),
//                       ),
//                     ],
//                   ),
//
//                   //** Profile and other icon **//
//                   Row(
//                     children: [
//
//                       // Cart icon
//                       SvgPicture.asset(
//                         AssetUtils.cartIcon,
//                         width: cw(21.51),
//                         height: ch(19.85),
//                         fit: BoxFit.contain,
//                       ),
//
//                       SizedBox(
//                         width: cw(12.17),
//                       ),
//
//                       SvgPicture.asset(
//                         AssetUtils.bellIcon,
//                         width: cw(16.9),
//                         height: ch(18.52),
//                         fit: BoxFit.contain,
//                       ),
//
//                       SizedBox(
//                         width: cw(12),
//                       ),
//
//
//                       /// change into dynamic image later
//                       // Profile Image
//                       Image.asset(
//                         AssetUtils.avatar,
//                         width: cw(53),
//                         height: cw(53),
//                         filterQuality: FilterQuality.high,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             _eVisit(),
//
//
//             // Positioned(
//             //   top: ch(356),
//             //   left: cw(16),
//             //   right: cw(16),
//             //   child: Container(
//             //     width: cw(375),
//             //     // height: ch(69),
//             //     margin: EdgeInsets.only(bottom: ch(16)),
//             //     decoration: BoxDecoration(
//             //       color: AppColor.cE5EFF7,
//             //       border: Border.all(
//             //         color: AppColor.c082755.withOpacity(0.2),
//             //         width: cw(1)
//             //       ),
//             //       borderRadius: BorderRadius.circular(cw(8)),
//             //       boxShadow: [
//             //         BoxShadow(
//             //           color: AppColor.black.withOpacity(0.22),
//             //           spreadRadius: 0,
//             //           blurRadius: 6,
//             //           offset: Offset(1, 2),
//             //         ),
//             //       ],
//             //     ),
//             //     child: Padding(
//             //       padding:  EdgeInsets.symmetric(horizontal: cw(14)),
//             //       child: Column(
//             //         children: [
//             //
//             //           SizedBox(
//             //             height: ch(9.64),
//             //           ),
//             //           Row(
//             //             crossAxisAlignment: CrossAxisAlignment.center,
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //
//             //               // SizedBox(
//             //               //   width: cw(14),
//             //               // ),
//             //               Row(
//             //                 children: [
//             //
//             //
//             //                   Container(
//             //                     width: cw(53.17),
//             //                     height: ch(50.72),
//             //                     decoration: BoxDecoration(
//             //                       color: AppColor.c082755,
//             //                       borderRadius: BorderRadius.circular(cw(9)),
//             //                     ),
//             //                     child: Center(
//             //                       child: SvgPicture.asset(
//             //                         AssetUtils.dashboardHomeIcon,
//             //                         width: cw(35.09),
//             //                         height: cw(28.08),
//             //                         fit: BoxFit.contain,
//             //                       ),
//             //                     ),
//             //                   ),
//             //
//             //                   SizedBox(
//             //                     width: cw(9.83),
//             //                   ),
//             //
//             //
//             //                   AppText(
//             //                     txt: "Dashboard",
//             //                     fontSize: AppFontSize.f18,
//             //                     color: AppColor.c082755,
//             //                     fontWeight: FontWeight.w600,
//             //                     lineHeight: 27,
//             //                     letterspacing: cw(-0.3),
//             //                   ),
//             //                 ],
//             //               ),
//             //
//             //               Container(
//             //                 height: cw(41),
//             //                 width: cw(41),
//             //                 decoration: BoxDecoration(
//             //                   color: AppColor.c082755,
//             //                   borderRadius: BorderRadius.circular(cw(60)),
//             //                   boxShadow: [
//             //                     BoxShadow(
//             //                       color: AppColor.black.withOpacity(0.25),
//             //                       spreadRadius: 0,
//             //                       blurRadius: 7,
//             //                       offset: Offset(2, 2),
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 child: Center(
//             //                   child:  SvgPicture.asset(
//             //                     AssetUtils.forwardArrow,
//             //                     width: cw(16),
//             //                     height: cw(16),
//             //                     fit: BoxFit.contain,
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //
//             //           SizedBox(
//             //             height: ch(8.64),
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // top: ch(356),
//             // left: cw(16),
//             // right: cw(16),
//             Padding(
//               padding:  EdgeInsets.only(top:ch(335)),
//               child: ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 itemCount: dashboardItems.length,
//                 // padding: EdgeInsets.symmetric(vertical: ch(16), horizontal: cw(16)),
//                 itemBuilder: (context, index) {
//                   final item = dashboardItems[index];
//                   final isLastItem = index == (dashboardItems.length - 1);
//
//                   return GestureDetector(
//                     onTap: item['onTap'], // Use the onTap from the map
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: cw(16)),
//                       child: Container(
//                         width: cw(375),
//                         margin: isLastItem ? EdgeInsets.only(bottom: ch(30))
//                             : EdgeInsets.only(bottom: ch(16)),
//                         decoration: BoxDecoration(
//                           color: AppColor.cE5EFF7,
//                           border: Border.all(
//                             color: AppColor.c082755.withOpacity(0.2),
//                             width: cw(1),
//                           ),
//                           borderRadius: BorderRadius.circular(cw(8)),
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColor.black.withOpacity(0.22),
//                               spreadRadius: 0,
//                               blurRadius: 6,
//                               offset: Offset(1, 2),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: cw(14)),
//                           child: Column(
//                             children: [
//                               SizedBox(height: ch(9.64)),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         width: cw(53.17),
//                                         height: ch(50.72),
//                                         decoration: BoxDecoration(
//                                           color: AppColor.c082755,
//                                           borderRadius: BorderRadius.circular(cw(9)),
//                                         ),
//                                         child: Center(
//                                           child: SvgPicture.asset(
//                                             item["image"]!,
//                                             width: cw(35.09),
//                                             height: cw(28.08),
//                                             fit: BoxFit.contain,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: cw(9.83)),
//                                       AppText(
//                                         txt: item["title"]!,
//                                         fontSize: AppFontSize.f18,
//                                         color: AppColor.c082755,
//                                         fontWeight: FontWeight.w600,
//                                         lineHeight: 27,
//                                         letterspacing: cw(-0.3),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     height: cw(41),
//                                     width: cw(41),
//                                     decoration: BoxDecoration(
//                                       color: AppColor.c082755,
//                                       borderRadius: BorderRadius.circular(cw(60)),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: AppColor.black.withOpacity(0.25),
//                                           spreadRadius: 0,
//                                           blurRadius: 7,
//                                           offset: Offset(2, 2),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: SvgPicture.asset(
//                                         AssetUtils.forwardArrow,
//                                         width: cw(14),
//                                         height: cw(14),
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: ch(8.64)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _eVisit(){
//   return Positioned(
//     top: ch(124),
//     left: cw(16),
//     right: cw(16),
//     child: Container(
//       width: cw(375),
//       height: ch(210),
//       // padding: EdgeInsets.all(4.w),
//       decoration: BoxDecoration(
//         color: AppColor.white,
//         borderRadius: BorderRadius.circular(cw(12)),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.black.withOpacity(0.25),
//             spreadRadius: -2,
//             blurRadius: 4,
//             offset: Offset(2, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//           SvgPicture.asset(
//             AssetUtils.startEVisit,
//             width: cw(86),
//             height: ch(58.54),
//             fit: BoxFit.contain,
//           ),
//
//           SizedBox(height: ch(17.46)),
//
//           AppText(
//             txt: "Start E-Visit",
//             fontSize: AppFontSize.f20,
//             color: AppColor.c082755,
//             fontWeight: FontWeight.w600,
//             lineHeight: 30,
//             letterspacing: cw(-0.3),
//           ),
//
//         ],
//       ),
//     ),
//   );
// }
// Widget _buildBody({
//   required BuildContext context,
// }) {
//
//   final apiHandler = context.read<ApiIntegrationHandler>(); // No rebuild on change
//   // final model = context.read<RegisterViewModel>();
//
//   return Expanded(
//     child: SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Stack(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//           // Image.asset(
//           //   AssetUtils.dashboardAppBarback,
//           //   width: 100.w,
//           //   fit: BoxFit.cover,
//           //   filterQuality: FilterQuality.high,
//           // ),
//           //
//           //
//           // Positioned(
//           //   top: ch(157),
//           //   child: Container(
//           //     width: cw(327),
//           //     height: ch(120),
//           //     color: AppColor.white,
//           //   ),
//           // ),
//         ],
//       ),
//   ));
// }



//
// // lib/ui/molecules/slider/slider_model.dart
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';
// import 'package:uhcs_dental_app/view_model/dashboard/dashboard_main/all_sessions_view_model.dart';
//
// import '../../../utils/color_utils.dart';
// class SliderItem {
//   final String imageUrl;
//   final String title;
//
//   SliderItem({required this.imageUrl, required this.title});
// }
//
// List<SliderItem> sliderItems = [
//   SliderItem(imageUrl: 'assets/images/image1.png', title: 'The Importance Of Regular Dental Check-Up'),
//   SliderItem(imageUrl: 'assets/images/image2.png', title: 'Preventive Dental Care'),
//   SliderItem(imageUrl: 'assets/images/image3.png', title: 'Maintaining Oral Hygiene'),
// ];
//
//
//
//
//
// class DashboardMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: ch(300),
//           ),
//           Consumer<DashboardMainViewModel>(
//             builder: (context, sliderProvider, child) {
//               return CarouselSlider.builder(
//                 itemCount: sliderProvider.sliderItems.length,
//                 itemBuilder: (context, index, realIndex) {
//                   final sliderItem = sliderProvider.sliderItems[index];
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.red,
//                       borderRadius: BorderRadius.circular(6),
//                       image: DecorationImage(
//                         image: AssetImage(sliderItem.imageUrl),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           bottom: 20,
//                           left: 20,
//                           child: Container(
//                             color: Colors.black54,
//                             padding: EdgeInsets.all(10),
//                             child: Text(
//                               sliderItem.title,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 options: CarouselOptions(
//                   height: ch(143.7),
//                   autoPlay: false,
//                   autoPlayInterval: Duration(seconds: 5),
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.easeInOut,
//                   enlargeCenterPage: true,
//                   onPageChanged: (index, reason) {},
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//


