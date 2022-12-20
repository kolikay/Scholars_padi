// import 'dart:io';

import 'dart:io';

import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/note_book_screens/note_model/note_model.dart';
import 'package:scholars_padi/screens/note_book_screens/views/note_book_screen1.dart';
import 'package:scholars_padi/services/web_service.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';

class NoteViewModel extends ChangeNotifier {
  static final NoteViewModel _instance = NoteViewModel._();
  NoteViewModel._();

  static NoteViewModel get instance {
    return _instance;
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

  // empty list to save user data from api
  List noteFromServer = [];

  NoteModel oneNoteFromServer = NoteModel();

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
    notifyListeners();
  }


  searchNote(NoteModel note) {
    oneNoteFromServer.content = note.content;
    oneNoteFromServer.title = note.title;
    oneNoteFromServer.createdAt = note.createdAt;
  }

//Save Notes  funtions
  saveNotes(Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(
        "$baseApi/notes/create/", body, context);

    if (response.code == 200 || response.code == 201) {
      getSavedNotes(context);

      Future.delayed(const Duration(milliseconds: 500), () {
        //navigate to onbording screen after 30 seconds
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NoteBookScreen1(),
          ),
        );
      });

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    if (response is SocketException) {
      pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }

  // get all notes rom server
  Future getSavedNotes(context) async {
    setLoading(true);

    var response = await WebServices.sendGetRequest(
        "$baseApi/notes/list?sort_by=title", context);

    if (response.code == SUCCESS) {
      final result = response.response;

      noteFromServer = result.map(((e) => NoteModel.fromJson(e))).toList();

      // notifyListeners();

      setLoading(false);
    } else {
      setLoading(false);
    }

    setLoading(false);
  }

// get single notes rom server
  Future getSingleNotes(context, search) async {
    setLoading(true);

    var response =
        await WebServices.sendGetRequest("$baseApi/notes/$search", context);

    if (response.code == SUCCESS) {
      final result = response.response;

      searchNote(NoteModel.fromJson(result));

      // notifyListeners();

      setLoading(false);
    } else {
      setLoading(false);
    }

    setLoading(false);
  }

  // delete note function
  Future deleteNote(context, noteTitle) async {
    var response = await WebServices.sendDeleteRequest(
        "$baseApi/notes/$noteTitle/delete", context);

    if (response.code == 202) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NoteBookScreen1(),
        ),
      );

      ShowSnackBar.buildErrorSnackbar(
          context, response!.toString(), Colors.green[100]!);
    } else {
      ShowSnackBar.buildErrorSnackbar(
          context, response!.toString(), Colors.pink[100]!);
    }

    setLoading(false);
  }

    // Edit note function
  Future editNote(context, noteTitle) async {
    var response = await WebServices.sendPutRequest(
        "$baseApi/notes/$noteTitle/update", context);

    if (response.code == 202) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NoteBookScreen1(),
        ),
      );

      ShowSnackBar.buildErrorSnackbar(
          context, response!.toString(), Colors.green[100]!);
    } else {
      ShowSnackBar.buildErrorSnackbar(
          context, response!.toString(), Colors.pink[100]!);
    }

    setLoading(false);
  }
}
