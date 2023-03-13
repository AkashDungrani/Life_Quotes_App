import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool active1 = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.amber,
              child: const Text(
                textAlign: TextAlign.center,
                "Life Quotes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 29,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.topic_outlined,
                      color: Colors.green,
                    ),
                    title: const Text("By Topic"),
                    onTap: () {
                      // Navigator.of(context).pushNamed('sport');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: const Text("By Author"),
                    onTap: () {
                      Navigator.of(context).pushNamed('business');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: const Text("Favourites"),
                    onTap: () {
                      Navigator.of(context).pushNamed('entertainment');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.lightbulb,
                      color: Colors.yellowAccent,
                    ),
                    title: const Text("Quote of the day"),
                    onTap: () {
                      Navigator.of(context).pushNamed('health');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: const Text("Favourites Pictures"),
                    onTap: () {
                      Navigator.of(context).pushNamed('science');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.video_library,
                      color: Colors.red,
                    ),
                    title: const Text("Videos"),
                    onTap: () {
                      Navigator.of(context).pushNamed('technology');
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.01,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Communicate"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    title: Text("Settings"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Colors.grey,
                    ),
                    title: Text("Share"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.grey,
                    ),
                    title: Text("Rate"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    title: Text("Feedback"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.zoom_in,
                      color: Colors.grey,
                    ),
                    title: Text("Our other apps"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                    title: Text("About"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
