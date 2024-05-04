import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _cities = ['São Paulo', 'London', 'New York'];
  String _selectedCity = 'São Paulo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedCity,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch(
              items: _cities,
              onChanged: ((value) => {
                    setState(() {
                      _selectedCity = value!;
                    })
                  }),
              selectedItem: _selectedCity,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      icon: Icon(
                Icons.location_on,
              ))),
            )
          ],
        ),
      ),
    );
  }
}
