import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/routing/app_router.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FashionFlare extends StatelessWidget {
  final AppRouter appRouter;
  const FashionFlare({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fashion Flare",
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: kFontFamily,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        initialRoute: Routes.welcomeView,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
