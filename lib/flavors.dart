enum Flavor {
  dev,
  stg,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Biv App';
      case Flavor.stg:
        return 'Biv App STG';
      default:
        return 'title';
    }
  }

}
