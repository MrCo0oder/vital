import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/app_assets.dart';
import '../../data/model/onboarding_slider.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final PageController pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingSlider> pagesList = [
    OnboardingSlider("Keep calm and stay\nin control",
        "You can check your health with just one\nlook.", AppAssets.ilCalm),
    OnboardingSlider("Don’t miss a single\npill, ever!",
        "Plan your supplementation in details.", AppAssets.ilPills),
    OnboardingSlider("Exercise more\n& breathe better",
        "Learn, measure, set daily goals.", AppAssets.ilYoga),
  ];

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutSine);
  }

  void goto(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutSine);
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
  }

  int get currentIndex => _currentIndex;
}
