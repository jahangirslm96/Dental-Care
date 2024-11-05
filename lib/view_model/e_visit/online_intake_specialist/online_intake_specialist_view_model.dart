import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/debouncer.dart';



class OnlineIntakeViewModel with ChangeNotifier {

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


  OnlineIntakeViewModel() {}

  @override
  void dispose() {

    super.dispose();
  }


}


