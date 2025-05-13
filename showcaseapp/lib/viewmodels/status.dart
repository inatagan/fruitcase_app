import 'package:flutter/material.dart';
import 'package:showcaseapp/viewmodels/session_end.dart';

class OrderStatusScreen extends StatefulWidget {
  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  final List<String> _statuses = [
    "Processed",
    "Shipped",
    "En Route",
    "Arrived",
  ];
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _animateProgress();
  }

  void _animateProgress() async {
    for (int i = 0; i < _statuses.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        setState(() {
          _currentStep = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Order Progress'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              _statuses.asMap().entries.map((entry) {
                int index = entry.key;
                String status = entry.value;
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _currentStep >= index ? 1.0 : 0.3,
                  child: Column(
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentStep >= index ? Colors.pink : Colors.grey,
                        ),
                      ),
                      if (index < _statuses.length - 1)
                        Container(
                          height: 50,
                          width: 2,
                          color:
                              _currentStep > index ? Colors.green : Colors.grey,
                        ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
          // Add your desired functionality here
          print("Session Ended");
        },
        label: Text("End Session"),
        icon: Icon(Icons.exit_to_app),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: OrderStatusScreen()));
}
