import 'package:firebase_dynamic_linking/dynamic_links_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
      final AppLifecycleState? state = WidgetsBinding.instance.lifecycleState;
      if (state == AppLifecycleState.resumed) {
        DynamicLinkServices()
            .initDynamicLink(
          context: context,
        )
            .then((value) async {
          if (value == false) {
            // your have opened app from dynamic link
          } else if (value == true) {
            // not from dynamic link
          }
        });
      }

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Update the _isInForeground variable based on the app's new lifecycle state
    if (state == AppLifecycleState.resumed) {
      // Handle dynamic links if the app is resumed from the background
      // Share.share(
      //   'appstate is resumed:$state',
      //   subject: 'sharing zeed live link',
      // );
    } else {
      // Handle dynamic links if the app is not resumed from the background
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
  void _incrementCounter() {
    
  }
}
