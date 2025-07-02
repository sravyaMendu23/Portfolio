import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS4Projects extends StatelessWidget {
  const MS4Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.projectsKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.projectsTitle,
                description: DataValues.projectsDescription),
            const SizedBox(height: 30.0),
            ContainerCard().type3(
              image: 'assets/images/klee_tech_logo.png',
              title: DataValues.projectsOrg1Title,
              role: DataValues.projectsOrg1Technologies,
              years: DataValues.projectsOrg1Duration,
              values: DataValues.projectsOrg1Aim,
              message: DataValues.githubURL.toString(),
              url: DataValues.githubURL,
              isButtonEnabled: false,
            ),
            const SizedBox(height: 20.0),
            ContainerCard().type3(
              image: 'assets/images/toucan_logo.png',
              title: DataValues.projectsOrg2Title,
              role: DataValues.projectsOrg2Technologies,
              years: DataValues.projectsOrg2Duration,
              values: DataValues.projectsOrg2Aim,
              message: DataValues.githubURL.toString(),
              url: DataValues.githubURL,
              isButtonEnabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
