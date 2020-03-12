import 'package:flutter/material.dart';
import '../utils/utils.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final String image;
  final double imageSize;
  final double fontSize;
  final FontWeight fontWeight;

  const EmptyState({
    Key key,
    @required this.message,
    this.image = AppImages.empty,
    this.imageSize = 400.0,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: imageSize,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              message.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.display1.color,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
