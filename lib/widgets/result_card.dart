import 'dart:math';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:gap/gap.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.raceName,
    required this.circuitName,
    required this.teamName,
    required this.trackPic,
    required this.driverName,
    required this.circuitRound,
    required this.teamCar,
  });

  final String raceName;
  final String circuitName;
  final String teamName;
  final String trackPic;
  final String driverName;
  final String circuitRound;
  final String teamCar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF1C2023),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 8,
              top: 8,
              child: Text(
                circuitRound,
                style: appTextStyle.getQuicksand().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: appColors.white,
                    ),
              ),
            ),
            Positioned(
              right: 8,
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
                    raceName,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(5),
                  Text(
                    driverName,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(10),
                  Text(
                    teamName,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 16,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(10),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(0),
                    child: Image.network(
                      teamCar,
                      width: 150,
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
