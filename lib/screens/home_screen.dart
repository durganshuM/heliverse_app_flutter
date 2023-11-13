import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/emp_card_list.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:heliverse_app_flutter/screens/filters_screen.dart';
import 'package:heliverse_app_flutter/screens/teams_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showData = false;

  String searchText = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HeliverseData>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TeamsScreen()),
              );
            },
            icon: const Icon(Icons.people),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const FiltersScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
          IconButton(
              onPressed: () async {
                await Provider.of<HeliverseData>(context, listen: false)
                    .fetchData();
                setState(() {
                  showData = true;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('Heliverse'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xff424242),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (searchValue) {
                        searchText = searchValue;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (searchText != '') {
                          Provider.of<HeliverseData>(context, listen: false)
                              .getSearchedList(searchedName: searchText);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text('Search'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: showData
                  ? const EmpCardList()
                  : const Center(
                      child: Text('Press Refresh Button'),
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff424242),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: const Icon(Icons.navigate_before),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: const Icon(Icons.navigate_next),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
