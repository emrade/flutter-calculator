import 'dart:math';

class AppConstants {
  static const appName = "Calculator";
}

class AppFonts {
  static const primaryFont = "Poppins";
}

class AppFunctions {
  getRandomId() {
    var rng = new Random();
    return rng.nextInt(1000000000);
  }
}

class AppImages {
  static const logo = 'assets/images/logo.png';
}
