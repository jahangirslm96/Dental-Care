import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/debouncer.dart';



class DashboardMainViewModel with ChangeNotifier {

  final _debouncer = Debouncer(milliseconds: 500);
  final TextEditingController  searchController= TextEditingController();


  String _selectedState = 'Albama';

  String get selectedState => _selectedState;

  void setSelectedState(String newState) {
    _selectedState = newState;
    notifyListeners();
  }

  Map? _selectedAccount;
  Map get selectedAccount => _selectedAccount ?? {};
  set selectedAccount(Map value) {
    _selectedAccount = value;
    notifyListeners();
  }

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void updateSearchQuery(String newQuery) {
    _searchQuery = newQuery;
    notifyListeners();
  }

  void clearSearchQuery() {
    _searchQuery = '';
    notifyListeners();
  }

  // final List<SliderItem> _sliderItems = [
  //   SliderItem(imageUrl: 'assets/images/image1.png', title: 'The Importance Of Regular Dental Check-Up'),
  //   SliderItem(imageUrl: 'assets/images/image2.png', title: 'Preventive Dental Care'),
  //   SliderItem(imageUrl: 'assets/images/image3.png', title: 'Maintaining Oral Hygiene'),
  // ];
  //
  // List<SliderItem> get sliderItems => _sliderItems;
  DashboardMainViewModel() {}

  // void searchBeneficiary(String val, String type) {
  //   if (val.isEmpty) {
  //     _debouncer.run(() {
  //       filteredBeneList = beneficiariesList
  //           .where((element) =>
  //       element["beneType"].toString().toLowerCase() ==
  //           type.toLowerCase())
  //           .toList();
  //
  //       notify();
  //     });
  //   } else {
  //     _debouncer.run(() {
  //       filteredBeneList = beneficiariesList
  //           .where((element) =>
  //       element["beneType"].toString().toLowerCase() ==
  //           type.toLowerCase())
  //           .where((item) => item["nickName"]
  //           .toString()
  //           .toLowerCase()
  //           .contains(val.toLowerCase()))
  //           .toList();
  //
  //       notify();
  //     });
  //   }
  // }



  @override
  void dispose() {

    super.dispose();              // Call the superclass dispose
  }


}


