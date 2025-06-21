
import 'package:go_router/go_router.dart';
import 'package:skills_over_flow_app/views/ChangePasswordView.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';
import 'package:skills_over_flow_app/views/ProblemListAdminView.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';
import 'package:skills_over_flow_app/views/SpashView.dart';
import 'package:skills_over_flow_app/views/addProblemView.dart';
import 'package:skills_over_flow_app/views/addProblemView.dart';
import 'package:skills_over_flow_app/views/homeView.dart';
import 'package:skills_over_flow_app/views/userInfoView.dart';
import 'package:skills_over_flow_app/views/usersView.dart';

import '../views/addProblemView.dart';

abstract class AppRouter{
  static const  loginView='/loginView';
  static const signUpView='/signUpView';
  static const homeView='/homeView';
  static const profileView='/profileView';
  static const changePasswordView='/changePasswordView';
  static const usersView='/usersView';
  static const addProblemView='/addProblemView';
  static const problemListAdminView='/problemListAdminView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProblemListAdminView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: usersView,
        builder: (context, state) => const userView(),
      ),
      GoRoute(
        path: changePasswordView,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: profileView,
        builder: (context, state) => const userInfoView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: addProblemView,
        builder: (context, state) => const AddProblemView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),

    ],
  );
}