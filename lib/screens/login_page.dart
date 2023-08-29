import 'package:flutter/material.dart';
import 'package:untitled2/screens/show_data_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.d});
  final List<Map<String,String>>? d;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameConmtroller = TextEditingController();
  TextEditingController passController = TextEditingController();
  List<Map<String, String>>  list = [];

  @override
  void initState() {
    if(widget.d!.length > 0){
      list = widget.d!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameConmtroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your Email"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your Password"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameConmtroller.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      list.add( {
                        "name" : nameConmtroller.text.toString(),
                        "pass" : passController.text.toString(),
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ShowData(
                                   d: list
                                  )));
                    } else {
                      print("Wrong");
                    }
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
