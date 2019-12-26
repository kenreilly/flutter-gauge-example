import 'dart:math';
import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {

	GaugePainter({ @required this.percent }) : super();

	final double percent;

	@override
	void paint(Canvas canvas, Size size) {

		Color color = Color.lerp(Colors.green, Colors.red, percent);

		Paint circleBrush = new Paint()
			..strokeWidth = 2.0
			..color = Colors.indigo[400].withOpacity(0.4)
			..style = PaintingStyle.stroke;

		Paint elapsedBrush = new Paint()
			..strokeWidth = 2.0
			..color = color.withOpacity(0.8)
			..style = PaintingStyle.stroke;

		Offset center = new Offset(size.width / 2, size.height / 2);
		double radius = min(size.width / 2.2, size.height / 2.2);
		double angle = 2 * pi * percent;

		Rect rect = new Rect.fromCircle(center: center,radius: radius);

		canvas.drawCircle(center, radius, circleBrush);
		canvas.drawArc(rect, -pi/2, angle, false, elapsedBrush);
	}

	@override
  	bool shouldRepaint(CustomPainter oldDelegate) => true;
}