import 'package:flutter/material.dart';

class SecondTabScreen extends StatefulWidget {
  const SecondTabScreen({Key? key}) : super(key: key);

  @override
  State<SecondTabScreen> createState() => _SecondTabScreenState();
}

class _SecondTabScreenState extends State<SecondTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            Widget widget;
            switch (index) {
              case 0:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                        height: 100,
                        width: 100,
                          'images/OnBoardingScreen 3.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
                break;
              case 1:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                    Image.asset(
                        height: 100,
                        width: 100,
                        'images/OnBoardingScreen 2.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
                break;
              case 2:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                    Image.asset(
                        height: 100,
                        width: 100,
                        'images/OnBoardingScreen 1.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
                break;
              case 3:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                    Image.asset(
                        height: 100,
                        width: 100,
                        'images/OnBoardingScreen 3.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
                break;
              case 4:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                    Image.asset(
                        height: 100,
                        width: 100,
                        'images/OnBoardingScreen 2.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
                break;
              default:
                widget = Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                    Image.asset(
                        height: 100,
                        width: 100,
                        'images/OnBoardingScreen 1.png'),
                      Text('previous orders'),
                    ],
                  ),
                );
            }
            return widget;
          },
        ),
    );
    // return GridView.builder(
    //     itemCount: 15 ,
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true ,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 10,
    //     crossAxisSpacing: 10,
    //   ),
    //   itemBuilder: (context,indext){
    //     return Card(
    //       elevation: 4,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     );
    //   },
    // );
  }
}

