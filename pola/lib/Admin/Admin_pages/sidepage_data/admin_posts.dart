import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

class AdminPosts extends StatefulWidget {
  const AdminPosts({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminPostsState createState() => _AdminPostsState();
}

class _AdminPostsState extends State<AdminPosts> {

  final logger = Logger();

  final textController = TextEditingController();
  late String username = '';
  File? _selectedImage;

 /* @override
  void initState() {
    super.initState();
    getCurrentUsername();
  }*/

  /*Future<void> getCurrentUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();
        final userData = userDoc.data();

        if (userData != null) {
          setState(() {
            username = userData['username'] ?? 'Unknown User';
          });
        }
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }*/

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  Future<void> _savePost() async {
    if (_selectedImage == null || textController.text.isEmpty) {
      logger.i('Image or Text is Empty');
      return;
    }

    try {
      // Upload the image to Firebase storage
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
      UploadTask uploadTask = storageReference.putFile(_selectedImage!);
      TaskSnapshot storageTaskSnapshot = await uploadTask;

      // Get the URL of the uploaded image
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Store the caption, image URL, and username in Cloud Firestore
      await FirebaseFirestore.instance.collection('posts').add({
        'caption': textController.text,
        'imageUrl': imageUrl,
        'TimeStamp': Timestamp.now(),
      });

      // Clear the text field and selected image
      setState(() {
        textController.clear();
        _selectedImage = null;
      });
      logger.d('Post Saved Successfully');

    } catch (e) {
      logger.e('Error Saving Posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _savePost, icon: const Icon(Icons.send_outlined))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textController,
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText: "Write Posts...",
                              hintStyle: TextStyle(fontSize: 25),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // image picker
                    Center(
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!)
                          : const Text('')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _pickImageFromGallery,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.photo_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
