import 'package:dream_sports_user/constants/const_variable.dart';
import 'package:dream_sports_user/screens/class/remove_glow.dart';
import 'package:dream_sports_user/widgets/free_widget.dart';
import 'package:dream_sports_user/widgets/screens_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    logocontainer(height: customsize.height * 0.10),
                    headingtext(heading: 'Dream Sports'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Privacy Policy for Dream Sports Application',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                sheight,
                sheight,
                const Text(
                  'Last Updated : 08 November 2023',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                fieldtext('1. Introduction'),
                sheight,
                const Text(
                  '                     Welcome to Dream Sports! This privacy policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information. Protecting your privacy is of utmost importance to us. By using our application, you consent to the practices described in this privacy policy.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                fieldtext('2. Information We Collect'),
                sheight,
                const Text(
                  '2.1 Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                sheight,
                const Text(
                  'We may collect the following types of personal information:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sheight,
                const Text(
                  "Yure name and contact details (email address and phone number)for communication and to provide customer support.we collect your phone number for chating othe users.Profile information that you choose to share, such as your profile picture, username, and any additional details you provide in your profile.Transaction information, including payment details for booking turfs.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sheight,
                sheight,
                const Text(
                  '2.2 Non-Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                sheight,
                const Text(
                  'We may also collect non-personal information, such as device information, location information, and usage statistics, to improve our application and services.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sheight,
                sheight,
                sheight,
                fieldtext('3. How We Use Your Information'),
                sheight,
                const Text(
                  'We use your information for the following purposes:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sheight,
                const Text(
                  ' - To provide and manage turf booking services.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To communicate with you regarding bookings, support, updates, and promotional offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To chat with other users',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To personalize your experience by displaying your profile information.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To process payments securely.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To improve our application, services, and user experience.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                fieldtext('4. Information Sharing'),
                sheight,
                const Text(
                  'We do not share your personal information with third parties, except in the following cases:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sheight,
                const Text(
                  ' - With your explicit consent.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - To comply with legal obligations.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' -To protect our rights, privacy, safety, or property, or that of our users and the public.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  ' - In connection with the sale, merger, or acquisition of all or part of our company.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                fieldtext('5. Security'),
                sheight,
                const Text(
                  'We take the security of your personal information seriously and employ appropriate security measures to protect it.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                fieldtext('6. Your Choices and Rights'),
                sheight,
                const Text(
                  'You have the right to access, correct, or delete your personal information. You can also unsubscribe from marketing communications. Please contact us at dreamsportsapplication@gmail.com for any data-related requests.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                fieldtext('7. Updates to this Privacy Policy'),
                sheight,
                const Text(
                  'We may update this privacy policy to reflect changes to our information practices. We encourage you to review this policy periodically.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                fieldtext('8. Contact Us'),
                sheight,
                const Text(
                  'If you have any questions, concerns, or requests related to your privacy, please contact us at dreamsportsapplication@gmail.com.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VERSION',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 112, 112, 112)),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '0.0.1',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                sheight,
                sheight,
                sheight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
