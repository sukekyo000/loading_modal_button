import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_modal_button/loading_modal_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool material3 = true;
  Color material3Color = Colors.deepPurple;
  MaterialColor material2Color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: material3,
        colorSchemeSeed: material3 ? material3Color : null,
        primarySwatch: material3 ? null : material2Color,
      ),
      home: MyHomePage(
        floatingActionButtonOnPressed: () => setState(() {
          material3 = !material3;
        }),
        material3: material3,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.floatingActionButtonOnPressed,
    required this.material3,
  });
  final VoidCallback floatingActionButtonOnPressed;
  final bool material3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Modal Button'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: floatingActionButtonOnPressed,
        label:
            Text(material3 ? 'Change To Material 2' : 'Change To Material 3'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ..._defaultButtonSection(),
          ..._iconButtonSection(),
          ..._callBackSection(context),
          ..._customLoadingSection(),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  List<Widget> _defaultButtonSection() {
    return [
      _sectionTitle('Default Buttons'),
      LoadingModalButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        buttonChild: const Text('Elevated Button'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        buttonType: ButtonType.outlined,
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        buttonChild: const Text('Outlined Button'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        buttonType: ButtonType.text,
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        buttonChild: const Text('Text Button'),
      ),
      const SizedBox(
        height: 20,
      ),
    ];
  }

  List<Widget> _iconButtonSection() {
    return [
      _sectionTitle('Icon Button'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LoadingModalButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            iconChild: const Icon(
              Icons.flutter_dash,
            ),
          ),
          LoadingModalButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            iconChild: const Icon(
              Icons.flutter_dash,
            ),
            iconButtonWithModalStyle: const IconButtonWithModalStyle(
              iconSize: 35,
              color: Colors.red,
            ),
          ),
          LoadingModalButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            iconChild: const Icon(
              Icons.flutter_dash_rounded,
            ),
            iconButtonWithModalStyle: const IconButtonWithModalStyle(
              iconSize: 45,
              color: Colors.blue,
            ),
          ),
          LoadingModalButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            iconChild: const Icon(
              Icons.flutter_dash_sharp,
            ),
            iconButtonWithModalStyle: const IconButtonWithModalStyle(
              iconSize: 55,
              color: Colors.green,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ];
  }

  List<Widget> _callBackSection(BuildContext context) {
    return [
      _sectionTitle('Call back after async function'),
      LoadingModalButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        afterAsync: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NextPage(),
            ),
          );
        },
        buttonChild: const Text('Next Page After 1 second'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        buttonType: ButtonType.outlined,
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        afterAsync: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('SnackBar'),
            ),
          );
        },
        buttonChild: const Text('SnackBar After 1 second'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        buttonType: ButtonType.text,
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        afterAsync: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('AlertDialog'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        buttonChild: const Text('AlertDialog After 1 second'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        afterAsync: () {
          showDialog(
            context: context,
            builder: (_) => const SimpleDialog(
              title: Text('SimpleDialog'),
              contentPadding: EdgeInsets.all(24),
              children: [
                Text('Child 1'),
                Text('Child 2'),
                Text('Child 3'),
              ],
            ),
          );
        },
        buttonChild: const Text('SimpleDialog After 1 second'),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        buttonType: ButtonType.outlined,
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        afterAsync: () {
          showCupertinoDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: const Text('CupertinoAlertDialog'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        buttonChild: const Text('CupertinoAlertDialog After 1 second'),
      ),
      const SizedBox(
        height: 20,
      ),
    ];
  }

  List<Widget> _customLoadingSection() {
    return [
      _sectionTitle('Custom Loading Widget'),
      LoadingModalButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        buttonChild: const Text('Red Color Circle Progress Indicator'),
        customLoadingWidget: const CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      LoadingModalButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        buttonType: ButtonType.outlined,
        buttonChild: const Text('Linear Progress Indicator'),
        customLoadingWidget: const LinearProgressIndicator(),
      ),
      const SizedBox(
        height: 20,
      ),
    ];
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text('Next Page'),
      ),
    );
  }
}
