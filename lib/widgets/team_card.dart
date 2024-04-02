import 'dart:math';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.teamColor,
    required this.teamName,
    required this.teamNationality,
    required this.teamPowerUnit,
    required this.teamLogo,
    required this.teamCar,
    required this.teamDrivers,
  });

  final Color teamColor;
  final String teamName;
  final String teamNationality;
  final String teamPowerUnit;
  final String teamLogo;
  final String teamCar;
  final String teamDrivers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF1C2023), // Replace with the exact color
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0, // Adjust the car's position if necessary
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                width: 40,
                height: 40,
                child: Image.network(
                  teamLogo,
                  width: 50,
                ),
              ),
            ),
            Positioned(
              right: -90, // Adjust the position to make sure it's aligned correctly
              bottom: 0,
              child: CustomPaint(
                size: const Size(280, 180), // New size for the trapezoid
                painter: TrapezoidCustomPainter(teamColor),
              ),
            ),
            Positioned(
              right: -70, // Adjust the car's position if necessary
              bottom: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Image.network(
                  teamCar,
                  width: 300,
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teamName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    teamNationality,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    teamPowerUnit,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    teamDrivers,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidCustomPainter extends CustomPainter {
  const TrapezoidCustomPainter(this.teamColor);

  final Color teamColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = teamColor.withOpacity(0.7) // Color of the trapezoid
      ..style = PaintingStyle.fill; // Filling

    Path path = Path();
    // Adjust the trapezoid's size and shape by modifying these points
    path.moveTo(0, size.height); // Bottom left point
    path.lineTo(size.width * 0.25, size.height * 0.5); // Top left point, adjusted

    path.lineTo(size.width, size.height * 0.5); // Top right point, adjusted
    path.lineTo(size.width, size.height); // Bottom right point
    path.close(); // Return to the starting point

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
