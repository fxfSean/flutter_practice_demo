
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_demo/src/assets/widget/fixed_appbar.dart';

class AssetsPicker extends StatelessWidget {
  final Color themeColor;
  SystemUiOverlayStyle get overlayStyle => SystemUiOverlayStyle.dark;

  ThemeData get theme => AssetsPicker.themeData(themeColor);

  const AssetsPicker({Key? key, Color? themeColor})
      : assert(themeColor == null),
        themeColor = themeColor ?? const Color(0xff00bc56), super(key: key);


  static ThemeData themeData(Color themeColor) {
    return ThemeData.dark().copyWith(
      buttonColor: themeColor,
      primaryColor: Colors.grey[900],
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: Colors.grey[900],
      primaryColorDark: Colors.grey[900],
      accentColor: themeColor,
      accentColorBrightness: Brightness.dark,
      canvasColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[900],
      bottomAppBarColor: Colors.grey[900],
      cardColor: Colors.grey[900],
      highlightColor: Colors.transparent,
      toggleableActiveColor: themeColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: themeColor,
        selectionColor: themeColor.withAlpha(100),
        selectionHandleColor: themeColor,
      ),
      indicatorColor: themeColor,
      appBarTheme: const AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0,
      ),
      colorScheme: ColorScheme(
        primary: Colors.grey[900]!,
        primaryVariant: Colors.grey[900]!,
        secondary: themeColor,
        secondaryVariant: themeColor,
        background: Colors.grey[900]!,
        surface: Colors.grey[900]!,
        brightness: Brightness.dark,
        error: const Color(0xffcf6679),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.black,
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return FixedAppBarWrapper(
        appBar: FixedAppBar(
          actions: confirmButton(context),
        ),
        body: Container());
  }

  List<Widget> confirmButton(BuildContext context) {
    return [MaterialButton(
        minWidth: 20,
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: theme.dividerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3)
        ),
        child: Text('确认', style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: theme.textTheme.caption?.color
        ),),
        onPressed: () {
    })];
  }

  Widget androidLayout(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          appbar(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(child: Theme(
      data: theme,
      child: Stack(
        children: [
          androidLayout(context),
        ],
      ),

    ), value: overlayStyle);
  }
}
