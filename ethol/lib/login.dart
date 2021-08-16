import 'package:ethol/theme.dart';
import 'package:flutter/material.dart';
import 'package:ethol/home.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    Widget loginButton = Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: MaterialButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text(
          "Login",
          style: loginButtonText,
        ),
      ),
    );

    Widget loginHeading = Padding(
      padding: EdgeInsets.only(right: 60, left: 60),
      child: Center(
        child: Text(
        "EEPIS Central\nAuthentication\nService (CAS)",
        style: heading1,
        ),
      )
    );

    Widget loginBox = Padding(
      padding: EdgeInsets.fromLTRB(18, 61, 18, 72),
      child: Container(
        height: 324,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          children: [
            SizedBox(height: 18,),
            Text(
              "Enter your NetID and Password",
              style: heading2,
            ),
            SizedBox(height: 18,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  SizedBox(height: 6,),
                  Container(
                    height: 48,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'no need to fill this',
                        labelStyle: loginText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blueColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blueColor),
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    height: 48,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'just click login',
                        labelStyle: loginText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blueColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blueColor),
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 72,),
                  loginButton,
                ],
              ),
            )
          ],
        ),
      ),
    );

    Widget appBar = AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios
        ),
      ),
    );
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            appBar,
            loginHeading,
            loginBox,
          ],
        ),
      ),
    );
  }
}