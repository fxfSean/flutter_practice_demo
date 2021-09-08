import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FixedAppBar extends StatelessWidget {
  final List<Widget>? actions;

  const FixedAppBar({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        children: [
          BackButton(),
          PositionedDirectional(
              top: 0,
              bottom: 0,
              start: kToolbarHeight,
              end: kToolbarHeight,
              child: Align(
                alignment: Alignment.centerLeft,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 23),
                  child: Text('title'),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
            ),
          )),
          if (actions != null)
            PositionedDirectional(
                end: 0,
                height: kToolbarHeight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Row(
              children: actions!,
            ),
                ))
        ],
      ),
    );
  }
}

class FixedAppBarWrapper extends StatelessWidget {
  final Widget body;
  final Widget appBar;

  const FixedAppBarWrapper({Key? key, required this.body, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            child: body),
        Positioned.fill(
          child: appBar,
          bottom: null,
        )
      ],
    );
  }
}
