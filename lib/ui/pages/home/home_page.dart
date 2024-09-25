import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/home/home_controller.dart';
import 'package:moviesapp/ui/pages/home/widgets/appbar_main.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_styles.dart';

/// Vista del Home.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
              child: TextFormField(
                autofocus: false,
                controller: controller.searchTxtFieldController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  enabledBorder: AppStyles.textFieldBorderNormal,
                  focusedBorder: AppStyles.textFieldBorderFocused,
                  errorBorder: AppStyles.textFieldBorderError,
                  focusedErrorBorder: AppStyles.textFieldBorderError,
                  floatingLabelStyle:
                      const TextStyle(color: AppColors.primaryColor),
                  label: Text("Buscar por Título"),
                  iconColor: AppColors.primaryColor,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        ToastHelper.showCustomToast(
                            message: "Buscar", infoType: InfoType.SUCCESS);
                      }
                    },
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required".tr;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
