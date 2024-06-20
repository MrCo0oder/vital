import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vital/core/presentation/widgets/spacers.dart';

import '../../../core/presentation/app_colors.dart';
import '../../../core/presentation/app_text_styles.dart';
import '../../../core/presentation/navigation/routes.dart';
import '../../../core/presentation/utils/app_assets.dart';
import '../../../core/presentation/utils/app_strings.dart';
import '../../../core/presentation/widgets/lined_button.dart';
import '../data/model/onboarding_slider.dart';
import '../domain/cubit/onboarding_cubit.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.violetLight,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingBody(),
        ),
      ),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          vXl(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h24px()),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: LinedButton(
                label: AppStrings.skipIntro,
                onPressed: () {
                  navToRegister(context);
                },
              ),
            ),
          ),
          vXXXl(),
          SizedBox(
            height: 490,
            child: PageView.builder(
              controller:
                  BlocProvider.of<OnboardingCubit>(context).pageController,
              itemCount:
                  BlocProvider.of<OnboardingCubit>(context).pagesList.length,
              onPageChanged: (index) {
                BlocProvider.of<OnboardingCubit>(context)
                    .setCurrentIndex(index);
              },
              itemBuilder: (context, index) {
                final pagesList =
                    BlocProvider.of<OnboardingCubit>(context).pagesList;
                return OnboardingPage(
                  onboardingSlider: OnboardingSlider(pagesList[index].header,
                      pagesList[index].body, pagesList[index].imagePath),
                );
              },
            ),
          ),
          vXXXl(),
          MaterialButton(
            onPressed: () {
              if (BlocProvider.of<OnboardingCubit>(context).currentIndex == 2) {
                navToRegister(context);
              } else {
                BlocProvider.of<OnboardingCubit>(context).nextPage();
              }
            },
            color: AppColors.purplePlum,
            splashColor: AppColors.turquoise,
            height: 88,
            minWidth: 88,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(
              AppAssets.arrowLongRight,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          vXl(),
          SmoothPageIndicator(
              controller:
                  BlocProvider.of<OnboardingCubit>(context).pageController,
              // PageController
              count: BlocProvider.of<OnboardingCubit>(context).pagesList.length,
              effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: AppColors.lilacPetalsDark,
                  activeDotColor: AppColors.purplePlum),
              // your preferred effect
              onDotClicked: (index) {
                BlocProvider.of<OnboardingCubit>(context).goto(index);
              }),
          vXl(),
        ],
      ),
    );
  }

  void navToRegister(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingSlider onboardingSlider;

  const OnboardingPage({super.key, required this.onboardingSlider});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          onboardingSlider.imagePath,
        ),
        const Gap(40),
        Text(
          onboardingSlider.header,
          style: const AppTextStyles()
              .headline1
              .copyWith(color: AppColors.deepBlue),
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Text(
          onboardingSlider.body,
          style: const AppTextStyles()
              .bodyText1
              .copyWith(color: AppColors.coldGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
