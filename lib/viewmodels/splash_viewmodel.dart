import 'package:my_shop/app/app.router.dart';
import 'package:my_shop/app/locator.dart';
import 'package:my_shop/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _auth = locator<AuthenticationService>();
  final _navigator = locator<NavigationService>();

  void initializeApp() async {
    await _auth.loadUser();
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );
    if (_auth.authToken == null) {
      _navigator.replaceWith(Routes.loginView);
    } else {
      _navigator.replaceWith(Routes.homeView);
    }
  }
}
