import 'package:event_listing_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

googleLogin() async {
  print("Google login method called");
  GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    var result = await _googleSignIn.signIn(); // Use signIn() instead of assigning the instance
    print(result);
  } catch (error) {
    print(error);
  }

}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.blueGrey,
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.only(top: 300, bottom: 300, left: 50, right: 50),
          elevation: 10,
          child: InkWell(
            onTap: () async {
              await googleLogin();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage('assets/image/google.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Sign In with Google")
              ],
            ),
          ),
        ),
      ),
    );
  }
}