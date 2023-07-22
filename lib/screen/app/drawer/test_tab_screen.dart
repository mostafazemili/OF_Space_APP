import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/screen/app/drawer/tabs/first_tab_screen.dart';
import 'package:qatar_ui_app/screen/app/drawer/tabs/second_tab_screen.dart';

class TestTabScreen extends StatefulWidget {
  const TestTabScreen({Key? key}) : super(key: key);

  @override
  State<TestTabScreen> createState() => _TestTabScreenState();
}

class _TestTabScreenState extends State<TestTabScreen>  with SingleTickerProviderStateMixin {

  late TabController _tabController ;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2 , vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          CircleAvatar(radius: 50),
          Text('Title',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text( 'SubTitle',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          ),
          Divider(
            thickness: 1,
            height: 40,
          ),
          TabBar(
            controller: _tabController,
            onTap: (int tabIndex){
              setState(() => _tabController.index = tabIndex );
            },
            labelColor:  Colors.black,
            tabs: [
              Tab(text: 'First'),
              Tab(text: 'Second'),
          ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index == 0 ,
                  child: FirstTabScreen()
              ),
              Visibility(
                  visible: _tabController.index == 1 ,
                  child: SecondTabScreen()
              ),
          ],),
          // TabBarView(
          //   controller: _tabController,
          //   children: [
          //   FirstTabScreen(),
          //   SecondTabScreen(),
          // ],),
        ],
      ),
    );
  }


}
