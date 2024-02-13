import 'package:flutter/material.dart';
import 'Profilepage.dart';
import 'package:provider/provider.dart';

import 'boolean.dart';
import 'Contactus.dart';
import 'Menupage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Material App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final id = TextEditingController();
  final password = TextEditingController();
  final String random = "one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to DDurian',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightGreenAccent,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'images/durianb.jpg',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'DDurian',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contactpage()),
                );
              },
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                bool isLoggedIn = authProvider.isLoggedIn;
                return ListTile(
                  title: Text('Our menu'),
                  onTap: () {
                    if (!isLoggedIn) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Not Logged in'),
                              content: Text(
                                  'Please log in first to continue viewing this.'),
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
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menupage()),
                      );
                    }
                  },
                );
              },
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                bool isLoggedIn = authProvider.isLoggedIn;
                return ListTile(
                  title: Text('Your Profile'),
                  onTap: () {
                    if (!isLoggedIn) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Not Logged in'),
                              content: Text(
                                  'Please log in first to continue viewing this.'),
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
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepage2(
                                  id: "Benjamin",
                                  password: "pwd",
                                )),
                      );
                    }
                  },
                );
              },
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                bool isLoggedIn = authProvider.isLoggedIn;
                return ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    if (!isLoggedIn) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Not Logged in'),
                              content: Text('Please log in first to continue.'),
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
                    } else {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Logged out'),
                              content:
                                  Text('You have logged out of the system'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .logout();
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
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: id,
                  decoration: InputDecoration(
                    hintText: 'ID',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.brown),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'PWD',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.brown),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepage2(
                                  id: id.text,
                                  password: password.text,
                                )));
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
