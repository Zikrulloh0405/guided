import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/src/common/routes/app_route_name.dart';
import 'package:guidist/src/common/widget/app_material_context.dart';
import 'package:guidist/src/feature/widgets/language_picker/custom_language_picker_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../common/styles/app_colors.dart';



class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _containerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -5.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _containerAnimation = Tween<Offset>(
      begin: const Offset(0, 5.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.btnColor,
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.imagesPlaneBackground,
                      ),
                      fit: BoxFit.cover)),
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Spacer(),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return ScaleTransition(
                        scale: _controller.drive(
                          Tween<double>(begin: 0.0, end: 1.0).chain(
                            CurveTween(curve: Curves.easeInOut),
                          ),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Guided",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 40.sp,
                                color: Colors.black,
                              ),
                        ),
                      );
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return SlideTransition(
                        position: _containerAnimation,
                        child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 70.h,
                              left: 50.w,
                              right: 50.w,
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                              color: AppColors.btnColor,
                              minWidth: 200.w,
                              height: 50.h,
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                  builder: (context) {
                                    return CustomLanguagePickerWidget(
                                      localControllerVm: localController,
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // _textAnimationController.dispose();
    // _offsetAnimation.removeListener(() {  });
    // _containerAnimation.removeListener(() { });
    super.dispose();
  }
}
