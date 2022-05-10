import 'package:my_shop/services/authentication_service.dart';
import 'package:my_shop/services/carousel_service.dart';
import 'package:my_shop/services/cart_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CarouselService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CartService());
}
