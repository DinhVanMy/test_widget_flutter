import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableScreen extends StatefulWidget {
  const SlidableScreen({super.key});

  @override
  State<SlidableScreen> createState() => _SlidableScreenState();
}

class _SlidableScreenState extends State<SlidableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: AppBar(
              title: const Text("Slidable Screen"),
              backgroundColor: Colors.blue,
              centerTitle: true,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {},
                ),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: "Delete",
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: "Share",
                  )
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {},
                ),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: "Delete",
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: "Share",
                  )
                ],
              ),
              child: ListTile(
                title: const Text("Slide me"),
                tileColor: Colors.grey.shade400,
              ))
        ],
      ),
    );
  }
}
