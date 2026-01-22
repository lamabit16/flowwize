import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  // ألوان التطبيق الرسمية
  final Color hotPurple = const Color(0xFFA020F0);
  final Color deepBackground = const Color(0xFF0F0C29);
  final Color lightMauve = const Color(0xFFD1C4E9);

  // توليد 30 فقاعة للشهر
  List<bool> bubbles = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    int completedCount = bubbles.where((e) => e).length;

    return Scaffold(
      backgroundColor: deepBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "FlowWize Habits",
                style: TextStyle(
                  color: hotPurple,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "إيقاعك الخاص.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "لقد أنجزت $completedCount من أصل 30 خطوة هذا الشهر.",
                style: TextStyle(color: lightMauve, fontSize: 16),
              ),
              const SizedBox(height: 40),

              // حاوية العادة
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, color: hotPurple, size: 20),
                        const SizedBox(width: 10),
                        const Text(
                          "عادة القراءة العميقة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            setState(() {
                              bubbles[index] = !bubbles[index];
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.elasticOut,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: bubbles[index]
                                  ? LinearGradient(
                                      colors: [
                                        hotPurple,
                                        const Color(0xFFFF00FF),
                                      ],
                                    )
                                  : null,
                              color: bubbles[index]
                                  ? null
                                  : Colors.white.withOpacity(0.1),
                              boxShadow: bubbles[index]
                                  ? [
                                      BoxShadow(
                                        color: hotPurple.withOpacity(0.5),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : [],
                              border: Border.all(
                                color: bubbles[index]
                                    ? Colors.white.withOpacity(0.5)
                                    : hotPurple.withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                            child: bubbles[index]
                                ? const Icon(
                                    Icons.bolt,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
