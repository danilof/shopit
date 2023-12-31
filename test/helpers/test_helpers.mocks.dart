// Mocks generated by Mockito 5.4.2 from annotations
// in shop_it/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:flutter/material.dart' as _i5;
import 'package:logger/src/logger.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shop_it/models/models.dart' as _i2;
import 'package:shop_it/services/api/api_service.dart' as _i9;
import 'package:shop_it/services/auth_service.dart' as _i11;
import 'package:shop_it/services/environment_service.dart' as _i8;
import 'package:shop_it/services/local_storage_service.dart' as _i10;
import 'package:shop_it/services/shop_products_service.dart' as _i13;
import 'package:shop_it/services/shopping_cart_service.dart' as _i14;
import 'package:shop_it/services/users_service.dart' as _i12;
import 'package:stacked_services/stacked_services.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthUser_0 extends _i1.SmartFake implements _i2.AuthUser {
  _FakeAuthUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUsersResponse_1 extends _i1.SmartFake implements _i2.UsersResponse {
  _FakeUsersResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductsResponse_2 extends _i1.SmartFake
    implements _i2.ProductsResponse {
  _FakeProductsResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCartsResponse_3 extends _i1.SmartFake implements _i2.CartsResponse {
  _FakeCartsResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLogger_4 extends _i1.SmartFake implements _i3.Logger {
  _FakeLogger_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i4.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  _i5.GlobalKey<_i5.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i5.GlobalKey<_i5.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i4.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<T?>? navigateWithTransition<T>(
    _i5.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i5.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? replaceWithTransition<T>(
    _i5.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i5.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i5.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i5.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? navigateToView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i5.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i4.Transition? transition,
    _i4.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i5.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? clearStackAndShowView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? clearTillFirstAndShowView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);

  @override
  _i6.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i5.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i6.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i4.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i4.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i4.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i6.Future<_i4.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i6.Future<_i4.SheetResponse<dynamic>?>.value(),
      ) as _i6.Future<_i4.SheetResponse<dynamic>?>);

  @override
  _i6.Future<_i4.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i7.Color? barrierColor = const _i7.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i6.Future<_i4.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i6.Future<_i4.SheetResponse<T>?>.value(),
      ) as _i6.Future<_i4.SheetResponse<T>?>);

  @override
  void completeSheet(_i4.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i4.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i4.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i5.Widget Function(
      _i5.BuildContext,
      _i4.DialogRequest<dynamic>,
      dynamic Function(_i4.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i4.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i7.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i7.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i6.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i6.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i6.Future<_i4.DialogResponse<dynamic>?>);

  @override
  _i6.Future<_i4.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i7.Color? barrierColor = const _i7.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i6.Future<_i4.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i6.Future<_i4.DialogResponse<T>?>.value(),
      ) as _i6.Future<_i4.DialogResponse<T>?>);

  @override
  _i6.Future<_i4.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i7.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i7.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i6.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i6.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i6.Future<_i4.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i4.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [EnvironmentService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEnvironmentService extends _i1.Mock
    implements _i8.EnvironmentService {}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i9.ApiService {
  @override
  _i6.Future<_i2.AuthUser> login(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            username,
            password,
          ],
        ),
        returnValue: _i6.Future<_i2.AuthUser>.value(_FakeAuthUser_0(
          this,
          Invocation.method(
            #login,
            [
              username,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.AuthUser>.value(_FakeAuthUser_0(
          this,
          Invocation.method(
            #login,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i2.AuthUser>);

  @override
  _i6.Future<_i2.UsersResponse> getAllUsers() => (super.noSuchMethod(
        Invocation.method(
          #getAllUsers,
          [],
        ),
        returnValue: _i6.Future<_i2.UsersResponse>.value(_FakeUsersResponse_1(
          this,
          Invocation.method(
            #getAllUsers,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.UsersResponse>.value(_FakeUsersResponse_1(
          this,
          Invocation.method(
            #getAllUsers,
            [],
          ),
        )),
      ) as _i6.Future<_i2.UsersResponse>);

  @override
  _i6.Future<_i2.UsersResponse> searchUsers(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchUsers,
          [query],
        ),
        returnValue: _i6.Future<_i2.UsersResponse>.value(_FakeUsersResponse_1(
          this,
          Invocation.method(
            #searchUsers,
            [query],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.UsersResponse>.value(_FakeUsersResponse_1(
          this,
          Invocation.method(
            #searchUsers,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.UsersResponse>);

  @override
  _i6.Future<_i2.ProductsResponse> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i6.Future<_i2.ProductsResponse>.value(_FakeProductsResponse_2(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.ProductsResponse>.value(_FakeProductsResponse_2(
          this,
          Invocation.method(
            #getProducts,
            [],
          ),
        )),
      ) as _i6.Future<_i2.ProductsResponse>);

  @override
  _i6.Future<_i2.ProductsResponse> searchProducts(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchProducts,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.ProductsResponse>.value(_FakeProductsResponse_2(
          this,
          Invocation.method(
            #searchProducts,
            [query],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.ProductsResponse>.value(_FakeProductsResponse_2(
          this,
          Invocation.method(
            #searchProducts,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.ProductsResponse>);

  @override
  _i6.Future<_i2.CartsResponse> getCartsForUser(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCartsForUser,
          [userId],
        ),
        returnValue: _i6.Future<_i2.CartsResponse>.value(_FakeCartsResponse_3(
          this,
          Invocation.method(
            #getCartsForUser,
            [userId],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.CartsResponse>.value(_FakeCartsResponse_3(
          this,
          Invocation.method(
            #getCartsForUser,
            [userId],
          ),
        )),
      ) as _i6.Future<_i2.CartsResponse>);
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock
    implements _i10.LocalStorageService {
  @override
  set user(_i2.AuthUser? user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          user,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void clearAll() => super.noSuchMethod(
        Invocation.method(
          #clearAll,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i11.AuthService {
  @override
  _i3.Logger get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
        returnValueForMissingStub: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
      ) as _i3.Logger);

  @override
  bool get currentUserExist => (super.noSuchMethod(
        Invocation.getter(#currentUserExist),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  dynamic login(
    String? username,
    String? password,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #login,
          [
            username,
            password,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UsersService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersService extends _i1.Mock implements _i12.UsersService {
  @override
  _i3.Logger get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
        returnValueForMissingStub: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
      ) as _i3.Logger);

  @override
  _i6.Future<List<_i2.User>> getUsers() => (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [],
        ),
        returnValue: _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
      ) as _i6.Future<List<_i2.User>>);

  @override
  _i6.Future<List<_i2.User>> searchUsers(String? query) => (super.noSuchMethod(
        Invocation.method(
          #searchUsers,
          [query],
        ),
        returnValue: _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.User>>.value(<_i2.User>[]),
      ) as _i6.Future<List<_i2.User>>);
}

/// A class which mocks [ShopProductsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockShopProductsService extends _i1.Mock
    implements _i13.ShopProductsService {
  @override
  _i3.Logger get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
        returnValueForMissingStub: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
      ) as _i3.Logger);

  @override
  _i6.Future<List<_i2.Product>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Product>>.value(<_i2.Product>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.Product>>.value(<_i2.Product>[]),
      ) as _i6.Future<List<_i2.Product>>);

  @override
  _i6.Future<List<_i2.Product>> searchProducts(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchProducts,
          [query],
        ),
        returnValue: _i6.Future<List<_i2.Product>>.value(<_i2.Product>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.Product>>.value(<_i2.Product>[]),
      ) as _i6.Future<List<_i2.Product>>);
}

/// A class which mocks [ShoppingCartService].
///
/// See the documentation for Mockito's code generation for more information.
class MockShoppingCartService extends _i1.Mock
    implements _i14.ShoppingCartService {
  @override
  _i3.Logger get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
        returnValueForMissingStub: _FakeLogger_4(
          this,
          Invocation.getter(#log),
        ),
      ) as _i3.Logger);

  @override
  bool get hasCart => (super.noSuchMethod(
        Invocation.getter(#hasCart),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get total => (super.noSuchMethod(
        Invocation.getter(#total),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i6.Future<void> initUserCart() => (super.noSuchMethod(
        Invocation.method(
          #initUserCart,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void addProduct(_i2.Product? item) => super.noSuchMethod(
        Invocation.method(
          #addProduct,
          [item],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeProduct(int? productId) => super.noSuchMethod(
        Invocation.method(
          #removeProduct,
          [productId],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void productReduceQuantity(int? productId) => super.noSuchMethod(
        Invocation.method(
          #productReduceQuantity,
          [productId],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void productAddToQuantity(int? productId) => super.noSuchMethod(
        Invocation.method(
          #productAddToQuantity,
          [productId],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
