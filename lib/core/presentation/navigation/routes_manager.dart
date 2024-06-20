import 'package:flutter/material.dart';
import 'package:vital/core/presentation/app_colors.dart';
import 'package:vital/core/presentation/navigation/routes.dart';

import '../../../feature/onboarding/ui/onboarding_view.dart';
import '../../../feature/register/registration_view.dart';
import '../../../feature/splash/splash_page.dart';
import '../utils/app_strings.dart';

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      // case Routes.loginRoute:
      //   return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationView());
      // case Routes.forgotPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      // case Routes.mainRoute:
      //   return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
          elevation: 1,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.close_rounded,
                size: 25.0,
                color: AppColors.alert,
              ),
              Text(
                AppStrings.noRouteFound,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
