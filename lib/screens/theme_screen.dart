import 'package:flutter/material.dart';

import '../theme/theme_manager.dart';


ThemeManager _themeManager = ThemeManager();
class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }
  themeListener(){
    if(mounted){
      setState(() {});
    }
  }
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme App"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).canvasColor),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Dinh Van My"),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Arthropleura là động vật một chi chân đốt cuốn chiếu khổng lồ (dài hơn 2,5 m) đã tuyệt chủng, sống ở khu vực ngày nay là Châu Âu, Trung Á và Bắc Mỹ trong thời kỳ cuối Đại Cổ sinh (Carboniferous-Permi). Đây là mô hình kích thước thật bằng nhựa polyurethane do tôi và các cộng tác viên của tôi ở Đại học Cagliari, Ý, thực hiện."),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){}, child: const Text("Button 1")),
                ElevatedButton(onPressed: (){}, child: const Text("Button 1")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: _themeManager.themeData == ThemeMode.dark,
                    onChanged: (value){
                      _themeManager.toggleTheme(value);
                      setState(() {});
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
