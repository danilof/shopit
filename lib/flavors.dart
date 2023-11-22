enum Flavor {
  doiitshopdev,
  doiitshopprod,
  shopit,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.doiitshopdev:
        return 'DoITShop-DEV';
      case Flavor.doiitshopprod:
        return 'DoITShop-Prod';
      case Flavor.shopit:
        return 'ShopIT';
      default:
        return 'title';
    }
  }

}
