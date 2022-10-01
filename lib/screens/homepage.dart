// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors,
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:short_it/models/shortenedModel/shortened.dart';
import 'package:short_it/screens/details_screen.dart';
import 'package:short_it/screens/login/loginpage.dart';
import 'package:short_it/services/api_service.dart';
import 'package:short_it/services/helper_dialog.dart';
import 'package:short_it/widgets/custombutton.dart';
import 'package:flutter/services.dart';

import '../models/AllUrl/all_url_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShortened = false;
  ShortenedModel? shortenedModel;
  AllUrlModel getUrlHistory = AllUrlModel(urls: []);
  late final Future? future;
  bool editable = false;

  shortenUrl() async {
    var shortIt = await ApiCalls().shortenUrl(urlController.text, tok);

    if (shortIt != null) {
      Get.back();
      setState(() {
        shortenedModel = shortIt;
      });
      return shortenedModel;
    }
  }

  //Url History
  getURL() async {
    var out = await ApiCalls().getAllUrl(tok);
    if (out != null) {
      setState(() {
        getUrlHistory = out;
      });
      return getUrlHistory;
    }
  }

  //WillPopScope
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await _showExitBottomSheet(context);
    return exitResult ?? false;
    // bool? exitResult = false;
    // return exitResult;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Do you really want to exit the app?',
          style: TextStyle(
            color: Color(0xFF8C319B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'CANCEL',
                style: TextStyle(color: Color(0xFF8C319B), fontSize: 16),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'YES, EXIT',
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  logginOut(var token) async {
    var out = await ApiCalls().signOut(tok);
    if (out != null) {
      Get.offAll(() => LoginPage());
      // print(out.toString());
      // Navigator.pushAndRemoveUntil<dynamic>(
      //   context,
      //   MaterialPageRoute<dynamic>(
      //     builder: (BuildContext context) => LoginPage(),
      //   ),
      //   (route) => false,
      // );
    }
  }

  ///
  @override
  void initState() {
    future = getURL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SHORT IT!",
            style: TextStyle(
              fontFamily: 'Valera',
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFAB35BF),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    debugPrint("Logout");
                    DialogHelper.showLoadingSignOut();
                    await logginOut(tok);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF6EFEF)),
                  ),
                ),
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: Text(
                    "Create click-worthy short links",
                    style: TextStyle(
                      color: Color(0xFF8C319B),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFAB35BF),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.insert_link_outlined,
                                    color: Color(0xFF8C319B),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        //Test 2
                                        // String hasValidUrl(String value) {
                                        //   String pattern =
                                        //       r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                                        //   RegExp regExp = new RegExp(pattern);
                                        //   if (value.length == 0) {
                                        //     return 'Please enter url';
                                        //   } else if (!regExp.hasMatch(value)) {
                                        //     return 'Please enter valid url';
                                        //   }
                                        //   return null;
                                        // }
                                        final Uri? uri = Uri.tryParse(value!);
                                        if (!uri!.hasAbsolutePath) {
                                          return 'Please enter valid url staring with "http"';
                                        }
                                        return null;
                                      },
                                      cursorHeight: 25,
                                      controller: urlController,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlignVertical: TextAlignVertical.top,
                                      // textAlign: TextAlign.justify,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(0),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title: "Clear",
                                    onTap: () {
                                      // print(getUrlHistory?.urls);
                                      setState(() {
                                        isShortened = false;
                                        urlController.clear();
                                        // print(tok);
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    title: "Shorten",
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        isShortened = false;
                                        DialogHelper.showShortening();
                                        await shortenUrl();

                                        setState(() {
                                          getURL();
                                          isShortened = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Result",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Icon(Icons.link),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                isShortened
                                    ? "${shortenedModel?.url.shortUrl}"
                                    : "",
                                style: TextStyle(fontSize: 17),
                              ),
                            ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: "Copy",
                              onTap: () {
                                if (isShortened != false) {
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
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Clipboard.setData(ClipboardData(
                                      text: "${shortenedModel?.url.shortUrl}"));
                                }

                                // DialogHelper.clipboardCopy();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomButton(
                              title: "Save",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 18),
                      child: Divider(
                        color: Colors.grey,
                        height: 0,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      "Recently added URLs",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF390443),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.3,
                      child: FutureBuilder<dynamic>(
                        future: future,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<Widget> children;
                          if (snapshot.hasData) {
                            return ListView.builder(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              // reverse: true,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: getUrlHistory.urls.length,
                              itemBuilder: (BuildContext context, int index) {
                                var actualUrl = getUrlHistory
                                    .urls[index].fullUrl
                                    .toString();
                                var shortUrl = getUrlHistory
                                    .urls[index].shortUrl
                                    .toString();
                                var date = DateFormat("dd-MM-yyy").format(
                                  getUrlHistory.urls[index].createdAt,
                                );
                                var id =
                                    getUrlHistory.urls[index].id.toString();
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        DetailsScreen(
                                            actualUrl: actualUrl,
                                            shortUrl: shortUrl,
                                            date: date,
                                            id: id),
                                        transition: Transition.zoom);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return DetailsScreen(
                                    //         actualUrl: actualUrl,
                                    //         shortUrl: shortUrl,
                                    //         date: date,
                                    //         id: id,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    height: 70,
                                    padding: EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(top: 14),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat("dd-MM-yyy").format(
                                            getUrlHistory.urls[index].createdAt,
                                          ),
                                          style: TextStyle(
                                            color: Color(0xFFAB35BF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 7,
                                        // ),
                                        Expanded(child: Container()),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              getUrlHistory
                                                  .urls[index].shortUrl,
                                              style: TextStyle(
                                                color: Color(0xFF8C319B),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Color(0xFFAB35BF),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            children = <Widget>[
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text('Error: ${snapshot.error}'),
                              ),
                            ];
                          } else {
                            children = const <Widget>[
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Loading history...'),
                              ),
                            ];
                          }
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: children,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
