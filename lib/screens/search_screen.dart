import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/searched_emp_list.dart';
import 'package:provider/provider.dart';

import '../networking/heliverse_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  List searchedList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xff424242),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (searchValue) {
                            searchText = searchValue;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            focusColor: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                      IconButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          if (searchText != '') {
                            setState(() {
                              searchedList = Provider.of<HeliverseData>(context,
                                      listen: false)
                                  .getSearchedList(searchedName: searchText);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SearchedEmpList(searchedList: searchedList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
