import 'package:test_app_flutter/models/meme_data.dart';
import 'package:http/http.dart' as http;
class MemeApi{
  String url = "https://meme-api.com/gimme";
  Future<MemeData> generateMeme() async {
    final request = await http.get(Uri.parse(url));
    if (request.statusCode == 200) {
      MemeData memeData = memeDataFromJson(request.body);
      return memeData;
    }
    else{
      throw Exception('Failed to load meme');
    }
  }
}