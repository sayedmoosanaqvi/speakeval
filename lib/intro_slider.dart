// lib/simple_intro_slider.dart
import 'package:flutter/material.dart';

class SimpleIntroSlider extends StatefulWidget {
  const SimpleIntroSlider({super.key});

  @override
  State<SimpleIntroSlider> createState() => _SimpleIntroSliderState();
}

class _SimpleIntroSliderState extends State<SimpleIntroSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data for your slider pages
  final List<Map<String, String>> sliderPages = [
    {
      'title': 'Welcome to SpeakEval!',
      'description': 'Improve your English speaking skills with AI-powered evaluations.',
      'image': 'assets/images/toefl_logo.png', // Remember to add these to your pubspec.yaml assets!
    },
    {
      'title': 'Practice and Get Feedback',
      'description': 'Record yourself, get instant grammar, pronunciation, and fluency scores.',
      'image': 'assets/images/toefl.png',
    },
    {
      'title': 'Learn and Grow',
      'description': 'Access valuable learning resources and track your progress over time.',
      // 'image': 'assets/learn_slide.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Optional: Add a listener to update page indicator
    _pageController.addListener(() {
      int? nextPage = _pageController.page?.round();
      if (nextPage != null && nextPage != _currentPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Fixed height for your slider area
          child: PageView.builder(
            controller: _pageController,
            itemCount: sliderPages.length,
            itemBuilder: (context, index) {
              final page = sliderPages[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                 color: Colors.grey[200] ,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (page['image'] != null && page['image']!.isNotEmpty)
                      Image.asset(
                        page['image']!,
                        height: 80, // Adjust image height as needed
                        fit: BoxFit.contain,
                      ),
                    const SizedBox(height: 10),
                    Text(
                      page['title']!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        page['description']!,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10), // Space between slider and indicators

        // Manual Page Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(sliderPages.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: _currentPage == index ? 24.0 : 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.black : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ],
    );
  }
}