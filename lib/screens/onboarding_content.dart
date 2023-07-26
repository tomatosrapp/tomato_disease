import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Identify",
    image: "assets/images/1.png",
    desc:
        "Know the problem through taking a photo of your plant, specifically the concerned area",
  ),
  OnboardingContents(
    title: "Survivability",
    image: "assets/images/2.png",
    desc: "Predict the probabilty of the plant’s survival",
  ),
  OnboardingContents(
    title: "Treatment",
    image: "assets/images/3.png",
    desc:
        "Know the treatment your plant needs to receive to avoid plant diseases/pests",
  ),
];
