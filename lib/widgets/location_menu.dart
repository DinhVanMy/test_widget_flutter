import 'package:flutter/material.dart';

class LocationMenu extends StatefulWidget {
  final List<String> menuItems;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const LocationMenu(
      {super.key,
      required this.menuItems,
      required this.selectedIndex,
      required this.onItemTapped});

  @override
  State<LocationMenu> createState() => _LocationMenuState();
}

class _LocationMenuState extends State<LocationMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < widget.menuItems.length; i++)
            buildMenuItem(widget.menuItems[i], widget.selectedIndex == i, i)
        ],
      ),
    );
  }

  buildMenuItem(String menuItem, bool selectionState, int i) {
    return GestureDetector(
      onTap: () {
        widget.onItemTapped(i);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color:
                selectionState ? Colors.white : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          menuItem,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
