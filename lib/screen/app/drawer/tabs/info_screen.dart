import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/screen/app/drawer/tabs/first_tab_screen.dart';
import 'package:qatar_ui_app/screen/app/drawer/tabs/second_tab_screen.dart';

class InfoScreen extends StatefulWidget  {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}


class _InfoScreenState extends State<InfoScreen> with SingleTickerProviderStateMixin{

  late  TabController _tabController ;

  @override
  void initState(){
      super.initState();
  _tabController = TabController(length: 2, vsync: this);
}
  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'
            ,style: GoogleFonts.aBeeZee(
            color: Colors.black
        ),
      ),
        iconTheme: IconThemeData(
          color: Color(0xFF000000)
        ),
        backgroundColor: Color(0xFFF0DE36),
        elevation: 0,
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          //**********************************
          indicatorColor: Color(0xFF0D1282),
          dividerColor: Color(0xFF0D1282),
          indicatorWeight: 4,
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xFF0D1282),
          unselectedLabelColor: Colors.black87,
          labelStyle: GoogleFonts.nunito(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: GoogleFonts.nunito(
            letterSpacing: 0,
            fontSize: 14,
          ),
          onTap: (int tabIndex){
            print('TabIndext : $tabIndex');
          },
          //**********************************
          tabs: [
            Tab(text: 'other people',),
            Tab(text: 'Archives',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FirstTabScreen(),
          SecondTabScreen(),
        ],
      ),
    );
  }
}
