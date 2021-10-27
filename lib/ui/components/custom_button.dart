import 'package:flutter/material.dart';

import '../../app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onClick;

  const CustomButton({Key? key, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.MONO_VIOLET.withOpacity(0.6),
                AppColors.MONO_AVERAGE,
                AppColors.MONO_AVERAGE2,
                AppColors.PRIMARY_ORANGE,
              ],
              stops: [0.05, 0.3, 0.5, 0.7],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.MONO_WHITE,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
