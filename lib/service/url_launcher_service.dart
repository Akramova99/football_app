import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static Future<void> facebookCall() async {
    final Uri launchUri = Uri(scheme: "http", path: "//facebook.com/");
    await launchUrl(launchUri);
  }
  static Future<void> instagramCall() async {
    final Uri launchUri = Uri(scheme: "http", path: "//instagram.com/");
    await launchUrl(launchUri);
  }
  static Future<void> twitterCall() async {
    final Uri launchUri = Uri(scheme: "http", path: "//twitter.com/");
    await launchUrl(launchUri);
  }
}
