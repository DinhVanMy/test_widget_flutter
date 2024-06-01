import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AnimatedSidebarMenuScreen extends StatefulWidget {
  const AnimatedSidebarMenuScreen({super.key});

  @override
  State<AnimatedSidebarMenuScreen> createState() => _AnimatedSidebarMenuScreenState();
}

class _AnimatedSidebarMenuScreenState extends State<AnimatedSidebarMenuScreen> {
  final _drawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey,Colors.blueGrey.withOpacity(0.2)]
          )
        ),
      ),
      controller: _drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ]
      ),

      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(top: 20,bottom: 60),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle
                ),
                child: const FlutterLogo(),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.home),
                title: const Text("Home"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.search),
                title: const Text("Search"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.help),
                title: const Text("Help"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white54
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text("Privacy Policy"),
                ),
              )
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text("Slide Drawer",style: TextStyle(color: Colors.white),),
          leading: IconButton(
            color: Colors.white,
            onPressed: _handleMenuButton ,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _drawerController,
              builder: (_,value,__){
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButton() {
    _drawerController.showDrawer();
  }
}
