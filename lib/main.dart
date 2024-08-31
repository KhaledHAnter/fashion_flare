import 'package:device_preview/device_preview.dart';
import 'package:fashion_flare/Views/Register_view.dart';
import 'package:fashion_flare/Views/cart_view.dart';
import 'package:fashion_flare/Views/checkout_view.dart';
import 'package:fashion_flare/Views/choose_hair_view.dart';
import 'package:fashion_flare/Views/choose_style_view.dart';
import 'package:fashion_flare/Views/filter_view.dart';
import 'package:fashion_flare/Views/forgot_password_view.dart';
import 'package:fashion_flare/Views/generated_outfit_view.dart';
import 'package:fashion_flare/Views/home_view.dart';
import 'package:fashion_flare/Views/item_details_view.dart';
import 'package:fashion_flare/Views/nav_home_view.dart';
import 'package:fashion_flare/Views/nearby_shops_view.dart';
import 'package:fashion_flare/Views/offers_view.dart';
import 'package:fashion_flare/Views/onboarding_view.dart';
import 'package:fashion_flare/Views/otp_verfication_view.dart';
import 'package:fashion_flare/Views/payment_done_view.dart';
import 'package:fashion_flare/Views/payment_methods_view.dart';
import 'package:fashion_flare/Views/profile_view.dart';
import 'package:fashion_flare/Views/recept_view.dart';
import 'package:fashion_flare/Views/sign_in_view.dart';
import 'package:fashion_flare/Views/today_outfit_view.dart';
import 'package:fashion_flare/Views/user_credentials_view.dart';
import 'package:fashion_flare/Views/user_details_view.dart';
import 'package:fashion_flare/Views/wardrobe_view.dart';
import 'package:fashion_flare/Views/welcome_view.dart';
import 'package:fashion_flare/Views/wishlist_view.dart';
import 'package:fashion_flare/Views/your_3d_model.dart';
import 'package:fashion_flare/constants.dart';
import 'package:fashion_flare/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const FashionFalre(),
    // ),
    const FashionFalre(),
  );
  await ScreenUtil.ensureScreenSize();
}

class FashionFalre extends StatelessWidget {
  const FashionFalre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(414, 854),
        );
        return child!;
      },
      debugShowCheckedModeBanner: false,
      title: 'Fashion Flare',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: kFontFamily,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        WelcomeView.id: (context) => const WelcomeView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        UserCredentialsView.id: (context) => const UserCredentialsView(),
        SignInView.id: (context) => const SignInView(),
        RegisterView.id: (context) => const RegisterView(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        OTPverficationView.id: (context) => const OTPverficationView(),
        UserDetails.id: (context) => const UserDetails(),
        ChooseStyleView.id: (context) => const ChooseStyleView(),
        ChooseHairView.id: (context) => const ChooseHairView(),
        Your3DModel.id: (context) => const Your3DModel(),
        NavHomeView.id: (context) => const NavHomeView(),
        HomeView.id: (context) => const HomeView(),
        TodayOutfitView.id: (context) => const TodayOutfitView(),
        NearbyShops.id: (context) => const NearbyShops(),
        OffersView.id: (context) => const OffersView(),
        FilterView.id: (context) => const FilterView(),
        ItemDetailsView.id: (context) => const ItemDetailsView(),
        WishListView.id: (context) => const WishListView(),
        CartView.id: (context) => const CartView(),
        PaymenMethods.id: (context) => const PaymenMethods(),
        Checkoutview.id: (context) => const Checkoutview(),
        PaymentDoneView.id: (context) => const PaymentDoneView(),
        ReceptView.id: (context) => const ReceptView(),
        WardrobeView.id: (context) => const WardrobeView(),
        GeneratedOutfitView.id: (context) => const GeneratedOutfitView(),
        ProfileView.id: (context) => const ProfileView(),
      },
      initialRoute: WelcomeView.id,
    );
  }
}


// Fatma   -->    2:00 M
// Sohila   --> 1:20 M
// Sandy  -->   1:55 M
// Khaled  -->  2:30 M
// Hady  -->    1:00 M 
// Jimmy  -->   2:10 M
// Hanan  -->   3:00 M
// Anter  -->   7:30 M
// Kareem  -->  1:00 M
// Mahmoud  --> 2:30 M

// 1200   
