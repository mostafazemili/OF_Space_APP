import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      // shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text('Mostsfa'),
          subtitle: Text('Flutter mobile developer'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text('jalal'),
          subtitle: Text('Android mobile developer'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text('jamal'),
          subtitle: Text('Flutter architect'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text('Ali'),
          subtitle: Text('Flutter quality engineer'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text('Eng.Doaa'),
          subtitle: Text('iOS support engineer'),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
      ],
    );
  }
}