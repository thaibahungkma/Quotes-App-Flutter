import 'package:count/page/home_page.dart';
import 'package:count/value/app_assets.dart';
import 'package:count/value/app_colors.dart';
import 'package:count/value/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Welcome to',
                style: AppStyles.h3,
              ),
                ),
            ),
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Text('English',
                      style: AppStyles.h2.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                      ),),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text('Quotes"',
                    textAlign: TextAlign.right,
                    style: AppStyles.h4.copyWith(
                      height: 0.5
                    ),),
                  )
                ],
              ),
            ),
            ),
            Expanded(child:
            Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: RawMaterialButton(
                shape: CircleBorder(),
                fillColor: AppColors.lighBlue,
                onPressed: () { 
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_)=>HomePage()), (route) => false);
                },
                child: Image.asset(AppAssets.rightArrow),

              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
