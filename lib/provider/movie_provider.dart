//PROVIDER CLASS: which is a wrapper around InheritedWidget class which helps Not only expose a value, but also create, listen, and dispose it.
//CHANGE NOTIFIER: a class which provides change notification to its listener
//notifiylistener: a method called when we have to rebuild the widget.

import 'package:flutter/material.dart';
import 'dart:math';
import '../models/movie.dart';

//List of Movies
final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Movie $index",
        runtime: " ${Random().nextInt(100) + 60} minutes"));

//Methods to be performed on list, use ChangeNotifier to provider notification of methods performed to its listener.
class MovieProvider with ChangeNotifier {
  //Objects of list

  //All movies to be displayed on homescreen
  final List<Movie> _movies = initialData;

  //retrive movie list data
  List<Movie> get movies => _movies;

  //All movies to be displayed on favourite screen
  final List<Movie> _myList = [];

  //retrive myList data
  List<Movie> get myList => _myList;

  //Methods on list

  //Add movies to favourite list
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  //Remove movies from favourite list
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
  
}
