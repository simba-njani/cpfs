import 'package:cpfs/screens/home_page.dart';
import 'package:flutter/material.dart';

// // Helper function to show a message dialog
// void showMessage(BuildContext context, String message, String status) {
//   // Safeguard to ensure context is still valid and mounted
//   if (!context.mounted) {
//     print('Context is no longer valid or the widget is not mounted');
//     return;
//   }

//   // Check if there's an existing dialog and close it before showing a new one
//   if (Navigator.of(context).canPop()) {
//     Navigator.of(context).pop();
//   }

//   // Show the dialog with the current context
//   showDialog(
//     context: context,
//     barrierDismissible: false, // Prevent the dialog from being dismissed by tapping outside
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(status),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               // If the status is 'Success', navigate to the Home page and clear the stack
//               if (status == 'Success') {
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                   (Route<dynamic> route) => false,
//                 );
//               } else {
//                 Navigator.of(context).pop(); // Close the dialog
//               }
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

void showMessage(BuildContext context, String message, String status) {
  if (context.mounted) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(status),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (status == 'Success') {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  } else {
    
    print('Context is no longer mounted.');
  }
}
