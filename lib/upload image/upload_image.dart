// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
//
// class UploadImage extends StatefulWidget {
//   const UploadImage({Key? key}) : super(key: key);
//
//   @override
//   _UploadImageState createState() => _UploadImageState();
// }
//
// class _UploadImageState extends State<UploadImage> {
//
//   File? _image;
//
//   Future getImageGallery() async {
//     var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       _image = imageFile;
//     });
//   }
//
//   Future getImageCamera() async {
//     var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       _image = imageFile;
//     });
//   }
//
//   Future upload(File imageFile) async {
//     var steam = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     var length = await imageFile.length();
//     var uri = Uri.parse('');
//
//     var request = new http.MultipartRequest("POST", uri);
//
//     var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));
//
//     request.files.add(multipartFile);
//
//     var response = await request.send();
//
//     if(response.statusCode == 200) {
//       print('Image Uploaded');
//     }
//     else {
//       print('Upload Failed');
//     }
//   }
//
//   Future getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final List<XFile>? imagePicked = await _picker.pickMultiImage();
//     final File imagePicked = await _picker.pickImage(source: ImageSource.camera);
//     image = File(imagePicked.path);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image', style: GoogleFonts.actor()),
//       ),
//       body: Column(
//         children: <Widget> [
//         Center(
//           child: _image == null
//               ? new Text('No Image Selected!')
//               : new Image.file(_image!),
//         ),
//           Row(
//             children: <Widget> [
//               RaisedButton(
//                 child: Icon(Icons.image_rounded),
//                   onPressed: getImageGallery,
//               ),
//               RaisedButton(
//                 child: Icon(Icons.camera_alt_rounded),
//                 onPressed: getImageCamera,
//               ),
//             ],
//           )
//
//       ],
//       ),
//     );
//   }
// }
