import 'dart:math';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:gap/gap.dart';

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
                    circuitName,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(2),
                  Text(
                    circuitPlace,
                    style: appTextStyle.getQuicksand().copyWith(
                          color: appColors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                  ),
                  const Gap(5),
                  Text(
                    trackSchedule,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(10),
                  Text(
                    circuitTrackName,
                    style: appTextStyle.getQuicksand().copyWith(
                          fontSize: 16,
                          color: appColors.white,
                        ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
