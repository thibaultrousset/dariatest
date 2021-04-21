import 'package:flutter/material.dart';
import 'package:janine_birthday/puzzle.dart';
import 'package:janine_birthday/restaurant.dart';
import 'package:janine_birthday/surprise.dart';
import 'appRoutes.dart';
import 'congrats.dart';
import 'home.dart';


/// Routes in the app we can navigate on and the class that will be called on each route
/// A l'appel de la navigation utilisant les cibles déclarées dans AppRoutes ces routes sont disponibles pour appeler un écran avec un context global à l'application.
/// Les routes sont mises à disposition dans la déclaration de main.dart

final routes = {
  // login route call the form parent screen with login form screen as parameter
  AppRoutes.HOME: (BuildContext context) => new  Home(),
  // reset password route call the reset password screen screen
  AppRoutes.PUZZLE: (BuildContext context) => new Puzzle(),
  // forgot id route call the forgot id screen screen
  AppRoutes.RESTAURANT: (BuildContext context) => new Restaurant(),
  // home route call the loggedIn screen
  AppRoutes.SURPRISE: (BuildContext context) => new Surprise(),
  // route to call perso infos details screens
  // called in perso info list
  AppRoutes.CONGRATS: (BuildContext context) => new Congrats(),
  // route to call global widget that wrap forms
  // called in account info,shipping address screens & login form
};

