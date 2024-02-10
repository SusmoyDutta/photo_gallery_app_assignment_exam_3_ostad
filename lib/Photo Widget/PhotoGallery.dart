import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_gallery_app_assignment_exam_3_ostad/Model%20Class/Class_photo_gallery.dart';
import 'package:photo_gallery_app_assignment_exam_3_ostad/Photo%20Widget/Photo%20Details.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}
List<PhotoGalley> photoList = [];
bool _getInParse = false;

class _PhotoGalleryState extends State<PhotoGallery> {
  final controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    getPhotoGalleryFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Photo Gallery App',
        ),
      ),
      body: Visibility(
        visible: _getInParse == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            var photo=photoList[index];
            return Card(
              shadowColor: Colors.grey.shade200,
              child: ListTile(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PhotoDetails(indexPhoto:index),
                      ),
                    );
                  });
                },
                leading: Image.network(
                  photo.thumbnailUrl ?? 'Un',
                  width: 50,
                  height: 50,
                ),
                title: Text(photo.title??'Un'),
                // title: Text(photoList[index].title ?? 'Un'),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getPhotoGalleryFromApi() async {
    _getInParse = true;
    setState(() {});
    try{
      Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      Response response = await get(uri);
      if (response.statusCode == 200) {
        var decodePhoto = jsonDecode(response.body);
        for (var item in decodePhoto) {
          PhotoGalley photoGalley = PhotoGalley.fromJson(item);
          photoList.add(photoGalley);
        }
      }
    }catch(_){
      _getInParse = false;

    }
    _getInParse = false;
    setState(() {});
  //   Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  //   Response response = await get(uri);
  //   if (response.statusCode == 200) {
  //     var decodePhoto = jsonDecode(response.body);
  //     for (var item in decodePhoto) {
  //       PhotoGalley photoGalley = PhotoGalley.fromJson(item);
  //       photoList.add(photoGalley);
  //     }
  //   }
  //   _getInParse = false;
  //   setState(() {});
  // }

}
}
