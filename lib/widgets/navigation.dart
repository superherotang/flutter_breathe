import 'package:flutter/material.dart';

import 'icon.dart';

class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    var theme = Theme.of(context).bottomNavigationBarTheme;
    for (var i = 0; i < items.length; i++) {
      var labelStyle = currentIndex == i
          ? theme.selectedLabelStyle
          : theme.unselectedLabelStyle;
      var color = currentIndex == i
          ? theme.selectedItemColor
          : theme.unselectedItemColor;
      var gap = (items.length / 2).ceil();
      if (gap == i) ws.add(const SizedBox(width: 60));
      ws.add(Expanded(
        child: MaterialButton(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          onPressed: () => onTap(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgIconWidget(
                    items[i].icon,
                    size: 24,
                    color: currentIndex != i ? color : null,
                  ),
                  Positioned(
                    //提示

                    left: 15,
                    top: -4,
                    child: items[i].count > 0
                        ? Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            height: 16,
                            constraints: const BoxConstraints(
                              minWidth: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              items[i].count <= 99
                                  ? items[i].count.toString()
                                  : '99+',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                items[i].label,
                maxLines: 1,
                style: labelStyle?.copyWith(color: color),
              ),
            ],
          ),
        ),
      ));
    }
    return BottomAppBar(
      color: theme.backgroundColor,
      shape: CustomNotchedShape(context), // 中间凸起的形状
      notchMargin: 10, //凸的尺寸
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(children: ws),
      ),
    );
  }
}

class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

class CustomNotchedShape extends NotchedShape {
  final BuildContext context;
  const CustomNotchedShape(this.context);

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    const radius = 40.0;
    const lx = 20.0;
    const ly = 8;
    const bx = 10.0;
    const by = 20.0;
    var x = (MediaQuery.of(context).size.width - radius) / 2 - lx;
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(x, host.top)
      // ..lineTo(x += lx, host.top - ly)
      ..quadraticBezierTo(x + bx, host.top, x += lx, host.top - ly)
      // ..lineTo(x += radius, host.top - ly)
      ..quadraticBezierTo(
          x + radius / 2, host.top - by, x += radius, host.top - ly)
      // ..lineTo(x += lx, host.top)
      ..quadraticBezierTo((x += lx) - bx, host.top, x, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom);
  }
}
