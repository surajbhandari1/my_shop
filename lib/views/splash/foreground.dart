import 'package:flutter/material.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';

class Foreground extends StatelessWidget {
  const Foreground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 96),
        Text(
          'Welcome to',
          style: heading2,
        ),
        // const SizedBox(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(80, 5, 5, 0),
          child: Image.asset(
            AssetConstants.appLogo,
            width: 400,
            height: 200,
          ),
        ),
        const SizedBox(height: 17),

        const Spacer(),
        Text(
          'DEVELOPED BY',
          style: heading3,
        ),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            text: 'Suraj',
            style: heading2,
            children: <TextSpan>[
              TextSpan(text: 'Bhandari', style: heading1),
            ],
          ),
        ),
        const SizedBox(height: 31),
      ],
    );
  }
}
