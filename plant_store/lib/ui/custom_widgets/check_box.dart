import 'package:flutter/material.dart';
import 'package:green_tree/ui/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

//importing material design library
void main() {
  runApp(MaterialApp(
    //runApp method
    home: HomePage(),
  )); //MaterialApp
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = false;

  @override
  //App widget tree
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: Consumer(builder: (context, model, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('GeeksforGeeks'),
                backgroundColor: Colors.greenAccent[400],
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  tooltip: 'Menu',
                  onPressed: () {},
                ), //IconButton
              ), //AppBar
              body: Center(
                /** Card Widget **/
                child: Checkbox(
                  value: this.value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ), //Checkbox
                //Card
              ), //Center//Center
            ), //Scaffold
          );
        }));
    //MaterialApp
  }
}
