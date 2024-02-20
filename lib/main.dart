import 'package:bar/app/features/homepage/view/homepage_view.dart';
import 'package:bar/app/features/homepage/viewmodels/homepage_viewmodel.dart';
import 'package:bar/app/utils/theme_data/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<HomePageViewModel>(create: (context) => HomePageViewModel(),)],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar_Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const HomePageView(),
    );
  }
}

