import 'package:flutter/material.dart';
import 'package:untitled2/screens/home_page.dart';

class AddUserDataPage extends StatefulWidget {
  const AddUserDataPage({super.key, required this.recevedData});
  final List<Map<String, String>>? recevedData;

  @override
  State<AddUserDataPage> createState() => _AddUserDataPageState();
}

class _AddUserDataPageState extends State<AddUserDataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<Map<String, String>> data = [];

  @override
  void initState() {
    if(widget.recevedData!.isNotEmpty){
      data = widget.recevedData!.toList();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Enter Your Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Enter Your Address",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Enter Your Mobile Number",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Enter Your Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    addressController.text.isNotEmpty &&
                    mobileController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {

                  data.add({
                    "name": nameController.text,
                    "address": addressController.text,
                    "phone": mobileController.text,
                    "email": emailController.text
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                recevedData: data,
                              )));
                }
              },
              child: Text("Save Data"),
            )
          ],
        ),
      ),
    );
  }
}
