import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/debouncer.dart';



class AllSessionsViewModel with ChangeNotifier {

  final TextEditingController  searchController= TextEditingController();
  final TextEditingController  searchController1= TextEditingController();



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


  AllSessionsViewModel() {}



  @override
  void dispose() {

    super.dispose();
  }


}


