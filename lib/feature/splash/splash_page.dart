import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vital/core/presentation/app_text_styles.dart';
import 'package:vital/core/presentation/utils/app_assets.dart';
import 'package:vital/core/presentation/widgets/app_button.dart';

import '../../core/presentation/app_colors.dart';
import '../../core/presentation/navigation/routes.dart';
import '../../core/presentation/utils/app_strings.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _startAnimation(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0)
                          .animate(_animationController),
                      child: SvgPicture.asset(
                        AppAssets.appLogo,
                        width: (size.height > size.width)
                            ? size.width * 0.4
                            : size.height * 0.4,
                        height: (size.height > size.width)
                            ? size.width * 0.4
                            : size.height * 0.4,
                      ),
                    );
                  }),
              Gap(3.sh),
              Text(
                AppStrings.welcomeToVital,
                style: const AppTextStyles()
                    .headline1
                    .copyWith(color: AppColors.deepBlue),
                textAlign: TextAlign.center,
              ),
              Gap(3.sh),
              Text(
                AppStrings.splashSlogan,
                style: const AppTextStyles()
                    .bodyText1
                    .copyWith(color: AppColors.coldGrey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AppButton(
        label: AppStrings.letsStart,
        onPressed: () {
          _navigateToOnBoarding();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _startAnimation(Function callback) {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000),
        animationBehavior: AnimationBehavior.preserve);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          // _navigateToOnBoarding();
        }
      });
    });
  }

  void _navigateToOnBoarding() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}
