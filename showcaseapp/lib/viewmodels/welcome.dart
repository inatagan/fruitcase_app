import 'package:flutter/material.dart';
import 'package:showcaseapp/viewmodels/auth.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //IMAGE
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: FittedBox(
                child: Image(
                  image: AssetImage('images/welcome_fruit_basket.png'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Get The Freshest Fruit Salad Combo',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'We deliver the best and freshest fruits salad in town. Order for a combo today!!!',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
          ),
          //BUTTON
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Auth()),
                  );
                },
                child: Text("Let's Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
