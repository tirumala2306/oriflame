import 'package:flutter/material.dart';

/// Spring physics matching Figma smart animate:
/// mass: 1, stiffness: 177.8, damping: 20
class ReelsPagePhysics extends PageScrollPhysics {
  const ReelsPagePhysics({super.parent});

  @override
  ReelsPagePhysics applyTo(ScrollPhysics? ancestor) {
    return ReelsPagePhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 1,
        stiffness: 177.8,
        damping: 20,
      );
}
