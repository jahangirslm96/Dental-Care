// // import 'package:flutter/cupertino.dart';
// //
// // class MedicalHistoryViewModel with ChangeNotifier {
// //
// //   List<MedicalCondition> _conditions = []; // This will hold added conditions
// //   List<String> _selectedConditions = []; // List to hold selected conditions
// //   String _searchQuery = '';
// //   String? _selectedCondition;
// //
// //   final List<String> _conditionsList = [
// //     'Acne',
// //     'Diabetes',
// //     'Heart Disease',
// //     'Arthritis',
// //     'Asthma',
// //     'Cancer',
// //     'Dementia',
// //     'Hypertension',
// //     'Cholesterol',
// //     'Flu',
// //     'Bronchitis'
// //   ];
// //
// //   List<String> get filteredConditions {
// //     if (_searchQuery.isEmpty) {
// //       return _conditionsList;
// //     }
// //     return _conditionsList
// //         .where((condition) =>
// //         condition.toLowerCase().contains(_searchQuery.toLowerCase()))
// //         .toList();
// //   }
// //
// //   List<MedicalCondition> get conditions => _conditions; // Added conditions
// //   List<String> get selectedConditions => _selectedConditions; // Selected conditions
// //   String? get selectedCondition => _selectedCondition; // Current selected condition
// //
// //   // Add a single condition
// //   void addCondition(MedicalCondition condition) {
// //     _conditions.add(condition);
// //     notifyListeners();
// //   }
// //
// //   // Add selected condition to the list
// //   void addSelectedCondition(String condition) {
// //     if (!_selectedConditions.contains(condition)) {
// //       _selectedConditions.add(condition);
// //       notifyListeners();
// //     }
// //   }
// //
// //   // Remove condition from selected conditions
// //   void removeCondition(String condition) {
// //     _selectedConditions.remove(condition);
// //     notifyListeners();
// //   }
// //
// //   // Clear all selected conditions
// //   void clearSelectedConditions() {
// //     _selectedConditions.clear();
// //     notifyListeners();
// //   }
// //
// //   // Add all selected conditions to the main conditions list
// //   void addAllConditions() {
// //     for (String condition in _selectedConditions) {
// //       addCondition(MedicalCondition(condition)); // Add each selected condition to the main list
// //     }
// //     clearSelectedConditions(); // Clear selected conditions after adding
// //   }
// //
// //   // Set search query
// //   void setSearchQuery(String query) {
// //     _searchQuery = query;
// //     notifyListeners();
// //   }
// //
// //   // Set the selected condition
// //   void setSelectedCondition(String? condition) {
// //     _selectedCondition = condition;
// //     notifyListeners();
// //   }
// //
// //   // Clear the search
// //   void clearSearch() {
// //     _searchQuery = '';
// //     _selectedCondition = null;
// //     notifyListeners();
// //   }
// //
// //
// // }
// //
// // // Model for Medical Condition
// // class MedicalCondition {
// //   String condition;
// //   MedicalCondition(this.condition);
// // }
//
// import 'package:flutter/cupertino.dart';
// //
// // class MedicalHistoryViewModel with ChangeNotifier {
// //
// //   // Medical Conditions
// //   List<MedicalCondition> _conditions = [];
// //   List<String> _selectedConditions = [];
// //   String _searchQuery = '';
// //   String? _selectedCondition;
// //
// //   final List<String> _conditionsList = [
// //     'Acne', 'Diabetes', 'Heart Disease', 'Arthritis', 'Asthma',
// //     'Cancer', 'Dementia', 'Hypertension', 'Cholesterol', 'Flu', 'Bronchitis'
// //   ];
// //
// //   // Family Details Fields
// //   String? _disease;
// //   int? _familyMemberCount;
// //   int? _age;
// //
// //   // Getters for Family Details
// //   String? get disease => _disease;
// //   int? get familyMemberCount => _familyMemberCount;
// //   int? get age => _age;
// //
// //   // Medical Conditions Getters
// //   List<String> get filteredConditions {
// //     if (_searchQuery.isEmpty) {
// //       return _conditionsList;
// //     }
// //     return _conditionsList.where((condition) =>
// //         condition.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
// //   }
// //
// //   List<MedicalCondition> get conditions => _conditions;
// //   List<String> get selectedConditions => _selectedConditions;
// //   String? get selectedCondition => _selectedCondition;
// //
// //   // Methods for Medical Conditions (Unchanged)
// //   void addCondition(MedicalCondition condition) { _conditions.add(condition); notifyListeners(); }
// //   void addSelectedCondition(String condition) { if (!_selectedConditions.contains(condition)) { _selectedConditions.add(condition); notifyListeners(); } }
// //   void removeCondition(String condition) { _selectedConditions.remove(condition); notifyListeners(); }
// //   void clearSelectedConditions() { _selectedConditions.clear(); notifyListeners(); }
// //   void addAllConditions() { for (String condition in _selectedConditions) { addCondition(MedicalCondition(condition)); } clearSelectedConditions(); }
// //   void setSearchQuery(String query) { _searchQuery = query; notifyListeners(); }
// //   void setSelectedCondition(String? condition) { _selectedCondition = condition; notifyListeners(); }
// //   void clearSearch() { _searchQuery = ''; _selectedCondition = null; notifyListeners(); }
// //
// //   // Setters for Family Details
// //   void setDisease(String disease) { _disease = disease; notifyListeners(); }
// //   void setFamilyMemberCount(int count) { _familyMemberCount = count; notifyListeners(); }
// //   void setAge(int age) { _age = age; notifyListeners(); }
// //
// //   void clearFamilyDetails() {
// //     _disease = null;
// //     _familyMemberCount = null;
// //     _age = null;
// //     notifyListeners();
// //   }
// // }
//
// class MedicalHistoryViewModel with ChangeNotifier {
//   // Medical Conditions
//   List<MedicalCondition> _conditions = [];
//   List<String> _selectedConditions = [];
//   String _searchQuery = '';
//   String? _selectedCondition;
//
//   final List<String> _conditionsList = [
//     'Acne', 'Diabetes', 'Heart Disease', 'Arthritis', 'Asthma',
//     'Cancer', 'Dementia', 'Hypertension', 'Cholesterol', 'Flu', 'Bronchitis'
//   ];
//
//   // Family Details Fields
//   String? _disease;
//   int? _familyMemberCount;
//   int? _age;
//
//   // Getters for Family Details
//   String? get disease => _disease;
//   int? get familyMemberCount => _familyMemberCount;
//   int? get age => _age;
//
//   // Medical Conditions Getters
//   List<String> get filteredConditions {
//     if (_searchQuery.isEmpty) {
//       return _conditionsList;
//     }
//     return _conditionsList.where((condition) =>
//         condition.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
//   }
//
//   List<MedicalCondition> get conditions => _conditions;
//   List<String> get selectedConditions => _selectedConditions;
//   String? get selectedCondition => _selectedCondition;
//
//   // Methods for Medical Conditions (Updated)
//   void addCondition(MedicalCondition condition) {
//     _conditions.add(condition);
//     notifyListeners();
//   }
//
//   // Method to add a condition with additional details
//   void addConditionWithDetails(String condition, String? relationship, String? severity) {
//     _conditions.add(MedicalCondition(condition, relationship: relationship, severity: severity));
//     notifyListeners();
//   }
//
//   void addSelectedCondition(String condition) {
//     if (!_selectedConditions.contains(condition)) {
//       _selectedConditions.add(condition);
//       notifyListeners();
//     }
//   }
//
//   void removeCondition(String condition) {
//     _selectedConditions.remove(condition);
//     notifyListeners();
//   }
//
//   void clearSelectedConditions() {
//     _selectedConditions.clear();
//     notifyListeners();
//   }
//
//   void addAllConditions() {
//     for (String condition in _selectedConditions) {
//       addCondition(MedicalCondition(condition));
//     }
//     clearSelectedConditions();
//   }
//
//   void setSearchQuery(String query) {
//     _searchQuery = query;
//     notifyListeners();
//   }
//
//   void setSelectedCondition(String? condition) {
//     _selectedCondition = condition;
//     notifyListeners();
//   }
//
//   void clearSearch() {
//     _searchQuery = '';
//     _selectedCondition = null;
//     notifyListeners();
//   }
//
//   // Setters for Family Details
//   void setDisease(String disease) {
//     _disease = disease;
//     notifyListeners();
//   }
//
//   void setFamilyMemberCount(int count) {
//     _familyMemberCount = count;
//     notifyListeners();
//   }
//
//   void setAge(int age) {
//     _age = age;
//     notifyListeners();
//   }
//
//   void clearFamilyDetails() {
//     _disease = null;
//     _familyMemberCount = null;
//     _age = null;
//     notifyListeners();
//   }
// }
//
// class MedicalCondition {
//   String condition;
//   String? relationship; // Relationship to the user (e.g., parent, sibling)
//   String? severity;     // Severity of the condition (e.g., mild, severe)
//
//   MedicalCondition(this.condition, {this.relationship, this.severity});
// }
//
// // Model for Medical Condition
// // class MedicalCondition {
// //   String condition;
// //   MedicalCondition(this.condition);
// // }

