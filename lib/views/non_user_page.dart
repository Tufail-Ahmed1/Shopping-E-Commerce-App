import 'package:flutter/material.dart';
import 'package:practise_app/views/registration_page.dart';

import '../widgets/app_style.dart';

class NonUserPage extends StatelessWidget {
  const NonUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      appBar: AppBar(
        backgroundColor: const Color(0xffe2e2e2),
        leading: const Icon(Icons.qr_code_scanner),
        actions: [
          Text('Pakistan |',style: appStyle(18, Colors.black, FontWeight.bold),),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.settings),
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage('https://cdn.siasat.com/wp-content/uploads/2023/02/Imran_Khan.jpg'),
                ),
                Text('Hello, Please Login into Your Account',style: appStyle(12, Colors.black, FontWeight.bold),),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage(),));
                  },
                  child: Text('Login',
                    style: appStyle(12, Colors.white, FontWeight.bold),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
