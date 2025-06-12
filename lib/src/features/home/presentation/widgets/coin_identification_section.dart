import 'package:coinin_test/gen/assets.gen.dart';
import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:coinin_test/src/core/resources/app_const.dart';
import 'package:coinin_test/src/core/widgets/custom_button.dart';
import 'package:coinin_test/src/features/home/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinIdentificationSection extends StatelessWidget {
  const CoinIdentificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final appTheme = context.appTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 75),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: appTheme.coinCardBackground,
              borderRadius: BorderRadius.circular(AppConst.radius16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomButton(
                      label: loc.identifyCoin,
                      onPressed: () => context
                          .read<CoinBloc>()
                          .add(const CoinImagePickRequested()),
                      icon: Assets.icons.camera.svg(
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<CoinBloc, CoinState>(
            builder: (context, state) {
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: state.coinImage != null
                      ? Image.file(
                          state.coinImage!,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        )
                      : Assets.images.bronzeCoin.image(
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
