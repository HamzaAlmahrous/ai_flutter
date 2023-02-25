import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/core/util/themes.dart';
import '/features/ai_news/presentation/pages/ai_news_page.dart';
import '/features/image_detector/presentation/pages/image_classifier_page.dart';
import '/features/realtime_object_detection/presentation/pages/realtime_object_detection_page.dart';
import '/features/text_detector/presentation/pages/text_positivity_page.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomePage';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late double height;
  int selectedIndex = 0;
  late double width;
  Widget body = AINewsPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.07,
                  child: AppBar(
                    centerTitle: true,
                    title: const Text("AI APP"),
                    backgroundColor: aiDarkPurple.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 0.85 * height,
                  child: body,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: width,
                  height: height * 0.08,
                  color: aiDarkPurple,
                  child: GNav(
                      onTabChange: (index) {
                        setState(() {
                          body = (index == 0 && selectedIndex != index)
                              ? AINewsPage()
                              : (index == 1 && selectedIndex != index)
                                  ? TextPositivityPage()
                                  : (index == 2 && selectedIndex != index)
                                      ? ImageClassifierPage()
                                      : (index == 3 && selectedIndex != index)
                                          ? const RealTimeObjectDetectionPage()
                                          : Container();
                          selectedIndex = index;
                        });
                      },
                      backgroundColor: aiDarkPurple,
                      rippleColor:
                          aiDarkGrey, // tab button ripple color when pressed
                      hoverColor: aiGrey, // tab button hover color
                      haptic: false, // haptic feedback
                      curve: Curves
                          .easeInOutQuart, // tab animation curves                      gap: 8, // the tab button gap between icon and text
                      color: aiDarkGrey, // unselected icon color
                      activeColor: aiPurple, // selected icon and text color
                      iconSize: 24, // tab button icon size
                      tabBackgroundColor: aiPurple
                          .withOpacity(0.1), // selected tab background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5), // navigation bar padding
                      tabs: const [
                        GButton(
                          icon: Icons.home_rounded,
                          text: '  Home',
                        ),
                        GButton(
                          icon: Icons.text_fields_outlined,
                          text: '  Text',
                        ),
                        GButton(
                          icon: Icons.image_search_outlined,
                          text: '  Image',
                        ),
                        GButton(
                          icon: Icons.video_camera_back_rounded,
                          text: '  Object',
                        )
                      ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
