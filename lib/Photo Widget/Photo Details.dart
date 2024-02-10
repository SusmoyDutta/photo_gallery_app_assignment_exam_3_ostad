import 'package:flutter/material.dart';
import 'package:photo_gallery_app_assignment_exam_3_ostad/Photo%20Widget/PhotoGallery.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({Key? key, required this.indexPhoto}) : super(key: key);
  final int indexPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  photoList[indexPhoto].url ?? 'Unknown',
                  width: 300,
                  height: 300,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Title: ${photoList[indexPhoto].title ?? 'Unknown'}',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'ID: ${photoList[indexPhoto].id ?? 'Unknown'}',
            ),
            const SizedBox(height: 95),
          ],
        ));
  }
}
