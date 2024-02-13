import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1_hungry/image.dart';
import 'boolean.dart';
import 'package:provider/provider.dart';

class Homepage2 extends StatefulWidget {
  final String id;
  final String password;

  Homepage2({
    required this.id,
    required this.password,
  });

  @override
  State<Homepage2> createState() {
    return _Homepage2State();
  }
}

class _Homepage2State extends State<Homepage2> {
  Color customone = Colors.amberAccent;
  File? _image;
  @override
  Widget build(BuildContext context) {
    if (widget.id == 'Benjamin' && widget.password == 'pwd') {
      Provider.of<AuthProvider>(context, listen: false)
          .login(); // Update login state
      var container = Container(
        decoration: BoxDecoration(
          image: _image != null
              ? DecorationImage(
                  image: FileImage(
                      _image!), // Use file image if _image is not null
                )
              : DecorationImage(
                  image: AssetImage(
                      'images/guest.jpg'), // Use guest image if _image is null
                ),
          borderRadius: BorderRadius.circular(1000000),
          border: Border.all(width: 8, color: customone),
        ),
        height: 100,
        width: 100,
      );
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, ' + widget.id,
                style: TextStyle(fontSize: 30),
              ),
              container,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("back?"),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to ProfilePageimage and wait for a result
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePageimage()),
                  );

                  // Check if a result is received and update _image accordingly
                  if (result != null && result is File) {
                    setState(() {
                      _image = result;
                    });
                  }
                },
                child: Text("Change Profile picture"),
              )
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              customone = customone == Colors.amberAccent
                  ? Colors.black
                  : Colors.amberAccent;
            });
          },
          child: null,
        ),
      );
    } else {
      // Schedule showing the dialog after the current frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Credentials'),
              content:
                  Text('The username or password you entered is incorrect.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });

      // Return an empty Scaffold temporarily to avoid errors
      return Scaffold(); //Column
    }
  }
}
