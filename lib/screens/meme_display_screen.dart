import 'package:flutter/material.dart';
import 'package:test_app_flutter/models/meme_data.dart';
import 'package:test_app_flutter/services/meme_api.dart';

class MemeDisplayScreen extends StatefulWidget {
  const MemeDisplayScreen({super.key});

  @override
  State<MemeDisplayScreen> createState() => _MemeDisplayScreenState();
}

class _MemeDisplayScreenState extends State<MemeDisplayScreen> {

  String imageUrl = "";
  Widget loadingWidget = const Text(
      "Press on the button to have a new new meme!!!");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageUrl.isEmpty ? loadingWidget : Image.network(imageUrl),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onLongPress: () {
          getANewMeme(context);
          loadingWidget = const CircularProgressIndicator();
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            "Generate new meme",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  void getANewMeme(BuildContext context) async {
    try {
      MemeData memeData = await MemeApi().generateMeme();
      if (memeData.runtimeType == MemeData) {
        imageUrl = memeData.url;
        setState(() {});
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Something went wrong")));
      }
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
    }
  }
}
