import 'package:flutter/material.dart';

void navigatePushTo({
  required BuildContext context,
  required Widget navigateTo,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo));
}

void navigatePushToAndFinish({
  required BuildContext context,
  required Widget navigateTo,
}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => navigateTo), (route) => false);
}
