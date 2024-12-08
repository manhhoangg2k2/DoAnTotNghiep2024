
import 'package:fare_riding_app/ui/pages/History/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/AppTabs.dart';
import '../../../home_menu/cubit/home_menu_cubit.dart';
import '../../../home_menu/view/home_menu.dart';
import '../../Account/view/account_screen.dart';
import '../../Home/view/home_screen.dart';
import '../../Wallet/view/wallet_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = AppTabs.home;
    // var context =
    const List<Widget> _pages = <Widget>[
      HomeScreen(),
      HistoryScreen(),
      WalletScreen(),
      AccountScreen(),
    ];

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeMenuCubit()),
        ],
        child: BlocBuilder<HomeMenuCubit, HomeMenuState>(
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: _pages.elementAt(state.index),
              ),
              bottomNavigationBar: HomeMenu(
                pageIndex: state.index,
                onTap:(index){
                  context.read<HomeMenuCubit>().changeIndex(index);
                },
              ),
            );
          },
        ));
  }
}