import 'package:flutter/cupertino.dart';

class MedicalHistoryViewModel with ChangeNotifier {
  // Medical Conditions Fields
  List<MedicalCondition> _conditions = [];
  List<String> _selectedConditions = [];
  String _searchQuery = '';
  String? _selectedCondition;

  final List<String> _conditionsList = [
    'Acne', 'Diabetes', 'Heart Disease', 'Arthritis', 'Asthma',
    'Cancer', 'Dementia', 'Hypertension', 'Cholesterol', 'Flu', 'Bronchitis'
  ];

  // Family Details Fields
  String? _disease;
  int? _familyMemberCount;
  int? _age;

  // Getters for Family Details
  String? get disease => _disease;
  int? get familyMemberCount => _familyMemberCount;
  int? get age => _age;

  // Medical Conditions Getters
  List<String> get filteredConditions {
    if (_searchQuery.isEmpty) return _conditionsList;
    return _conditionsList.where(
            (condition) => condition.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  List<MedicalCondition> get conditions => _conditions;
  List<String> get selectedConditions => _selectedConditions;
  String? get selectedCondition => _selectedCondition;

  // Methods for Medical Conditions
  void addCondition(MedicalCondition condition) {
    _conditions.add(condition);
    notifyListeners();
  }

  // Method to add a condition with additional details
  void addConditionWithDetails(String condition, {
    String? relationship, String? severity, int? familyMemberCount, int? age
  }) {
    _conditions.add(MedicalCondition(
      condition,
      relationship: relationship,
      severity: severity,
      familyMemberCount: familyMemberCount,
      age: age,
    ));
    notifyListeners();
  }

  void addSelectedCondition(String condition) {
    if (!_selectedConditions.contains(condition)) {
      _selectedConditions.add(condition);
      notifyListeners();
    }
  }

  void removeCondition(String condition) {
    _selectedConditions.remove(condition);
    notifyListeners();
  }

  void clearSelectedConditions() {
    _selectedConditions.clear();
    notifyListeners();
  }

  void addAllConditions() {
    for (String condition in _selectedConditions) {
      addCondition(MedicalCondition(condition));
    }
    clearSelectedConditions();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCondition(String? condition) {
    _selectedCondition = condition;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _selectedCondition = null;
    notifyListeners();
  }

  // Setters for Family Details
  void setDisease(String disease) {
    _disease = disease;
    notifyListeners();
  }

  void setFamilyMemberCount(int count) {
    _familyMemberCount = count;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  void clearFamilyDetails() {
    _disease = null;
    _familyMemberCount = null;
    _age = null;
    notifyListeners();
  }
}

// Model for Medical Condition
class MedicalCondition {
  final String condition;
  final String? relationship; // Relationship to the user (e.g., parent, sibling)
  final String? severity;     // Severity of the condition (e.g., mild, severe)
  final int? familyMemberCount; // Family member count with the condition
  final int? age;              // Age at diagnosis or relevant age for the condition

  MedicalCondition(this.condition, {
    this.relationship,
    this.severity,
    this.familyMemberCount,
    this.age,
  });
}

