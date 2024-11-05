
import 'package:flutter/cupertino.dart';

// DataFlowHandler
// DataFlowProvider these are the alternatives names that i am thinking to use
// instead of ApiIntegrationHandler.
//
class ApiIntegrationHandler extends ChangeNotifier{

  Map<String, dynamic> _apiIntegrationHandler = {};

  Map<String, dynamic> get apiIntegrationHandler => _apiIntegrationHandler;

  void setFlow({required String key, required Map<String, dynamic> data}) {
    _apiIntegrationHandler[key] = {
      ...(_apiIntegrationHandler[key] ?? {}), // Merge existing data if available
      ...data,
    };
    notifyListeners();
  }

  Map<String, dynamic>? getFlow(String key) {
    return Map<String, dynamic>.from(_apiIntegrationHandler[key] ?? {});
  }


  void removeFlow(String key) {
    _apiIntegrationHandler.remove(key);
    notifyListeners();
  }

}

//
// import 'package:flutter/cupertino.dart';
//
// class ApiIntegrationHandler extends ChangeNotifier {
//   Map<String, dynamic> _apiIntegrationHandler = {};
//   String? _currentFlowKey;  // Store the last used key
//
//   // Getter for the whole handler
//   Map<String, dynamic> get apiIntegrationHandler => _apiIntegrationHandler;
//
//   // Set a flow and store the flow key
//   void setFlow({required String key, required Map<String, dynamic> data}) {
//     _apiIntegrationHandler[key] = {
//       ...(_apiIntegrationHandler[key] ?? {}), // Merge with existing data if available
//       ...data,
//     };
//     _currentFlowKey = key;  // Save the key for future use
//     notifyListeners();
//   }
//
//   // Update the flow using the last used key
//   void updateFlow({required Map<String, dynamic> data}) {
//     if (_currentFlowKey == null) {
//       throw Exception('No flow has been set yet!');
//     }
//     _apiIntegrationHandler[_currentFlowKey!] = {
//       ...(_apiIntegrationHandler[_currentFlowKey!] ?? {}),
//       ...data,
//     };
//     notifyListeners();
//   }
//
//   // Retrieve the flow by key
//   Map<String, dynamic>? getFlow(String key) {
//     return Map<String, dynamic>.from(_apiIntegrationHandler[key] ?? {});
//   }
//
//   // Retrieve the current flow (last used key)
//   Map<String, dynamic>? getCurrentFlow() {
//     if (_currentFlowKey == null) {
//       throw Exception('No flow has been set yet!');
//     }
//     return Map<String, dynamic>.from(_apiIntegrationHandler[_currentFlowKey!] ?? {});
//   }
//
//   // Remove the flow by key
//   void removeFlow(String key) {
//     _apiIntegrationHandler.remove(key);
//     notifyListeners();
//   }
// }



