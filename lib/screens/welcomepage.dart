import 'package:flutter/material.dart';
import 'package:mentorow/screens/base_screen.dart';

// ignore: camel_case_types
class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learn Something",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "New & Creative..",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'With ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Mentorow',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    TextSpan(
                      text:
                          ', the journey of learning is as exciting as the destination. Embark on a quest to unlock your potential, develop new skills, and unleash your creativity. Join us today and embark on an enriching journey of discovery, growth, and inspiration!',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BaseScreen()),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Take the First step",
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  )),
              const SizedBox(
                height: 100,
              ),
              Image.asset('assets/icons/readme.png')
            ],
          ),
        ),
      ),
    );
  }
}
