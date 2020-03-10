import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    final leftIcon = Positioned(
      child: Opacity(
        child: Icon(
          Icons.wb_sunny,
          size: 20.0,
          color: CustomColors.switcherDarkColor,
        ),
        opacity: widget.value ? 1 : 0,
      ),
      left: 4.0,
      bottom: 2.0,
      top: 2.0,
    );

    final rightIcon = Positioned(
      child: Opacity(
        child: Icon(
          Icons.brightness_3,
          size: 20.0,
          color: CustomColors.switcherLightColor,
        ),
        opacity: widget.value ? 0 : 1,
      ),
      right: 4.0,
      bottom: 2.0,
      top: 2.0,
    );

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Stack(
            children: <Widget>[
              Container(
                width: 58.0,
                height: 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: !widget.value
                      ? Colors.black
                      : CustomColors.switcherLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AnimatedContainer(
                    alignment: widget.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.value
                            ? CustomColors.switcherDarkColor
                            : CustomColors.switcherLightColor,
                      ),
                    ),
                    duration: Duration(milliseconds: 150),
                  ),
                ),
              ),
              leftIcon,
              rightIcon
            ],
          ),
        );
      },
    );
  }
}
