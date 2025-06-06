import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:threadsposter/services/navigation.dart';
import 'package:threadsposter/models/data_lists.dart';
import 'package:threadsposter/widgets/home/home_page.dart';

class Dailypop extends StatelessWidget {
  const Dailypop({
    super.key,
    required this.screenWidth,
    required this.index,
  });

  final double screenWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    final toneOptions = Provider.of<ToneProvider>(context, listen: false).tones;
    
    return GestureDetector(
      onTap: () {
        final navigationService = Provider.of<NavigationService>(context, listen: false);
        if(index == toneOptions.length - 1) {
          toneOptions[index].name = '@$customTone';
        }
        navigationService.goPost(tone: toneOptions[index].name);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
            'assets/images/${toneOptions[index].id}.png',
          width: screenWidth,
          height: screenWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}