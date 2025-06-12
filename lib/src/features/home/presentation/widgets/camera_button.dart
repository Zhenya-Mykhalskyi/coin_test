import 'package:coinin_test/gen/assets.gen.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({
    this.onPressed,
    super.key,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.4),
                width: 5,
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              shape: const CircleBorder(),
              child: Assets.icons.camera.svg(
                width: 30,
                height: 27,
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
