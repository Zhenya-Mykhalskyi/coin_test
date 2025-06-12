import 'package:coinin_test/gen/assets.gen.dart';
import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_const.dart';
import 'package:flutter/material.dart';

class FreePremiumCard extends StatelessWidget {
  const FreePremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final theme = Theme.of(context);
    final appTheme = context.appTheme;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConst.radius12),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              appTheme.premiumCardGradient2,
              appTheme.premiumCardGradient1,
            ],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: Stack(
                children: [
                  Assets.images.silverCoinOutline.image(
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Assets.images.silverCoin.image(
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.freePremiumAvailable,
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    loc.tapToClaim,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
