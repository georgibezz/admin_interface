import 'package:admin/main.dart';

import 'package:flutter/material.dart';
 // Import path_provider for directory access.
import 'package:objectbox/objectbox.dart';
import '../../Entities/plan.entity.dart';

import '../../objectbox.g.dart';



class RemedyPlanDropdown extends StatefulWidget {
  final Store store; // Add ObjectBox Store as a parameter
  final Function(Plan newPlan) onAddClicked;

  RemedyPlanDropdown({
    required this.store, // Pass the ObjectBox Store
    required this.onAddClicked,
  });

  @override
  _RemedyPlanDropdownState createState() => _RemedyPlanDropdownState();
}

class _RemedyPlanDropdownState extends State<RemedyPlanDropdown> {
  Plan? selectedPlan;
  bool showForm = false;
  final TextEditingController _searchController = TextEditingController();
  List<Plan> searchResults = [];
  bool isEditing = false;

  void _performSearch() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    // Use ObjectBox query to filter plans by name.
    final results = widget.store
        .box<Plan>()
        .query()
        .build()
        .find()
        .where((plan) => plan.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();


    setState(() {
      searchResults = results;
      selectedPlan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              _performSearch();
            },
            decoration: InputDecoration(
              labelText: 'Search for a plan',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _performSearch,
              ),
            ),
          ),
        ),
        if (!isEditing)
          Column(
            children: [
              if (searchResults.isNotEmpty)
                Column(
                  children: [
                    Text('Search Results:'),
                    for (final result in searchResults)
                      ListTile(
                        title: Text(result.name),
                        onTap: () {
                          setState(() {
                            selectedPlan = result;
                          });
                        },
                      ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (selectedPlan != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditPlanPage(plan: selectedPlan!, store: store, onAddClicked: (Plan ) {  },),
                          ),
                        );
                      } else {
                        print('No plan selected for editing.');
                      }
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Edit'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await _deletePlan(); // Ensure that _deletePlan is asynchronous
                    },
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showForm = !showForm;
                      });
                    },
                    child: Text(showForm ? 'Close Form' : 'Add Plan'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Visibility(
                visible: showForm,
                child: PlanForm(
                  onSave: (newPlan) async {
                    final id = await widget.store
                        .box<Plan>()
                        .put(newPlan.toEntity()); // Insert new PlanEntity into ObjectBox

                    // Retrieve the new Plan from the store
                    final insertedPlan = widget.store.box<Plan>().get(id);

                    if (insertedPlan != null) {
                      widget.onAddClicked(insertedPlan.toPlan()); // Convert PlanEntity to Plan
                    }

                    setState(() {
                      showForm = false;
                    });
                  }, store: store,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Future<void> _deletePlan() async {
    if (selectedPlan != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content:
            Text('Are you sure you want to delete ${selectedPlan!.name}?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  await widget.store
                      .box<Plan>()
                      .remove(selectedPlan!.id);

                  // Call the callback to notify that the plan was deleted
                  widget.onAddClicked(selectedPlan!);

                  setState(() {
                    selectedPlan = null;
                  });

                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
          );
        },
      );
    } else {
      print('No plan selected for deletion.');
    }
  }
}


class PlanForm extends StatefulWidget {
  final Function(Plan) onSave;
  final Store store; // Add ObjectBox Store as a parameter

  PlanForm({required this.onSave, required this.store});

  @override
  _PlanFormState createState() => _PlanFormState();
}

class _PlanFormState extends State<PlanForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String howToUse = '';
  String caution = '';
  String commonlyUsedDrugs = '';
  String herbalAlternative = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Directions'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter instructions';
                  }
                  return null;
                },
                onSaved: (value) {
                  howToUse = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Caution'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter caution';
                  }
                  return null;
                },
                onSaved: (value) {
                  caution = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Drug Commonly Used'),
                onSaved: (value) {
                  commonlyUsedDrugs = value ?? '';
                },
              ),
              TextFormField(
                decoration:
                InputDecoration(labelText: 'Source Of Information'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter source of information';
                  }
                  return null;
                },
                onSaved: (value) {
                  herbalAlternative = value ?? '';
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newPlan = Plan(
                      name: name,
                      howToUse: howToUse,
                      caution: caution,
                      commonlyUsedDrugs: commonlyUsedDrugs,
                      herbalAlternative: herbalAlternative,
                      id: 0,
                    );

                    // Use ObjectBox to insert the new PlanEntity
                    final id = await widget.store
                        .box<Plan>()
                        .put(newPlan.toEntity());

                    // Retrieve the inserted PlanEntity
                    final insertedPlan =
                    widget.store.box<Plan>().get(id);

                    if (insertedPlan != null) {
                      widget.onSave(insertedPlan.toPlan());
                      Navigator.pop(context); // Close the dialog
                    }
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EditPlanPage extends StatefulWidget {
  final Plan plan;
  final Store store;
  final Function(Plan) onAddClicked;

  EditPlanPage({
    required this.plan,
    required this.store,
    required this.onAddClicked, // Add this line
  });

  @override
  _EditPlanPageState createState() => _EditPlanPageState();
}

class _EditPlanPageState extends State<EditPlanPage> {
  late TextEditingController nameController;
  late TextEditingController howToUseController;
  late TextEditingController cautionController;
  late TextEditingController commonlyUsedDrugsController;
  late TextEditingController herbalAlternativeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.plan.name);
    howToUseController = TextEditingController(text: widget.plan.howToUse);
    cautionController = TextEditingController(text: widget.plan.caution);
    commonlyUsedDrugsController =
        TextEditingController(text: widget.plan.commonlyUsedDrugs);
    herbalAlternativeController =
        TextEditingController(text: widget.plan.herbalAlternative);
  }

  @override
  void dispose() {
    nameController.dispose();
    howToUseController.dispose();
    cautionController.dispose();
    commonlyUsedDrugsController.dispose();
    herbalAlternativeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: howToUseController,
              decoration: InputDecoration(labelText: 'Instructions'),
            ),
            TextFormField(
              controller: cautionController,
              decoration: InputDecoration(labelText: 'Cautions'),
            ),
            TextFormField(
              controller: commonlyUsedDrugsController,
              decoration: InputDecoration(labelText: 'Drug Commonly Used'),
            ),
            TextFormField(
              controller: herbalAlternativeController,
              decoration: InputDecoration(labelText: 'Source of Information'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Update the plan with the new values
                widget.plan.name = nameController.text;
                widget.plan.howToUse = howToUseController.text;
                widget.plan.caution = cautionController.text;
                widget.plan.commonlyUsedDrugs =
                    commonlyUsedDrugsController.text;
                widget.plan.herbalAlternative =
                    herbalAlternativeController.text;

                // Use ObjectBox to update the PlanEntity
                await widget.plan.toEntity().update(widget.plan.id as Plan,
                    widget.store.box<Plan>());

                // Notify the parent widget that the plan was updated
                widget.onAddClicked(widget.plan);

                // Navigate back to the previous page (RemedyPlanDropdown)
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
