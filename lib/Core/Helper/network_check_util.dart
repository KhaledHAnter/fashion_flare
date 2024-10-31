import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCheckUtil {
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    // Check if the device is connected to either Wi-Fi or mobile data
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true; // Device is connected to the internet
    } else {
      return false; // No internet connection
    }
  }
}
