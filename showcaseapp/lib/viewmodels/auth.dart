import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showcaseapp/viewmodels/basket.dart';

final _formkey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('login'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          //image
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
          //text title
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Text('What is your first name?')),
                  //form
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasketScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
