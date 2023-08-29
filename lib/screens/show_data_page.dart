

import 'package:flutter/material.dart';
import 'package:untitled2/screens/login_page.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key, required this.d});
final List<Map<String,String>>? d;

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<Map<String,String>> data = [];

  @override
  void initState() {
    data = widget.d!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Data"),
      ),
      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[index]['name'].toString()),
                    SizedBox(width: 100,),
                    Text(data[index]['pass'].toString()),
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage(d: data,)));
        },
        child: Text("Add"),
      ),
    );
  }
}
