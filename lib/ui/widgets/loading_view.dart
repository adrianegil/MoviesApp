import 'package:flutter/cupertino.dart';

import '../styles/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        child: const CupertinoActivityIndicator(
          radius: 20,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
