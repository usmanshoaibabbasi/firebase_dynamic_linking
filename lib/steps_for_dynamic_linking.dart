

// ** Steps
// 1: Integrate Firebase in your Flutter App and add necessary packages like firebase_core etc

// 2: Enable dynamic linking from firebase console it will be available in left side drawer of console inside Engage and copy link from it and save it

// 3: add firebase_dynamic_links package

// The below function is written in dynamic_links_services use that function inside it replace your package name and bundle identifier

// 4: DynamicLinkServices().generateProductDeepLink(productId: 'your Prodict id',);

// 5: step 4 will return you link of product

// 6: use share package to share it or copy it

// The below function is written in dynamic_links_services use that function

// 7: DynamicLinkServices().onShare(context: context, dynamicLink: 'yourLink);

// Now To Listen To dynamic Link

// 8: Extend your widget with 'with WidgetsBindingObserver'

// 9: extend MyHomePage with WidgetsBindingObserver and  use initState() from MyHomePage

// 10 in initState() a function from DynamicLinkServices().initDynamicLink(); is called

// 10: use dispose() to remove observer in MyHomePage

// 11: use didChangeAppLifecycleState() from MyHomePage to check state of app if resume from background and handle dynamic link