
enum Flavor {
  DEV,
  STG,
  PROD,
}

class FlavorConfig {
  static Flavor appFlavor;
  static String get userBaseUrl {
    switch (appFlavor) {
      case Flavor.STG:
        return "STG";
      case Flavor.PROD:
        return "PROD";
      default:
        return "https://3e727e70-5db1-40a3-b5e1-7ff2646ab4d1.mock.pstmn.io";
    }
  }
}
