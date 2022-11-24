import 'package:flutter/material.dart';

class SliCard extends StatefulWidget {
  final double width;
  final double topCardHeight;
  final double bottomCardHeight;
  final double borderRadius;
  final Widget topCardWidget;
  final Widget bottomCardWidget;
  final bool slimeEnabled;

  const SliCard({
    Key? key,
    this.width = 200,
    this.topCardHeight = 100,
    this.bottomCardHeight = 140,
    this.borderRadius = 20,
    required this.topCardWidget,
    required this.bottomCardWidget,
    this.slimeEnabled = true,
  }) : super(key: key);

  @override
  SliCardState createState() => SliCardState();
}

class SliCardState extends State<SliCard> with TickerProviderStateMixin {
  late bool isSeperated;
  late double bottomDimension;
  late double initialBottomDimension;
  late double finalBottomDimension;
  late double gap;
  late double gapInitial;
  late double gapFinal;
  late double x;
  late double y;
  late String activeAnimation;
  late Widget topCardWidget;
  late Widget bottomCardWidget;

  late Animation<double> arrowAnimation;
  late AnimationController arrowAnimController;

  void action() {
    if (isSeperated) {
      isSeperated = false;
      arrowAnimController.reverse();
      gap = gapInitial;
      bottomDimension = initialBottomDimension;
    } else {
      isSeperated = true;
      arrowAnimController.forward();
      gap = gapFinal;
      bottomDimension = finalBottomDimension;
    }

    activeAnimation = (activeAnimation == 'Idle') ? 'Action' : 'Idle';
  }

  @override
  void initState() {
    super.initState();
    isSeperated = false;
    activeAnimation = 'Idle';
    initialBottomDimension = 100;
    finalBottomDimension = widget.bottomCardHeight;
    bottomDimension = initialBottomDimension;
    topCardWidget = widget.topCardWidget;
    bottomCardWidget = widget.bottomCardWidget;
    arrowAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    arrowAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(arrowAnimController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    x = widget.borderRadius;
    y = widget.borderRadius;
    gapInitial = 30;
    gapFinal = ((widget.topCardHeight + x - widget.width / 3.2 + 45) > 0)
        ? (widget.topCardHeight + x - widget.width / 3.2 + 45)
        : 2 * x + 45;
    gap = gapInitial;
  }

  @override
  void didUpdateWidget(SliCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      topCardWidget = widget.topCardWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          action();
        });
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 1800),
                height: gap,
                curve: Curves.elasticOut,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: bottomDimension,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color.fromRGBO(238, 242, 243, 1)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: (isSeperated) ? 1.0 : 0,
                      child: bottomCardWidget,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: widget.topCardHeight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromRGBO(238, 242, 243, 1)),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: topCardWidget,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: ((widget.topCardHeight - 2 * 5 / 4) > 0)
                    ? (widget.topCardHeight - 2 * 5 / 4)
                    : 0,
              ),
              Container(
                height: 25,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: RotationTransition(
                  turns: arrowAnimation,
                  child: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
