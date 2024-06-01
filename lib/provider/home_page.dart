import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'examples/theme/theme_changer.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Re Build Ui ");
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            const Icon(
              Icons.heart_broken_rounded,
              size: 60,
              color: Colors.deepPurple,
            ),
            const Text(
              "Provider Example",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.to(CounterPage());
              },
              splashColor: Colors.deepPurple.shade400,
              tileColor: Colors.white,
              leading: const Icon(Icons.numbers),
              title: const Text("Counter"),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.to(SliderPage());
              },
              splashColor: Colors.deepPurple.shade400,
              tileColor: Colors.white,
              leading: const Icon(Icons.rectangle),
              title: const Text("Slider"),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.to(TodoPage());
              },
              splashColor: Colors.deepPurple.shade400,
              tileColor: Colors.white,
              leading: const Icon(Icons.check_box),
              title: const Text("Todo"),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.to(ChangeThemePage());
              },
              splashColor: Colors.deepPurple.shade400,
              tileColor: Colors.white,
              leading: const Icon(Icons.dark_mode),
              title: const Text("Change Theme"),
            ),
          ],
        ),
      ),
    );
  }
}