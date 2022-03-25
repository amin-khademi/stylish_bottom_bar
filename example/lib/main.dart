import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Bottm Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected;

  var bgColor;
  var heart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent
      bottomNavigationBar: StylishBottomBar(
        items: [
          AnimatedBarItems(
              icon: Icon(
                Icons.house_outlined,
              ),
              selectedIcon: Icon(Icons.house_rounded),
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.amber,
              title: Text('Home')),
          AnimatedBarItems(
              icon: Icon(Icons.star_border_rounded),
              selectedIcon: Icon(Icons.star_rounded),
              selectedColor: Colors.green,
              backgroundColor: Colors.amber,
              title: Text('Star')),

          AnimatedBarItems(
              icon: Icon(
                Icons.style_outlined,
              ),
              selectedIcon: Icon(
                Icons.style,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.deepOrangeAccent,
              title: Text('Style')),

          AnimatedBarItems(
              icon: Icon(
                Icons.person_outline,
              ),
              selectedIcon: Icon(
                Icons.person,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.pinkAccent,
              title: Text('Profile')),

          // BubbleBarItem(icon: Icon(Icons.abc), title: Text('Abc')),
          // BubbleBarItem(icon: Icon(Icons.safety_divider), title: Text('Safety')),
          // BubbleBarItem(icon: Icon(Icons.cabin), title: Text('Cabin')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.fade,
        // iconStyle: IconStyle.animated,
        iconStyle: IconStyle.Default,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.end,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // backgroundColor:
      //     bgColor != null ? bgColor.withOpacity(1.0) : Colors.white,
    );
  }
}

//
//Example to setup Stylish Bottom Bar with PageView
class PageExample extends StatefulWidget {
  const PageExample({Key? key}) : super(key: key);

  @override
  _PageExampleState createState() => _PageExampleState();
}

class _PageExampleState extends State<PageExample> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          //Home(),
          //Add(),
          //Profile(),
        ],
      ),
      bottomNavigationBar: AnimatedNavigationBar(
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        items: [
          AnimatedBarItems(
              icon: Icon(
                Icons.home,
              ),
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.amber,
              title: Text('Home')),
          AnimatedBarItems(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.amber,
              title: Text('Add')),
          AnimatedBarItems(
              icon: Icon(
                Icons.person,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.pinkAccent,
              title: Text('Profile')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.transform3D,
        opacity: 0.3,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index!;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
