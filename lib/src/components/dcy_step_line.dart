import 'package:flutter/material.dart';

class DcyStepLine extends StatelessWidget {
  const DcyStepLine({
    required this.step,
    super.key,
  });

  final int step;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: const BoxDecoration(
              color: Color(0xFF3D8DFF),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 1,
            decoration: BoxDecoration(
              color:
                  step > 1 ? const Color(0xFF3D8DFF) : const Color(0xFF202832),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color:
                  step > 1 ? const Color(0xFF3D8DFF) : const Color(0xFF202832),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 1,
            decoration: BoxDecoration(
              color:
                  step > 2 ? const Color(0xFF3D8DFF) : const Color(0xFF202832),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color:
                  step > 2 ? const Color(0xFF3D8DFF) : const Color(0xFF202832),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
