import 'package:flutter/material.dart';
import 'package:sravya_portfolio/widgets/text_animations.dart';

import '../statics/data_values.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/social_profiles.dart';

class DS1Header extends StatefulWidget {
  const DS1Header({Key? key}) : super(key: key);

  @override
  _DS1HeaderState createState() => _DS1HeaderState();
}

class _DS1HeaderState extends State<DS1Header>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bounceAnimation;

  final double bounceStartOffset = -500.0; // avatar starts 500px to the left

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bounceAnimation = Tween<double>(
      begin: bounceStartOffset,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> headerData() {
    return [
      AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_bounceAnimation.value, 0),
            child: child,
          );
        },
        child: const CircleAvatar(
          radius: 125.0,
          backgroundImage: AssetImage('assets/images/sravya_profile.jpeg'),
        ),
      ),
      const SizedBox(width: 60.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
          ),
          AnimatedTextReveal(
            text: DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.backgroundBlack,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: headerData(),
            ),
            const SizedBox(height: 60.0),
            NavBar().desktopNavBar(context),
          ],
        ),
      ),
    );
  }
}
