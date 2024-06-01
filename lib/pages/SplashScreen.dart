import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/splash.png", height: 300),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Buy fresh Groceries",
                  style: TextStyle(
                    color: Color(0xFF00A368),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox()
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "homePage");
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF00A368),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
