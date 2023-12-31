import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/services/api/api_service.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:shop_it/services/environment_service.dart';
import 'package:shop_it/services/local_storage_service.dart';
import 'package:shop_it/services/shop_products_service.dart';
import 'package:shop_it/services/users_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:shop_it/services/shopping_cart_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EnvironmentService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UsersService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ShopProductsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ShoppingCartService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterEnvironmentService();
  getAndRegisterApiService();
  getAndRegisterLocalStorageService();
  getAndRegisterUserService();
  getAndRegisterUsersService();
  getAndRegisterShopProductsService();
  getAndRegisterShoppingCartService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockEnvironmentService getAndRegisterEnvironmentService() {
  _removeRegistrationIfExists<EnvironmentService>();
  final service = MockEnvironmentService();
  locator.registerSingleton<EnvironmentService>(service);
  return service;
}

MockApiService getAndRegisterApiService() {
  _removeRegistrationIfExists<ApiService>();
  final service = MockApiService();
  locator.registerSingleton<ApiService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

MockAuthService getAndRegisterUserService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockUsersService getAndRegisterUsersService() {
  _removeRegistrationIfExists<UsersService>();
  final service = MockUsersService();
  locator.registerSingleton<UsersService>(service);
  return service;
}

MockShopProductsService getAndRegisterShopProductsService() {
  _removeRegistrationIfExists<ShopProductsService>();
  final service = MockShopProductsService();
  locator.registerSingleton<MockShopProductsService>(service);
  return service;
}

MockShoppingCartService getAndRegisterShoppingCartService() {
  _removeRegistrationIfExists<ShoppingCartService>();
  final service = MockShoppingCartService();
  locator.registerSingleton<ShoppingCartService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
