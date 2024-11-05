import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class FilePickerProvider extends ChangeNotifier {
  String? _selectedFilePath;

  String? get selectedFilePath => _selectedFilePath;

  // Function to pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _selectedFilePath = result.files.single.path;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}



class FilePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker with Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<FilePickerProvider>(
              builder: (context, filePickerProvider, child) {
                return ElevatedButton(
                  onPressed: () {
                    filePickerProvider.pickFile();
                  },
                  child: Text('Pick a File'),
                );
              },
            ),
            SizedBox(height: 20),
            Consumer<FilePickerProvider>(
              builder: (context, filePickerProvider, child) {
                return filePickerProvider.selectedFilePath != null
                    ? Text(
                  'Selected File: ${filePickerProvider.selectedFilePath}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
                    : Text(
                  'No file selected',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'file_picker_provider.dart'; // Import your provider
//
// class AnotherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Another Screen with File Picker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Consumer<FilePickerProvider>(
//               builder: (context, filePickerProvider, child) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     filePickerProvider.pickFile();
//                   },
//                   child: Text('Pick a File on Another Screen'),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Consumer<FilePickerProvider>(
//               builder: (context, filePickerProvider, child) {
//                 return filePickerProvider.selectedFilePath != null
//                     ? Text(
//                   'Selected File: ${filePickerProvider.selectedFilePath}',
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 )
//                     : Text(
//                   'No file selected',
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
