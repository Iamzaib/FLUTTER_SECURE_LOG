import 'package:flutter/material.dart';

//import '../comm/genTextFormField.dart';

class AppendicesMain extends StatefulWidget {
  const AppendicesMain({Key? key}) : super(key: key);

  @override
  State<AppendicesMain> createState() => _AppendicesMainState();
}

class _AppendicesMainState extends State<AppendicesMain> {
  @override
  Widget build(BuildContext context) {
    // final _conUserName = TextEditingController();
    // final _conUserContact = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appendices Main Page'),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Contact List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.person),
                  // getTextFormField(
                  //     controller: _conUserName,
                  //     icon: Icons.person,
                  //     hintName: 'Name'),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Icon(Icons.email),
                    ],
                  ),
                  // getTextFormField(
                  //     controller: _conUserContact,
                  //     icon: Icons.person,
                  //     hintName: 'Contact'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
