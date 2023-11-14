import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/components/emp_cards_list.dart';
import 'package:heliverse_app_flutter/networking/heliverse_data.dart';
import 'package:heliverse_app_flutter/screens/filters_screen.dart';
import 'package:heliverse_app_flutter/screens/search_screen.dart';
import 'package:heliverse_app_flutter/screens/teams_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showData = false;
  int minIndex = 0;
  int maxIndex = 9;

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
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TeamsScreen()),
              );
            },
            icon: const Icon(Icons.people),
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
            Expanded(
              flex: 2,
              child: showData
                  ? EmpCardList(
                      minIndex: minIndex,
                      maxIndex: maxIndex,
                    )
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
                      setState(() {
                        if (minIndex != 0) {
                          minIndex = minIndex - 10;
                          maxIndex = maxIndex - 10;
                        }
                      });
                    },
                    icon: const Icon(Icons.navigate_before),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (maxIndex !=
                            Provider.of<HeliverseData>(context, listen: false)
                                    .getEmpData
                                    .length -
                                1) {
                          minIndex = minIndex + 10;
                          maxIndex = maxIndex + 10;
                        }
                      });
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
