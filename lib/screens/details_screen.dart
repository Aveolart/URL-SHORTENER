// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:short_it/screens/login/delete_url.dart';
import 'package:short_it/widgets/logos.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  // final AllUrlModel urlDetails;
  String actualUrl;
  String shortUrl;
  String date;
  String id;
  DetailsScreen({
    required this.actualUrl,
    required this.shortUrl,
    required this.date,
    required this.id,
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0xFFAB35BF),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF8C319B),
                ),
              ),
            ),
            Text(
              "Actual URL",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF8C319B),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFAB35BF),
              ),
              child: Text(
                widget.actualUrl,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Shortened URL",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF8C319B),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 60,
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFAB35BF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.shortUrl,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: widget.shortUrl));
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFAB35BF),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20),
                        duration: Duration(seconds: 1),
                        content: Text(
                          'Copied',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFF8C319B),
                          borderRadius: BorderRadius.circular(5)),
                      height: 60,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Copy",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final uri = Uri.parse(widget.shortUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $uri';
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 25, bottom: 25),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFAB35BF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Open in browser",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.open_in_new, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Share via",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Share.share(widget.shortUrl);
                    },
                    child: ShareIcons(icon: "assets/logo-gmail-9953.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(widget.shortUrl);
                    },
                    child: ShareIcons(icon: "assets/whatsapp-png-23836.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(widget.shortUrl);
                    },
                    child:
                        ShareIcons(icon: "assets/facebook-logo-png-6371.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(widget.shortUrl);
                    },
                    child:
                        ShareIcons(icon: "assets/logo-instagram-png-13550.png"),
                  ),
                  GestureDetector(
                      onTap: () {
                        Share.share(widget.shortUrl);
                      },
                      child: ShareIcons(icon: "assets/twitter-png-5969.png")),
                ],
              ),
            ),
            DeleteUrl(
              id: widget.id,
            )
          ],
        ),
      ),
    );
  }
}
