import 'package:admin/main.dart';
import 'package:admin/screens/library/library.crud.dart';
import 'package:flutter/material.dart';
import '../Entities/plan.entity.dart';
import '../objectbox.g.dart';
import 'condition/condition.interface.dart';
import 'plan/plan.interface.dart';
import 'symptom/symptom.interface.dart';

class MyHomePage extends StatefulWidget {
final Store store;

MyHomePage({required this.store});

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  String selectedOption = "Plan";

  void _navigateToSelectedScreen() {
    switch (selectedOption) {
      case "Plan":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RemedyPlanDropdown(store: store, onAddClicked: (Plan newPlan) {  },)),
        );
        break;
      case "Symptoms":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SymptomsInterface()),
        );
        break;
      case "Conditions":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConditionsInterface()),
        );
        break;
      case "Library Items":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemListingPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose an Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text('Plan'),
              leading: Radio<String>(
                value: "Plan",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Conditions'),
              leading: Radio<String>(
                value: "Conditions",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Symptoms'),
              leading: Radio<String>(
                value: "Symptoms",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Library Items'),
              leading: Radio<String>(
                value: "Library Items",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _navigateToSelectedScreen,
              child: Text('CRUD'),
            ),
          ],
        ),
      ),
    );
  }
}
