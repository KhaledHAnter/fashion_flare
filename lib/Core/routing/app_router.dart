import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Features/3D_model/UI/views/your_3d_model.dart';
import 'package:fashion_flare/Features/NavBar/UI/views/nav_home_view.dart';
import 'package:fashion_flare/Features/Onboarding/UI/views/onboarding_view.dart';
import 'package:fashion_flare/Features/Profile/UI/views/profile_view.dart';
import 'package:fashion_flare/Features/Recommendations/UI/views/offers_view.dart';
import 'package:fashion_flare/Features/Recommendations/UI/views/today_outfit_view.dart';
import 'package:fashion_flare/Features/Style_choose/UI/views/choose_hair_view.dart';
import 'package:fashion_flare/Features/Wardrope/UI/views/wardrobe_view.dart';
import 'package:fashion_flare/Features/Wishlist/UI/views/wishlist_view.dart';
import 'package:fashion_flare/Views/Register_view.dart';
import 'package:fashion_flare/Views/cart_view.dart';
import 'package:fashion_flare/Views/checkout_view.dart';
import 'package:fashion_flare/Views/choose_style_view.dart';
import 'package:fashion_flare/Views/filter_view.dart';
import 'package:fashion_flare/Views/forgot_password_view.dart';
import 'package:fashion_flare/Views/generated_outfit_view.dart';
import 'package:fashion_flare/Views/home_view.dart';
import 'package:fashion_flare/Views/item_details_view.dart';
import 'package:fashion_flare/Views/nearby_shops_view.dart';
import 'package:fashion_flare/Views/otp_verfication_view.dart';
import 'package:fashion_flare/Views/payment_done_view.dart';
import 'package:fashion_flare/Views/payment_methods_view.dart';
import 'package:fashion_flare/Views/recept_view.dart';
import 'package:fashion_flare/Views/sign_in_view.dart';
import 'package:fashion_flare/Views/user_credentials_view.dart';
import 'package:fashion_flare/Views/user_details_view.dart';
import 'package:fashion_flare/Views/welcome_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments: arguments as ClassName)
    // final arrguments = settings.arguments;

    switch (settings.name) {
      case Routes.welcomeView:
        return MaterialPageRoute(
          builder: (_) => const WelcomeView(),
        );

      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      case Routes.userCredentialsView:
        return MaterialPageRoute(
          builder: (_) => const UserCredentialsView(),
        );

      case Routes.signInView:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
        );

      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );

      case Routes.otpverficationView:
        return MaterialPageRoute(
          builder: (_) => const OTPverficationView(),
        );

      case Routes.userDetails:
        return MaterialPageRoute(
          builder: (_) => const UserDetails(),
        );

      case Routes.chooseStyleView:
        return MaterialPageRoute(
          builder: (_) => const ChooseStyleView(),
        );

      case Routes.chooseHairView:
        return MaterialPageRoute(
          builder: (_) => const ChooseHairView(),
        );

      case Routes.your3DModel:
        return MaterialPageRoute(
          builder: (_) => const Your3DModel(),
        );

      case Routes.navHomeView:
        return MaterialPageRoute(
          builder: (_) => const NavHomeView(),
        );

      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case Routes.todayOutfitView:
        return MaterialPageRoute(
          builder: (_) => const TodayOutfitView(),
        );

      case Routes.nearbyShops:
        return MaterialPageRoute(
          builder: (_) => const NearbyShops(),
        );

      case Routes.offersView:
        return MaterialPageRoute(
          builder: (_) => const OffersView(),
        );

      case Routes.filterView:
        return MaterialPageRoute(
          builder: (_) => const FilterView(),
        );

      case Routes.itemDetailsView:
        return MaterialPageRoute(
          builder: (_) => const ItemDetailsView(),
        );

      case Routes.wishListView:
        return MaterialPageRoute(
          builder: (_) => const WishListView(),
        );

      case Routes.cartView:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );

      case Routes.paymentMethodsView:
        return MaterialPageRoute(
          builder: (_) => const PaymenMethods(),
        );

      case Routes.checkoutView:
        return MaterialPageRoute(
          builder: (_) => const Checkoutview(),
        );

      case Routes.paymentDoneView:
        return MaterialPageRoute(
          builder: (_) => const PaymentDoneView(),
        );

      case Routes.receptView:
        return MaterialPageRoute(
          builder: (_) => const ReceptView(),
        );

      case Routes.wardrobeView:
        return MaterialPageRoute(
          builder: (_) => const WardrobeView(),
        );

      case Routes.generatedOutfitView:
        return MaterialPageRoute(
          builder: (_) => const GeneratedOutfitView(),
        );

      case Routes.profileView:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
