import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidist/src/feature/main/presenatation/pages/main_page.dart';
import '../../../../../../../generated/assets.dart';
import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../common/styles/text_style.dart';

import '../widgets/custom_app_bar_title_widget.dart';
import '../widgets/custom_filter_widget.dart';
import '../widgets/custom_search_bar_widget.dart';

class TouristHomePage extends StatelessWidget {
  const TouristHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bckgrColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.bckgrColor,
              titleSpacing: 0,
              toolbarHeight: 85.h,
              leadingWidth: 95.w,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    padding: EdgeInsets.only(left: 20.w),
                    onPressed: () {
                      // Scaffold.of(context).openDrawer();
                      mainScaffoldKey.currentState!.openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    icon: CircleAvatar(
                      radius: 25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: const Image(
                          image: AssetImage(Assets.imagesProfileImg),
                        ),
                      ),
                    ),
                  );
                },
              ),
              title: const CustomAppBarTitleWidget(),
              actions: [
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          mainScaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: SvgPicture.asset(
                          Assets.iconsNotification,
                          color: AppColors.black,
                        ),
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
              ],
            ),
            SliverPersistentHeader(
              delegate: CustomBottomAppBarDelegate(context: context),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: CustomCategoryFilteringWidget(),
            ),
            SliverFixedExtentList(
              itemExtent: 500.w,
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (BuildContext context, int index) {
                  return CustomTourCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTourCard extends StatelessWidget {
  const CustomTourCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                Assets.imagesImg,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // height: 170.h,
                      alignment: Alignment.bottomCenter,
                      color: const Color.fromRGBO(255, 255, 255, 0.40),
                      child: Column(
                        children: [
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ice Mountains",
                                  style: const AppTextStyle().titleSmall?.copyWith(fontSize: 22.sp),
                                ),
                                Container(
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color.fromRGBO(255, 255, 255, 0.15),
                                  ),
                                  padding: EdgeInsets.all(10.w),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconsLocation,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "Iceland",
                                        style: const AppTextStyle().bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                CircleAvatar(
                                  // backgroundImage: const AssetImage(Assets.imagesProfileImg),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: const Image(
                                      image: AssetImage(Assets.assetsImagesProfileImg),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text("Mr Travis"),
                              ],
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "19.07.2024",
                              style: const AppTextStyle().titleSmall,
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10.r)),
                              width: 90.w,
                              padding: EdgeInsets.all(5.w),
                              child: Text(
                                textAlign: TextAlign.center,
                                "\$ 200",
                                style: const AppTextStyle().titleSmall?.copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCategoryFilteringWidget extends StatelessWidget {
  const CustomCategoryFilteringWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int item) {
          List<String> categoryNames = [
            "All",
            "Cultural Tours",
            "Historical Sites",
            "Adventure Tours",
          ];
          return MaterialButton(
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            onPressed: () {},
            child: MaterialButton(
              height: 50.h,
              minWidth: 50.w,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.zero,
              color: item == 0 ? AppColors.btnColor : AppColors.white,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  categoryNames[item],
                  style: const AppTextStyle().titleSmall?.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 4,
      ),
    );
  }
}

class CustomBottomAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomBottomAppBarDelegate({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSearchBarWidget(),
          ),
          SizedBox(
            width: 20.w,
          ),
          const Expanded(
            child: CustomFilterWidget(),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 88.7;

  @override
  double get minExtent => 88.7;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
