import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import 'button_rectangle.dart';
import 'button_text.dart';

class NavBar {
  Widget desktopNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTextLarge(
          text: DataValues.navBarAboutMe,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.aboutKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarAboutMe} section',
        ),
        const SizedBox(width: 20.0),
        ButtonTextLarge(
          text: DataValues.navBarExperience,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.experienceKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarExperience} section',
        ),
        const SizedBox(width: 20.0),
        ButtonTextLarge(
          text: DataValues.navBarProjects,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.projectsKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarProjects} section',
        ),
        const SizedBox(width: 20.0),
        ButtonTextLarge(
          text: DataValues.navBarEducation,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.educationKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          message: 'Go to ${DataValues.navBarEducation} section',
        ),
        const SizedBox(width: 20.0),
        ButtonRectangle(
          name: DataValues.navBarContactMe,
          onPressed: () => Scrollable.ensureVisible(
            KeyHolders.contactKey.currentContext!,
            duration: const Duration(milliseconds: 1000),
          ),
          color: AppThemeData.buttonPrimary,
          message: 'Go to ${DataValues.navBarContactMe} section',
        ),
      ],
    );
  }

  Widget mobileNavBar(BuildContext context) {
    Widget miniHeader() {
      return Column(
        children: [
          Image.asset('assets/images/sravya_profile.jpeg',
              height: 80.0, width: 80.0),
          const SizedBox(height: 10.0),
          SelectableText(
            DataValues.headerName,
            style: TextStyle(
              color: AppThemeData.textPrimary,
              fontSize: AppThemeData.darkTheme.textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.labelLarge,
          ),
        ],
      );
    }

    return Drawer(
      backgroundColor: AppThemeData.backgroundBlack,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 60.0),
          miniHeader(),
          const SizedBox(height: 20.0),
          ButtonTextLarge(
            text: DataValues.navBarAboutMe,
            onPressed: () {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.aboutKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarAboutMe} section',
          ),
          const SizedBox(height: 20.0),
          ButtonTextLarge(
            text: DataValues.navBarExperience,
            onPressed: () {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.experienceKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarExperience} section',
          ),
          const SizedBox(height: 20.0),
          ButtonTextLarge(
            text: DataValues.navBarProjects,
            onPressed: () {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.projectsKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarProjects} section',
          ),
          const SizedBox(height: 20.0),
          ButtonTextLarge(
            text: DataValues.navBarEducation,
            onPressed: () {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.educationKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            message: 'Go to ${DataValues.navBarEducation} section',
          ),
          const SizedBox(height: 20.0),
          ButtonRectangle(
            name: DataValues.navBarContactMe,
            onPressed: () {
              Navigator.pop(context);
              Scrollable.ensureVisible(
                KeyHolders.contactKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
            color: AppThemeData.buttonPrimary,
            message: 'Go to ${DataValues.navBarContactMe} section',
          ),
        ],
      ),
    );
  }
}
