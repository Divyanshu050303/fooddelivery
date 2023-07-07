import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        // Generate 5 stars/icons
        IconData iconData = index < _rating ? Icons.star : Icons.star_border;
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1; // Update the rating
            });
          },
          child: Icon(iconData,color: Colors.cyan,),
        );
      }),
    );
  }
}