import 'package:flutter/material.dart';
import 'package:heliverse_app_flutter/networking/network_helper.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    var empData = Provider.of<NetworkHelper>(context).getDecodedData;
    List<String> domains = [];
    List<String> genders = [];
    List<String> available = [];
    for (var emp in empData) {
      domains.add(emp['domain']);
      genders.add(emp['gender']);
      available.add(emp['available'] ? 'Available' : 'Not Available');
    }
    domains = domains.toSet().toList();
    genders = genders.toSet().toList();
    available = available.toSet().toList();
    String selectedDomain = domains[0];
    String selectedGender = genders[0];
    String selectedAvailable = available[0];

    return Container(
      color: const Color(0xff161616),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 40.0,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff424242),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Filters',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.domain),
              value: selectedDomain,
              items: domains
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedDomain = selectedValue.toString();
                });
              },
            ),
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.person),
              value: selectedGender,
              items: genders
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedGender = selectedValue.toString();
                });
              },
            ),
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.event_available),
              value: selectedAvailable,
              items: available
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (selectedValue) {
                setState(() {
                  selectedAvailable = selectedValue.toString();
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                Provider.of<NetworkHelper>(context, listen: false)
                    .applyFilterOnList(
                        domain: selectedDomain,
                        gender: selectedGender,
                        available: selectedAvailable);
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
