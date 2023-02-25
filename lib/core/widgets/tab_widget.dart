import 'package:flutter/material.dart';
import '/features/text_detector/presentation/pages/text_positivity_page.dart';

class TabWidget extends StatelessWidget {

  final IconData icon;
  final String title;
  final bool selected;
  final int index;

  TabWidget({Key? key, required this.icon, required this.title, required this.selected, required this.index}) : super(key: key);

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
          (index == 0 && !selected)? Navigator.popAndPushNamed(context, TextPositivityPage.routeName)
        : (index == 1 && !selected)? Navigator.popAndPushNamed(context, TextPositivityPage.routeName)
        : (index == 2 && !selected)? Navigator.popAndPushNamed(context, TextPositivityPage.routeName)
        : (index == 3 && !selected)? Navigator.popAndPushNamed(context, TextPositivityPage.routeName)
        : null;
      },
      child: Container(
        
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color:selected ? Colors.purple.withOpacity(0.2) : Colors.transparent,
        ),
        child: Row(
          children: [          
            Icon(
              icon,color: selected? Colors.purple : Colors.grey[700],
              size: height/30,
            ),
             selected? Text(
               "  $title",
               style: const TextStyle(
                 color:Colors.purple,
                 fontSize: 16
               ),
             ) : Container()
          ],
        ),
      ),
    );
  }
}