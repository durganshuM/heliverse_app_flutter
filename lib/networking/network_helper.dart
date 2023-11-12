import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

class NetworkHelper extends ChangeNotifier {
  List decodedData = [];

  Future<void> fetchData() async {
    //IF DATA WAS COMING FROM HELIVERSE API
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // var data = await http.get(url);

    final String data = await rootBundle.loadString('assets/sample_data.json');
    try {
      decodedData = jsonDecode(data);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void getSearchedList({required String searchedName}) async {
    await fetchData();
    List searchedList = [];
    if (searchedName != '') {
      for (var employees in decodedData) {
        if (searchedName.toLowerCase() ==
                employees['first_name'].toString().toLowerCase() ||
            searchedName == employees['last_name'].toString().toLowerCase() ||
            searchedName ==
                (employees['first_name'] + employees['last_name'])
                    .toString()
                    .toLowerCase()) {
          searchedList.add(employees);
        }
      }
      decodedData = searchedList;
    } else {
      await fetchData();
    }
    notifyListeners();
  }

  void applyFilterOnList(
      {required String domain,
      required String gender,
      required String available}) async {
    await fetchData();
    List filteredList = [];
    for (var emp in decodedData) {
      if (domain == emp['domain'] ||
          gender == emp['gender'] ||
          available == emp['available']) {
        filteredList.add(emp);
      }
    }
    decodedData = filteredList;
    notifyListeners();
  }

  List get getDecodedData => decodedData;
}
