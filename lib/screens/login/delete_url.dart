// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_it/screens/homepage.dart';
import 'package:short_it/screens/login/loginpage.dart';

import '../../services/api_service.dart';
import '../../services/helper_dialog.dart';

// class DrawerItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   const DrawerItem({Key? key, required this.icon, required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15),
//       margin: EdgeInsets.only(bottom: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 3,
//             spreadRadius: 1,
//             color: Colors.grey.shade300,
//           ),
//         ],
//         // border: Border.all(),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: Color(0xFF8030D0),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF16163F),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class DeleteUrl extends StatefulWidget {
  final String id;
  const DeleteUrl({Key? key, required this.id}) : super(key: key);

  @override
  State<DeleteUrl> createState() => _DeleteUrlState();
}

class _DeleteUrlState extends State<DeleteUrl> {
  @override
  Widget build(BuildContext context) {
    deleteUrl(var token, var id) async {
      await ApiCalls().deleteUrl(token, id).then((value) {
        setState(() {
          Get.offAll(() => Homepage());
        });
      });
      
    }

    return GestureDetector(
      onTap: () async {
        debugPrint("Logout");
        DialogHelper.deletingUrl();
        await deleteUrl(tok, widget.id);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.grey.shade300,
            ),
          ],
          // border: Border.all(),
        ),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Color(0xFFC70505),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC70505),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
