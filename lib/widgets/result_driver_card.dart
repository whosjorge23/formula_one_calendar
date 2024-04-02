import 'dart:math';
import 'package:flutter/material.dart';

class ResultDriverCard extends StatelessWidget {
  const ResultDriverCard({
    super.key,
    required this.driverName,
    required this.teamName,
    required this.pointsDriver,
    required this.driverCardPic,
    required this.helmetPic,
    required this.driverStatus,
    required this.circuitRound,
  });

  final String driverName;
  final String teamName;
  final String pointsDriver;
  final String driverCardPic;
  final String helmetPic;
  final String driverStatus;
  final String circuitRound;

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
              right: 8, // Adjust the car's position if necessary
              top: 8,
              child: Text(
                circuitRound,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              right: 0, // Adjust the car's position if necessary
              bottom: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(0),
                child: Image.network(
                  driverCardPic,
                  width: 100,
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
                  Row(
                    children: [
                      Text(
                        driverName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Image.network(
                          helmetPic,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    teamName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    driverStatus,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pointsDriver,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
