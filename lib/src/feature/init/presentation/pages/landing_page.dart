import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:guidist/generated/assets.dart';
import 'package:guidist/src/common/styles/app_colors.dart';
import 'package:guidist/src/common/styles/text_style.dart';
import 'package:guidist/src/feature/init/controller/init_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/routes/app_route_name.dart';
import '../widgets/custom_intro_page_view_widget.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(initController);
    final InitController con = ref.read(initController);
    return Scaffold(
      backgroundColor: AppColors.bckgrColor,
      body: Column(
        children: [
          // Expanded(child: Container(), flex: 1,),
          SizedBox(
            height: 90.h,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int currentItem) => con.changePage(currentItem),
              itemCount: 5,
              controller: con.pageController,
              itemBuilder: (context, currentItem) {
                List<String> titles = [
                  "Welcome to Guided!",
                  "Connect with Experienced Guides",
                  "Explore Unique Destinations",
                  "Plan Your Trip",
                  "Easy Booking and Secure Payments"
                ];

                List<String> subtitles = [
                  "Your Personal Guide to the Best Travel Experiences",
                  "Find the Perfect Guide for Your Journey",
                  "Discover Hidden Gems Around the World",
                  "Personalized Itineraries for Every Traveler",
                  "Hassle-Free and Safe Transactions"
                ];

                List<String> content = [
                  "Discover new destinations, connect with experienced guides, and make the most of your travels with GuidIst. Let's get started!",
                  "Our platform connects you with knowledgeable and friendly guides who will enhance your travel experience. Choose guides based on your interests and preferences.",
                  "With GuidIst, you can explore off-the-beaten-path locations and experience the true essence of your destination. Our guides will show you the hidden gems and local secrets.",
                  "Create personalized itineraries that suit your interests and schedule. Our guides will help you plan every detail, from must-see attractions to the best local restaurants.",
                  "Booking your guide and tours is quick and easy with GuidIst. Enjoy secure payment options and peace of mind knowing your transactions are safe."
                ];

                return CustomIntroPageViewWidget(
                  title: titles[currentItem],
                  subTitle: subtitles[currentItem],
                  content: content[currentItem],
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: con.pageController,
            count: 5,
            effect: WormEffect(
              dotWidth: 20.h,
              dotHeight: 10.h,
              strokeWidth: 1.5,
              dotColor: Colors.grey,
              activeDotColor: AppColors.btnColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
            child: MaterialButton(
              onPressed: () {
                if (con.currentPage < 4) {
                  con.changePage(con.currentPage + 1);
                } else {
                  context.go(AppRouteName.choosePanelPage);
                }
              },
              child: Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
