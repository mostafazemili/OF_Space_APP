import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/widgets/on_boarding_content.dart';
import 'package:qatar_ui_app/widgets/on_boarding_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPageIndex == 2,
                replacement: TextButton(

                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInCirc,
                      );
                    },
                    child: Text(
                      'SKIP',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Color(0xFFFFBD34),
                      ),
                    )),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register_screen');
                    },
                    child: Text(
                      'START',
                      style: GoogleFonts.nunito(
                        color: Color(0xFFFFBD34),
                        fontSize: 16,
                      ),
                    ),),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _currentPageIndex = pageIndex;
                  });
                },
                children: const [
                  OnBoardingContent(
                      image: 'image_1',
                      title: 'WellCome!',
                      subTitle:
                          'The Best way to explore an off-beat location'),
                  OnBoardingContent(
                    image: 'image_2',
                    title: 'Add to Cart',
                    subTitle:
                        'Find a home or space from our Platform.',
                  ),
                  OnBoardingContent(
                    image: 'image_3',
                    title: 'Enjoy Purchase!',
                    subTitle:
                        'Find a home or space from our Platform.',
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBoardingIndicator(
                  isSlected: _currentPageIndex == 0,
                  marginEnd: 14,
                ),
                OnBoardingIndicator(
                  isSlected: _currentPageIndex == 1,
                  marginEnd: 14,
                ),
                OnBoardingIndicator(isSlected: _currentPageIndex == 2)
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(backgroundColor: _currentPageIndex == 0 ? Colors.blue : Colors.grey.shade200,
            //         borderColor: Colors.amber, size: 10),
            //     TabPageSelectorIndicator(backgroundColor: _currentPageIndex == 1 ? Colors.blue : Colors.grey.shade200,
            //         borderColor: Colors.amber, size: 10),
            //     TabPageSelectorIndicator(backgroundColor: _currentPageIndex == 2 ? Colors.blue : Colors.grey.shade200,
            //         borderColor: Colors.amber, size: 10),
            //   ],
            // )
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  visible: _currentPageIndex != 0,
                  child: IconButton(
                      onPressed: () {
                        if (_currentPageIndex != 0)
                          _pageController.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOutBack);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPageIndex != 2)
                      _pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOutBack);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: _currentPageIndex == 2 ? Colors.grey : Colors.black,
                ),
              ],
            ),
            Visibility(
              visible: _currentPageIndex ==2 ,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFBD34),
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.5),
                    )
                  ),
                    onPressed: () => Navigator.pushReplacementNamed(context, '/register_screen'),
                    child: Text(
                      'START',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