/// Method 1 set individual flows
// import 'package:flutter/material.dart';
//
// class ApiIntegrationHandler extends ChangeNotifier {
//   Map<String, dynamic> _apiIntegrationHandler = {};
//
//   Map<String, dynamic> get apiIntegrationHandler => _apiIntegrationHandler;
//
//   void setFreelancerFlow(Map<String, dynamic> data) {
//     _apiIntegrationHandler["@register"] = {
//       ..._apiIntegrationHandler['@register'] ?? {},
//       ...data,
//       "isFreelancerFlow": true,
//     };
//     notifyListeners();
//   }
//
//   void setCompanyFlow(Map<String, dynamic> data, String intCode) {
//     _apiIntegrationHandler["@register"] = {
//       ..._apiIntegrationHandler['@register'] ?? {},
//       ...data,
//       "isCompanySALFlow": true,
//       "intCode": intCode,
//     };
//     notifyListeners();
//   }
//
//   void removeFlow(String key) {
//     _apiIntegrationHandler.remove(key);
//     notifyListeners();
//   }
//
//   void addDataToFlow(String key, Map<String, dynamic> data) {
//     _apiIntegrationHandler[key] = {
//       ..._apiIntegrationHandler[key] ?? {},
//       ...data,
//     };
//     notifyListeners();
//   }
//
// // Other functions to manage the flow can be added here
// }
/// Method 1 using the provider in widget
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'api_integration_handler.dart'; // Import the handler
//
// class MyFormScreen extends StatelessWidget {
//   final model; // Assume this is your form model
//
//   @override
//   Widget build(BuildContext context) {
//     // Accessing the provider
//     final apiHandler = Provider.of<ApiIntegrationHandler>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Form')),
//       body: Column(
//         children: [
//           // Form fields (e.g., TextFields) here
//           ElevatedButton(
//             onPressed: () {
//               final isFreelancerFlow = apiHandler.apiIntegrationHandler.containsKey("@register") &&
//                   apiHandler.apiIntegrationHandler["@register"]['isFreelancerFlow'] == true;
//
//               if (isFreelancerFlow) {
//                 // Setting data for freelancer flow
//                 apiHandler.setFreelancerFlow({
//                   "name": model.nameController.text,
//                   "mobileNumber": "961${model.mobileController.text}",
//                   "companyName": model.companyNameController.text,
//                   "businessLocation": model.selectedBusinessLocation,
//                   "noOfEmployees": model.selectedNoOfEmployees,
//                   "noOfBranches": model.selectedNoOfBranches,
//                   "annualTurnover": model.selectedAnnualTurnOver,
//                   "isCompanyHoldAccount": model.isCompanyHoldAccount,
//                   "cifNumber": model.isCompanyHoldAccount == true ? model.cifNumberController.text : "",
//                   "companySubName": "Company",
//                 });
//               } else {
//                 // Setting data for company flow
//                 apiHandler.setCompanyFlow({
//                   "name": model.nameController.text,
//                   "mobileNumber": "961${model.mobileController.text}",
//                   "companyName": model.companyNameController.text,
//                   "businessLocation": model.selectedBusinessLocation,
//                   "noOfEmployees": model.selectedNoOfEmployees,
//                   "noOfBranches": model.selectedNoOfBranches,
//                   "annualTurnover": model.selectedAnnualTurnOver,
//                   "isCompanyHoldAccount": model.isCompanyHoldAccount,
//                   "cifNumber": model.isCompanyHoldAccount == true ? model.cifNumberController.text : "",
//                   "companySubName": "Company",
//                 }, "1234"); // example intCode
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
/// Updating and Accessing Data
// apiHandler.removeFlow("@register");
//
// apiHandler.addDataToFlow("@register", {
// "noOfEmployeesList": noOfEmployeesList,
// "noOfBranchesList": noOfBranchesList,
// "annualTurnOverList": annualTurnOverList,
// });


/// Option 1: Generalized Method for Handling Multiple Flows
// void setFlow(String flowKey, Map<String, dynamic> data, {String? intCode}) {
//   _apiIntegrationHandler[flowKey] = {
//     ..._apiIntegrationHandler[flowKey] ?? {},
//     ...data,
//     if (intCode != null) "intCode": intCode,
//   };
//   notifyListeners();
// }

/// Usage of Option 1
// Set the company flow
// apiHandler.setFlow('@register', {
// "name": model.nameController.text,
// "mobileNumber": "961${model.mobileController.text}",
// "companyName": model.companyNameController.text,
// "businessLocation": model.selectedBusinessLocation,
// // Add more fields as necessary
// }, intCode: "1234");
//
// // Set the login flow
// apiHandler.setFlow('@login', {
// "username": model.usernameController.text,
// "password": model.passwordController.text,
// });

// set this in view    final apiHandler = Provider.of<ApiIntegrationHandler>(context);

/// Option 2: Separate Methods for Critical Flows (Modular Approach)
// void setLoginFlow(String username, String password) {
//   _apiIntegrationHandler["@login"] = {
//     "username": username,
//     "password": password,
//   };
//   notifyListeners();
// }
//
// void setRegisterFlow(Map<String, dynamic> data) {
//   _apiIntegrationHandler["@register"] = {
//     ..._apiIntegrationHandler['@register'] ?? {},
//     ...data,
//   };
//   notifyListeners();
// }
//
/// Usage
// apiHandler.setLoginFlow("john", "password123");
// apiHandler.setRegisterFlow({"name": "John", "email": "john@example.com"});
