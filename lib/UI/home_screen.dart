import 'package:health_predictor/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/common/CommonWidgets.dart';

import 'Home.dart';
import 'AboutUs.dart';
//import 'model/homelist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // List<HomeList> homeList = HomeList.homeList;
  late AnimationController animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar('Home'),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return Home();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// class HomeListView extends StatelessWidget {
//   const HomeListView(
//       {Key key,
//         this.listData,
//         this.callBack,
//         this.animationController,
//         this.animation})
//       : super(key: key);
//
//   final HomeList listData;
//   final VoidCallback callBack;
//   final AnimationController animationController;
//   final Animation<dynamic> animation;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (BuildContext context, Widget child) {
//         return FadeTransition(
//           opacity: animation,
//           child: Transform(
//             transform: Matrix4.translationValues(
//                 0.0, 50 * (1.0 - animation.value), 0.0),
//             child: AspectRatio(
//               aspectRatio: 1.5,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//                 child: Stack(
//                   alignment: AlignmentDirectional.center,
//                   children: <Widget>[
//                     Image.asset(
//                       listData.imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         splashColor: Colors.grey.withOpacity(0.2),
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(4.0)),
//                         onTap: () {
//                           callBack();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }