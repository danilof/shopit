# ShopIT

App is based on Stacked Architecture
with the Model-View-ViewModel (MVVM) architectural pattern

## App has the following features:

- Get users. Search users. Select user to login with.
- Login user.
- Products list / grid. Products search. Adding products to shopping cart.
- Product detail.
- Shopping cart.

## Additional:

- Localization - Multi-language support
- Support different app Environments
    - Development:
      flutter run --dart-define-from-file=assets/environments/development.json
    - Staging:
      flutter run --dart-define-from-file=assets/environments/staging.json
- Build in Design system
- Themes support (light/dark)
- User Auto login

## Main libraries:

- stacked (state management, navigation, dialogs, MVVM, services, reactive services, dependency
  Inversion, unit test stubs).
- flex_color_scheme for theming.
- retrofit api client.

## Api for demo data:

https://dummyjson.com

Build app with different environments:

