import 'package:flutter/cupertino.dart';

import '../styles/app_colors.dart';

/// Vista correspondiente al estado de Cargando
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        child: const CupertinoActivityIndicator(
          radius: 20,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
