import 'package:flutter/material.dart';

class SmallBar extends StatelessWidget {
  const SmallBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedColorOpacity,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  final List<SmallBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final double? selectedColorOpacity;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        for (final item in items)
          TweenAnimationBuilder<double>(
            tween: Tween(
              end: items.indexOf(item) == currentIndex ? 1.2 : 1.0,
            ),
            curve: curve,
            duration: duration,
            builder: (context, t, _) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    child: Row(
                      children: [
                        ClipRect(
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            height: 68,
                            child: Align(
                              widthFactor: t,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 5.0),
                                    child: Align(
                                      child: IconTheme(
                                        data: IconThemeData(
                                          size: 22,
                                          color: items.indexOf(item) ==
                                                  currentIndex
                                              ? const Color.fromRGBO(
                                                  20, 220, 220, 1)
                                              : const Color.fromRGBO(
                                                  245, 245, 245, 1),
                                        ),
                                        child:
                                            items.indexOf(item) == currentIndex
                                                ? item.activeIcon ?? item.icon
                                                : item.icon,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
      ],
    ));
  }
}

class SmallBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final Color? selectedColor;
  final Color? unselectedColor;

  SmallBarItem({
    required this.icon,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
