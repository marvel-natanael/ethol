import 'package:ethol/theme.dart';
import 'package:flutter/material.dart';
import 'package:ethol/login.dart';

class LandingPage extends StatelessWidget{
  @override
    Widget build (BuildContext context){

      void onTap(String input){
      final snackBar = SnackBar(content: Text('You clicked '+ input));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      Widget extraText = Padding(
        padding: EdgeInsets.only(bottom: 5),
        child:
          MaterialButton(
            onPressed: () => onTap("Check our Services"),
              child: Text("Check our Services",
                style: smallText), 
            ),
      );

      Widget loginButton = Padding(
        padding: EdgeInsets.only(top: 16),
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: blueColor,
            border: Border.all(width: 1, color: blueColor),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              "Login",
              style: loginButtonText,
            ),        
          ),
        )
      );

      Widget loginBoxButtons(String name) {
        return Padding(
          padding: EdgeInsets.only(top: 8),
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blueColor),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: MaterialButton(
              child: Text(name,style: loginText,),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () => onTap(name),
              ),
          ),
        );
      }

    Widget loginBox = Padding(
      padding: EdgeInsets.only(left:18, right: 18, bottom: 72),
      child: Container(
        height: 371,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left:24, right: 24,),
          child: ListView(
            children: [
              SizedBox(height: 18,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/ethol.png'),),
                  SizedBox(height: 10,),
                  loginBoxButtons("Home"),
                  loginBoxButtons("Courses"),
                  loginBoxButtons("Programs and Degrees"),
                  loginBoxButtons("Contact"),
                  loginButton,
                  extraText,
                ],
              ),
            ],
          ),
        ),
      ),
    );

      return Scaffold(
        backgroundColor: blueColor,
        body: SafeArea(
          child: ListView(
            children: <Widget> [
              Padding(
              padding: EdgeInsets.fromLTRB(0, 36, 0, 43),
              child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/logo.png'),),
                      ],
                    )   
                ),
              ),
              loginBox,
            ],
          ),
        ),
      );
  }
}
