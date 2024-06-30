import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {

  final String text;
  final VoidCallback pressed;
  final String image;
 
  const ButtomWidget({
    super.key,
    required this.text,
    required this.image,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: pressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Spacer(),
               const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
