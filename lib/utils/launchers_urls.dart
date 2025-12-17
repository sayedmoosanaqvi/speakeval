import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchersUrls extends StatelessWidget {
  const LaunchersUrls({super.key});

  // static Future<void> sendEmail({
  //   required String toEmail,
  //   required String subject,
  //   required String body,
  // }) async {
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: 'toEmail',
  //     queryParameters: {'subject': subject, 'body': body},
  //   );
  //   if (await canLaunchUrl(emailUri)) {
  //     await launchUrl(emailUri);
  //   } else {
  //     throw 'can not launch';
  //   }
  // }

  static Future<void> openDialer(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch dialer for $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}