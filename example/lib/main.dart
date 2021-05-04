import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macos_ui/src/library.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return MacosApp(
          title: 'macos_ui example',
          theme: MacosThemeData.light(),
          darkTheme: MacosThemeData.dark(),
          themeMode: appTheme.mode,
          debugShowCheckedModeBanner: false,
          home: Demo(),
        );
      },
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  bool value = false;

  double sliderValue = 0;
  double ratingValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      sidebar: Center(
        child: Text('Sidebar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PushButton(
            buttonSize: ButtonSize.small,
            child: Text('Button'),
            onPressed: () {},
          ),
          RadioButton(
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
          Checkbox(
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
          HelpButton(
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CapacityIndicator(
              value: sliderValue,
              onChanged: (v) => setState(() => sliderValue = v),
              discrete: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CapacityIndicator(
              value: sliderValue,
              onChanged: (v) => setState(() => sliderValue = v),
            ),
          ),
          RatingIndicator(
            value: ratingValue,
            onChanged: (v) => setState(() => ratingValue = v),
          ),
          RelevanceIndicator(value: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(CupertinoIcons.search),
              ),
              placeholder: 'PLACE A TEXT HERE NEHEEHEH',
              /// If both suffix and clear button mode is provided,
              /// suffix will override the clear button.
              // suffix: Text('SUFFIX'),
              clearButtonMode: OverlayVisibilityMode.always,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField.borderless(
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(CupertinoIcons.search),
              ),
              placeholder: 'PLACE A TEXT HERE NEHEEHEH',
              /// If both suffix and clear button mode is provided,
              /// suffix will override the clear button.
              suffix: Text('SUFFIX'),
              // clearButtonMode: OverlayVisibilityMode.always,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
