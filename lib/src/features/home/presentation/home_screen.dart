import 'package:coinin_test/src/core/navigation/app_routes.dart';
import 'package:coinin_test/src/features/home/bloc/coin_bloc.dart';
import 'package:coinin_test/src/features/home/presentation/widgets/profile_icon.dart';
import 'package:coinin_test/src/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: ProfileIcon(),
          title: Text(
            'CoinIn',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
          actions: [
            SettingsButton(
              onPressed: () => context.push(AppPages.settings.path),
            ),
          ],
        ),
        body: Column(
          children: [
            const FreePremiumCard(),
            const SizedBox(height: 40),
            Expanded(
              child: CoinIdentificationSection(),
            ),
          ],
        ),
        floatingActionButton: CameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
