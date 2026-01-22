import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 25 * 60; // 25 دقيقة (أسلوب بومودورو)
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _timer?.cancel();
          }
        });
      });
    }
    setState(() => _isRunning = !_isRunning);
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0C29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "وقت التركيز",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 50),
            // حلقة الطاقة
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: _seconds / (25 * 60),
                    strokeWidth: 8,
                    color: const Color(0xFFA020F0),
                    backgroundColor: Colors.white10,
                  ),
                ),
                Text(
                  _formatTime(_seconds),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: _startTimer,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFA020F0)),
                  color: _isRunning
                      ? Colors.transparent
                      : const Color(0xFFA020F0).withOpacity(0.2),
                ),
                child: Text(
                  _isRunning ? "إيقاف" : "ابدأ الآن",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
