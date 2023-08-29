import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.recevedData});
  final List<Map<String, String>>? recevedData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> data = [];

  @override
  void initState() {
    if (widget.recevedData!.isNotEmpty) {
      data = widget.recevedData!.toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Information"),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: ListTile(
                  tileColor: Colors.blueGrey,
                  textColor: Colors.white,
                  leading: const Icon(Icons.person),
                  title: Text(data[index]['name'].toString()),
                  subtitle: Text(data[index]['address'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            final Uri smsLaunchUri = Uri(
                              scheme: 'tel',
                              path: data[index]['phone'],
                              // queryParameters: <String, String>{
                              //   'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
                              // },
                            );
                            launchUrl(smsLaunchUri);
                          },
                          icon: Icon(
                            Icons.call,
                          )),
                      IconButton(
                          onPressed: () {
                            final Uri smsLaunchUri = Uri(
                              scheme: 'sms',
                              path: data[index]['phone'],
                              // queryParameters: <String, String>{
                              //   'body': Uri.decodeComponent(data[index]['address'].toString()),
                              // },
                            );
                            launchUrl(smsLaunchUri);
                          },
                          icon: Icon(
                            Icons.message,
                          )),
                      IconButton(
                          onPressed: () {
                            print("${data[index]['email']}");
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: data[index]['email'],
                            );
                            launchUrl(emailLaunchUri);
                          },
                          icon: Icon(
                            Icons.mail_outline_outlined,
                          ))
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUserDataPage(
                  recevedData: data,
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
