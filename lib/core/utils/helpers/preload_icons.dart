import 'package:flutter/material.dart';
import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> preloadSvgIcons(BuildContext context) async {
  // Use a post-frame callback to wait until after the initial build
  final overlay = Overlay.of(context);

  // Create an overlay entry with SVGs rendered off-screen
  final overlayEntry = OverlayEntry(
    builder: (context) => Offstage(
      child: Column(
        children: Assets.preloadIcons
            .map((iconPath) => SvgPicture.asset(iconPath))
            .toList(),
      ),
    ),
  );

  // Insert the overlay entry to preload the SVGs
  overlay.insert(overlayEntry);

  // Allow some time for assets to load, then remove the overlay
  await Future.delayed(const Duration(milliseconds: 600));
  overlayEntry.remove();
}
