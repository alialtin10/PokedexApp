import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constents/constants.dart';
import 'package:pokedexapp/constents/ui_helper.dart';


class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  final String pokeballImageUrl = "images/pngwing.com.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade400,
      child: SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          children: [
            Padding(
              padding: UIHelper.getdefaultPadding(),
              child: Align(alignment: Alignment.topLeft ,child: Text(Constants.title,style: Constants.gettitleTextStyle(),)),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                pokeballImageUrl,
                width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}