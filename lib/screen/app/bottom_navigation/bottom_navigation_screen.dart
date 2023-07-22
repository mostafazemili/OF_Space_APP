import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/models/bn_screen.dart';
import 'package:qatar_ui_app/screen/app/bottom_navigation/categories_screen.dart';
import 'package:qatar_ui_app/screen/app/bottom_navigation/home_screen.dart';
import 'package:qatar_ui_app/screen/app/bottom_navigation/settings_screen.dart';
import 'package:qatar_ui_app/screen/app/bottom_navigation/users_screen.dart';



class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<BnScreen> _bnScreen = <BnScreen>[
    const BnScreen(widget: HomeScreen(), title: 'Home'),
    const BnScreen(widget: UsersScreen(), title: 'Chat us'),
    const BnScreen(widget: CategoriesScreen(), title: 'Categories'),
    const BnScreen(widget: SettingsScreen(), title: 'Setttings'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bnScreen[_currentIndex].title,
        style: GoogleFonts.aBeeZee(
           color: Colors.black,
        ),
        ),
        backgroundColor: Color(0xFFF0DE36),
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 50.0, // Set the radius of the circle
                backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/700/700674.png'), // Provide the image URL
              ),
              accountName: Text('Mustafa',style: GoogleFonts.aBeeZee(
                color: Colors.black
              ),
              ),
              accountEmail: Text('Mustafa@gmail.com',style: GoogleFonts.aBeeZee(
                  color: Colors.black
              ),),
              // currentAccountsPicturesSize: Size(80,80),
              // otherAccountsPicturesSize: Size(30,30),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Color(0xFFF0DE36),
                    Color(0xFFFBEEAC),
                  ]
                )
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  radius: 50.0, // Set the radius of the circle
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBmCMAdDMUMWg11cGTvr-GOq72-Qi49JgZfUA2cffElOTKYZi3RVxUFJ_tzzzbk8F6_z8&usqp=CAU'), // Provide the image URL
                ),
                CircleAvatar(
                  radius: 50.0, // Set the radius of the circle
                  backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/015/409/989/small/elegant-man-in-business-suit-with-badge-man-business-avatar-profile-picture-illustration-isolated-vector.jpg'), // Provide the image URL

                ),
                CircleAvatar(
                  radius: 50.0, // Set the radius of the circle
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/700/700674.png'), // Provide the image URL

                ),
              ],
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500 ), (){
                  Navigator.pushNamed(context, '/info_screen');
                });
              },
              leading: Icon(Icons.info),
              title: Text('Info'),
              subtitle: Text('know more'),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            Divider(
              thickness: 1,
              indent: 28,
              color: Colors.grey.shade200,
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500 ), (){
                  Navigator.pushNamed(context, '/faqs_screen');
                });
              },
              leading: Icon(Icons.question_answer),
              title: Text('FAQs'),
              subtitle: Text('Frequrntly Questions'),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            Divider(
              thickness: 1,
              indent: 28,
              color: Colors.grey.shade200,
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Return to Login'),
            ),
          ],
        ),
      ),
      body: _bnScreen[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int currentIndex) {
          setState(() => _currentIndex = currentIndex);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //***********************
        // fixedColor: Colors.black45,
        selectedItemColor: Color(0xFF484362),
        selectedIconTheme: IconThemeData(color: Color(0xFFFFC243)),
        //***********************
        // iconSize: 30,
        unselectedFontSize: 12,
        selectedFontSize: 14,
        elevation: 8,

        //***********************
        unselectedItemColor: Color(0xFF484362),
        unselectedIconTheme: IconThemeData(color: Colors.black87),
        unselectedLabelStyle: GoogleFonts.aboreto(),
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat),
              label: 'Chat us'),
          BottomNavigationBarItem(
              backgroundColor: Colors.purpleAccent,
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Settings'),
        ],
      ),
    );
  }
}
