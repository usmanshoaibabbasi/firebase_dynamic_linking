import 'package:firebase_dynamic_linking/second_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkServices {
  Future<String> generateProductDeepLink({
    String? productId,
  }) async {
    final String url = "https://your_package_name?key=$productId";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        link: Uri.parse(url),
        uriPrefix: AppConstants.dynamicLinksDomain,
        androidParameters: AndroidParameters(
          packageName: AppConstants.packageNameAndroid,
          minimumVersion: 0,
        ),
        iosParameters: IOSParameters(
          bundleId: AppConstants.bundleIdIOS,
          minimumVersion: '1.0.0',
          appStoreId: 'your_app_store_id',
        ));
    final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
    final Uri refLink = shortDynamicLink.shortUrl;
    return refLink.toString();
  }

  ///
  Future<bool> initDynamicLink({
    BuildContext? context,
  }) async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      String? dynamicLinkdata = refLink.queryParameters["key"];
      Navigator.push(context!, MaterialPageRoute(
        builder: (context) {
          return SecondScreen(
            passData: dynamicLinkdata.toString(),
          );
        },
      ));
      return true;
    } else {
      return false;
    }
  }
  void onShare({BuildContext? context, String? dynamicLink}) async {
    final box = context!.findRenderObject() as RenderBox?;
    Share.share(
      '$dynamicLink',
      subject: 'sharing zeed live link',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}

class AppConstants {
  static String bundleIdIOS = 'Your Bundle Id IOS';
  static String packageNameAndroid = 'Your android Package name';
  static String dynamicLinksDomain = 'from firebase console';
}

