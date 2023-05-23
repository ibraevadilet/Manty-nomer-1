import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';

@RoutePage()
class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'О компании'),
      body: Center(
        child: Text('AboutCompanyScreen'),
      ),
    );
  }
}
