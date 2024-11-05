import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:uhcs_dental_app/utils/helpers/app_layout_helpers.dart';

import '../../../utils/color_utils.dart';

class CarouselProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}


// class CarouselSliderWidget extends StatelessWidget {
//   final List<String> images;
//
//   CarouselSliderWidget({required this.images});
//
//   @override
//   Widget build(BuildContext context) {
//     final carouselProvider = Provider.of<CarouselProvider>(context);
//
//     return Column(
//       children: [
//         CarouselSlider.builder(
//           itemCount: images.length,
//           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//             return Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(images[itemIndex]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             );
//           },
//           options: CarouselOptions(
//             height: 200,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             onPageChanged: (index, reason) {
//               carouselProvider.updateIndex(index);
//             },
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: images.asMap().entries.map((entry) {
//             return GestureDetector(
//               onTap: () => carouselProvider.updateIndex(entry.key),
//               child: Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: EdgeInsets.symmetric(horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: (carouselProvider.currentIndex == entry.key
//                       ? Colors.blueAccent
//                       : Colors.grey),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
//  Replace with your actual provider file

// Replace with your actual provider file

class CarouselSliderWidget extends StatelessWidget {
  final List<String> images;

  CarouselSliderWidget({required this.images});

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return Container(
              // height: ch(143.45),
              decoration: BoxDecoration(
                // color: AppColor.cd6dfe0,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(images[itemIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: ch(143.45),
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              carouselProvider.updateIndex(index);
            },
            enableInfiniteScroll: false,
          ),
        ),
        Positioned(
          bottom: ch(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselProvider.updateIndex(entry.key),
                child: Container(
                  width: cw(6),
                  height: cw(6),
                  margin: EdgeInsets.symmetric(horizontal: 1.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (carouselProvider.currentIndex == entry.key
                        ? AppColor.blue
                        : Colors.grey),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
