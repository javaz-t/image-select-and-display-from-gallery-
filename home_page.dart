import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.redAccent,
              child: _selectedImage != null
                  ? Image.file(
                _selectedImage!,
                height: 400,
                width: 400,
              )
                  : const Text('Add Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() {
                    _selectedImage = File(image.path);
                  });
                }
              },
              child: Text("Select Image"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the logic to upload the selected image
                // You can use _selectedImage.path to get the file path
              },
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }
}
