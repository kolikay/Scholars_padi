import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reuseable_appbar.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColor.darkContainer,
          child: Column(
            children: [
              const SizedBox(height: 30,),
              ReuseableAppbar(
                menuPressed: () {},
                searchPressed: () {},
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi_off_rounded, size: 70, color: AppColor.dullBlack,),
                     const SizedBox(height: 10,), 
                      NormalText(text: 'No Internet Connection', size: 18,fontWeight: FontWeight.w500,),
                      const SizedBox(height: 10,),
                      NormalText(text: 'You are offline, please check your connection', color: AppColor.dullBlack, size: 14,),
                      const SizedBox(height: 20,),
                      ReuseableButton(text: 'Try Again', onPressed: (){}, width: 140,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
