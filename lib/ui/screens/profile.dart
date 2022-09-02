import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        children: [
          _buildStack(context),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            title: const Text(
              "Skills : ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children:  const [
                Chip(label: Text("Flutter"),),
                Chip(label: Text("Android Studio")),
                Chip(label: Text("Github")),
                Chip(label: Text("Java/Kotlin")),
                Chip(label: Text("PHP/Laravel")),
                Chip(label: Text("MVVM/MVC")),
                Chip(label: Text("Photoshop")),
                Chip(label: Text("SQL/NoSqli")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBackground(BuildContext context) {
    final _width = MediaQuery.of(context).size.width * 0.2;
    final _height = MediaQuery.of(context).size.height * 0.5;

    return Container(
      height: _height,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                "assets/images/profile.jpg",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken)),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(_width)),
          color: Colors.green),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Icon(Icons.upload_outlined,
                          color: Colors.deepOrange),
                    ))
              ],
            ),
            const Text("Abdelaziz Hanzaz.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22)),
            const Text("Mobile Developper",
                style: TextStyle(color: Colors.white)),
            const Text("Maroc, Safi", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        _buildHeaderBackground(context),
        Positioned(
            top: 40,
            left: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BackButton(
                  color: Colors.white,
                ),
                Text(
                  "Profile".toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            )),
        Positioned(
          bottom: 5,
          right: 0,
          left: 0,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => {},
            child: Icon(
              Icons.favorite_outline,
              color: Colors.grey.shade400,
            ),
          ),
        )
      ],
    );
  }
}
