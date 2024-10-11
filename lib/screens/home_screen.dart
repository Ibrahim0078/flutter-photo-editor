import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_image_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Photo Editor'),
        leading: CloseButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text('Save'),
          ),
        ],
      ),
      body: Center(
          child: Consumer<AppImageProvider>(
              builder: (BuildContext context, value, Widget? child){
                if(value.currentImage != null){
                  return Image.memory(
                    value.currentImage!,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
          )
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.black,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _bottomBatItem(
                  Icons.crop_rotate,
                  'Crop',
                  onPress: (){
                    Navigator.of(context).pushNamed('/crop');
                  },
                ),
                _bottomBatItem(
                  Icons.filter,
                  'Filters',
                  onPress: (){
                    Navigator.of(context).pushNamed('/filter');
                  },
                ),
                _bottomBatItem(
                  Icons.tune,
                  'Adjust',
                  onPress: (){
                    Navigator.of(context).pushNamed('/adjust');
                  },
                ),
                _bottomBatItem(
                  Icons.emoji_emotions_outlined,
                  'Sticker',
                  onPress: (){
                    Navigator.of(context).pushNamed('/sticker');
                  },
                ),
                _bottomBatItem(
                  Icons.text_fields,
                  'Text',
                  onPress: (){
                    Navigator.of(context).pushNamed('/text');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBatItem(IconData icon, String title, {required onPress}){
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon , color: Colors.white,),
            const SizedBox(height: 3,),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
