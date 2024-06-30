import 'package:flutter/material.dart';

class ButtomWidget2 extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  final String image;
  final String text2;

  const ButtomWidget2({
    Key? key,
    required this.text,
    required this.image,
    required this.pressed,
    required this.text2,
  }) : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: 300,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dialog Content',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter some text',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  style: ElevatedButton.styleFrom(
                 //   primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Close Dialog'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            _showDialog(context); 
          },
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
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1FDE00),
                ),
                height: 24,
                width: 84,
                child: Center(
                  child: Text(text2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
