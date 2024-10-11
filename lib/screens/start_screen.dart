import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../helper/app_image_picker.dart';
import '../providers/app_image_provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  late AppImageProvider imageProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/space.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Photo Editor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          wordSpacing: 10,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  AppImagePicker(source: ImageSource.gallery)
                                      .pick(onPick: (File? image){
                                    if (image != null) {
                                      imageProvider.changeImageFile(image);
                                      Navigator.of(context).pushReplacementNamed('/home');
                                    }
                                  });
                                },
                                child: const Text('Gallery')
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  AppImagePicker(source: ImageSource.camera)
                                      .pick(onPick: (File? image){
                                    if (image != null) {
                                      imageProvider.changeImageFile(image);
                                      Navigator.of(context).pushReplacementNamed('/home');
                                    }
                                  });
                                },
                                child: const Text('Camera')
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
