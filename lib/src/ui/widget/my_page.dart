import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final Widget? child;
  final Widget? appbar;
  final bool unforcus;
  final bool statusBarDark;
  final Color? appbarColor;
  final Widget? bottomNavigationBar;
  final Widget? floatActionButton;
  final bool useScroll;
  final bool popscope;
  final bool resizeToAvoidBottomInset;
  const MyPage({
    super.key,
    this.child,
    this.appbar,
    this.unforcus = false,
    this.statusBarDark = true,
    this.appbarColor,
    this.bottomNavigationBar,
    this.floatActionButton,
    this.useScroll = true,
    this.popscope = true,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: (popscope),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatActionButton,
        appBar: AppBar(
          forceMaterialTransparency: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: appbarColor ?? Colors.white,
          elevation: 0,
          bottomOpacity: 0,
          toolbarHeight: 0,
        ),
        body: GestureDetector(
          onTap: (unforcus)
              ? () {
                  FocusScope.of(context).unfocus();
                }
              : null,
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appbar
                appbar ?? const SizedBox.shrink(),
                //frame
                Expanded(
                  child: useScroll
                      ? SingleChildScrollView(
                          child: child ?? const SizedBox.shrink())
                      : child ?? const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
