import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliding Bottom Sheet',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.black,
              title: Text('Snapping Model Sheet',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
            )),
        body: Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: showSheet,
                child: Text('Open Style Sheet'))),
      );

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
          avoidStatusBar: true,
          cornerRadius: 30,
          builder: buildSheet,
          snapSpec: SnapSpec(
              initialSnap: 0.4, snap: true, snappings: [0.4, 0.7, 1.0]),
          headerBuilder: buildHeader));

  Widget buildSheet(context, state) => Material(
        child: ListView(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.all(20),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: StadiumBorder(),
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
            SizedBox(height: 20),
            Text(
              'This is a sheet. There are two kinds of bottom sheets in material design: Persistent. A persistent bottom sheet shows information that supplements the primary content of the app. A persistent bottom sheet remains visible even when the user interacts with other parts of the app. Persistent bottom sheets can be created and displayed with the ScaffoldState.showBottomSheet function or by specifying the Scaffold.bottomSheet constructor parameter. Modal. A modal bottom sheet is an alternative to a menu or a dialog and prevents the user from interacting with the rest of the app. Modal bottom sheets can be created and displayed with the showModalBottomSheet function.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );

  Widget buildHeader(BuildContext context, SheetState state) => Material(
        child: Container(
          color: Colors.blue,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                  width: 32,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 20),
          ]),
        ),
      );
}
