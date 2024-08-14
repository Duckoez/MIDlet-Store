import 'package:flutter/material.dart';

/// A enumeration of all game tags present in the application.
enum Tag {
  threed(
    icon: Icons.threed_rotation_rounded,
    name: '3D',
  ),
  action(
    name: 'Action',
    icon: Icons.electric_bolt_rounded,
  ),
  adventure(
    name: 'Adventure',
    icon: Icons.explore_rounded,
  ),
  casual(
    name: 'Casual',
    icon: Icons.house_rounded,
  ),
  football(
    name: 'Football',
    icon: Icons.sports_soccer_rounded,
  ),
  openWorld(
    name: 'Open World',
    icon: Icons.navigation_rounded,
  ),
  platform(
    name: 'Platform',
    icon: Icons.directions_run,
  ),
  pointAndClick(
    name: 'Point & Click',
    icon: Icons.touch_app_rounded,
  ),
  puzzle(
    name: 'Puzzle',
    icon: Icons.extension_rounded,
  ),
  racing(
    name: 'Racing',
    icon: Icons.motorcycle_rounded,
  ),
  shooter(
    name: 'Shooter',
    icon: Icons.local_fire_department_rounded,
  ),
  sports(
    name: 'Sports',
    icon: Icons.sports_rounded,
  ),
  stealth(
    name: 'Stealth',
    icon: Icons.noise_aware_rounded,
  ),
  terror(
    name: 'Terror',
    icon: Icons.church_rounded,
  ),
  zombies(
    name: 'Zombies',
    icon: Icons.coronavirus_rounded,
  );

  const Tag({
    required this.icon,
    required this.name,
  });

  final IconData icon;

  final String name;
}