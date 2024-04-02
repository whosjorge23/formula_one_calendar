import 'dart:math';
import 'package:flutter/material.dart';

class CircuitCard extends StatelessWidget {
  const CircuitCard({
    super.key,
    required this.circuitName,
    required this.circuitPlace,
    required this.circuitTrackName,
    required this.trackPic,
    required this.trackSchedule,
    required this.circuitRound,
  });

  final String circuitName;
  final String circuitPlace;
  final String circuitTrackName;
  final String trackPic;
  final String trackSchedule;
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
              right: 8, // Adjust the car's position if necessary
              bottom: 8,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Image.network(
                  trackPic,
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
                  Text(
                    circuitName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    circuitPlace,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    trackSchedule,
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
                    circuitTrackName,
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
