import 'package:flutter/material.dart';
import 'package:photo_gallery_app_assignment_exam_3_ostad/Photo%20Widget/PhotoGallery.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          subtitle2: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: 'Photo Gallery',
      home: const PhotoGallery(),
    );
  }
}
