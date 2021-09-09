
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_demo/src/assets/widget/fixed_appbar.dart';
import 'package:flutter_practice_demo/src/constants/constants.dart';

class AssetsPicker extends StatelessWidget {
  final Color themeColor;
  SystemUiOverlayStyle get overlayStyle => SystemUiOverlayStyle.dark;

  ThemeData get theme => AssetsPicker.themeData(themeColor);

  AssetsPicker({Key? key, Color? themeColor})
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
          title: pathEntrySelector(context),
          actions: confirmButton(context),
        ),
        body: Container());
  }

  Widget pathEntrySelector(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5
        ),
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: theme.dividerColor
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Recent', style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.iconTheme.color!.withOpacity(0.5)
                  ),
                  child: Icon(Icons.keyboard_arrow_down,size: 20,
                    color: theme.colorScheme.primary,)),
            )
          ],
        ),
      ),
    );
  }

  ValueNotifier<bool> _selectListenable = ValueNotifier(false);

  List<Widget> confirmButton(BuildContext context) {
    return [ValueListenableBuilder(
      valueListenable: _selectListenable,
      builder: (BuildContext context,bool value, Widget? child) {
        return  MaterialButton(
          minWidth: 20,
          padding: EdgeInsets.symmetric(horizontal: 12),
          color: value ? themeColor : theme.dividerColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)
          ),
          child: Text(value
          ? '${Constants.textDelegate.confirm}' '(1/2)'
              : '${Constants.textDelegate.confirm}', style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: value
          ? theme.textTheme.bodyText1?.color
              : theme.textTheme.caption?.color,
          ),),
          onPressed: () {
          _selectListenable.value = !_selectListenable.value;
        },
    );

      }
    )];
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
