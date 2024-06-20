import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vital/core/presentation/utils/app_assets.dart';

import '../app_colors.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> list;
  final ValueChanged<int> onChange;

  const CustomDropDown({super.key,
    this.list = const ["Daily", "Weekly", "Monthly"],
    required this.onChange,
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  bool mExpanded = false;
  late String selectedElement;

  @override
  void initState() {
    super.initState();
    selectedElement = "-----";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChange(widget.list.indexOf(selectedElement));
    });
  }

  @override
  void didUpdateWidget(CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (selectedElement != oldWidget.list[0]) {
      widget.onChange(widget.list.indexOf(selectedElement));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lilacPetals,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: mExpanded ? AppColors.purplePlum : AppColors.lilacPetalsDark,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  mExpanded = !mExpanded;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedElement, style: const TextStyle(fontSize: 16)),
                    Container(
                      decoration: BoxDecoration(
                        color: mExpanded
                            ? AppColors.violetLight
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SvgPicture.asset(
                        mExpanded ?AppAssets.arrowUp: AppAssets.arrowDown,
                        color: AppColors.deepBlue,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: mExpanded
                    ? widget.list.map((s) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(color: AppColors.violet),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedElement = s;
                                  mExpanded = false;
                                });
                                widget.onChange(widget.list.indexOf(s));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: s == selectedElement
                                      ? AppColors.violetLight
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                child: Text(
                                  s,
                                  style: const TextStyle(
                                    color: AppColors.deepBlue,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList()
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
