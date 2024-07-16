import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidist/src/common/styles/app_colors.dart';
import 'package:guidist/src/feature/main/controller/main_controller.dart';
import 'package:guidist/src/feature/main/presenatation/widgets/custom_drawer_widget.dart';
import 'package:guidist/src/feature/main/presenatation/widgets/custom_end_drawer_widget.dart';
import '../../../../../generated/assets.dart';

final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

class MainPage extends ConsumerWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainController);
    var con = ref.read(mainController);
    return Scaffold(
      key: mainScaffoldKey,
      drawer: const CustomDrawerWidget(),
      endDrawer: const CustomEndDrawerWidget(),
      backgroundColor: AppColors.backgroundColorDark.withOpacity(.5),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bckgrColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          con.changePage(index, context);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsBottomHome),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsBottomSchedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsBottomChat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsBottomUser),
            label: 'Profile',
          ),
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   onTap: (int index) {
      //     con.changePage(
      //       index,
      //       context,
      //     );
      //   },
      //   // buttonBackgroundColor: Colors.white,
      //   backgroundColor: AppColors.backgroundColorDark.withOpacity(.1),
      //   color: const Color.fromRGBO(255, 255, 255, .79),
      //   items: [
      //     SvgPicture.asset(Assets.iconsHome),
      //     SvgPicture.asset(Assets.iconsSchedule),
      //     SvgPicture.asset(Assets.iconsProfile),
      //   ],
      // ),
    );
  }
}

// class CustomBottomBarItem extends StatelessWidget {
//   const CustomBottomBarItem({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(Assets.iconsHome);
//   }
// }
