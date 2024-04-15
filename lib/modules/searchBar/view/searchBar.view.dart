import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:untitled/modules/searchBar/controller/searchBar.controller.dart';

class SearchBarView extends StatelessWidget {
  SearchBarView({super.key});

  final SearchBarController searchBarController = SearchBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TypeAheadField(
            hideOnEmpty: true,
            autoFlipDirection: true,
            controller: searchBarController.searchFieldController,
            itemBuilder: (context, value) {
                return ListTile(
                  title: Text(value.toString()),
                );
            },
            onSelected: (value) => searchBarController.onSelected(value.toString()),
            suggestionsCallback: (search) => searchBarController.onSuggestionsCallBack(search),
          ),
        ],
      ),
    );
  }
}
