import 'package:my_shop/constants/asset_constants.dart';
import 'package:my_shop/shared/styles.dart';
import 'package:my_shop/viewmodels/login_viewmodel.dart';
import 'package:my_shop/widgets/dumb/authentication_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => AuthenticationLayout(
        image: AssetConstants.loginBackground,
        form: const LoginForm(),
        minHeight: 453,
        onBackButtonPressed: () {},
        isDisabled: model.isLoading,
        onScreenTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          model.fieldTextColor = appGreyColor;
          model.fieldPasswordColor = appGreyColor;
        },
      ),
    );
  }
}
