import 'package:admin/entities/item.entity.dart';
import 'package:flutter/material.dart';
import 'package:admin/main.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);
  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _alsoCalledController;
  late final TextEditingController _sourceController;
  late final TextEditingController _partUsedController;
  late final TextEditingController _formsAvailableController;
  late final TextEditingController _usesController;
  late final TextEditingController _cautionController;
  late final TextEditingController _conscientiousConsumerInformationController;
  late final TextEditingController _referencesController;

  @override
  void initState() {

  _nameController = TextEditingController(text: '');
  _alsoCalledController = TextEditingController(text: '');
  _sourceController = TextEditingController(text: '');
  _partUsedController = TextEditingController(text: '');
  _formsAvailableController = TextEditingController(text: '');
  _usesController = TextEditingController(text: '');
  _cautionController = TextEditingController(text: '');
  _conscientiousConsumerInformationController = TextEditingController(text: '');
  _referencesController = TextEditingController(text: '');
  super.initState();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _alsoCalledController.dispose();
    _sourceController.dispose();
    _partUsedController.dispose();
    _formsAvailableController.dispose();
    _usesController.dispose();
    _cautionController.dispose();
    _conscientiousConsumerInformationController.dispose();
    _referencesController.dispose();
    super.dispose();
  }
  void _showConfirmationDialog() {
    final itemName = _nameController.text;
    if (itemName.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter a name before adding to the database.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Addition'),
          content: const Text('Are you sure you want to add this product to the database?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                addProduct();
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  void addProduct() {
    final itemName = _nameController.text;
    final  itemAlsocalled = _alsoCalledController.text;
    final  itemSource = _sourceController.text;
    final  itemPartUsed = _partUsedController.text;
    final  itemFormAvailable =_formsAvailableController.text;
    final  itemUses = _usesController.text;
    final  itemCaution = _cautionController.text;
    final  itemConsumerInfo =_conscientiousConsumerInformationController.text;
    final  itemReference = _referencesController.text;

    store.box<Item>().put(Item(
        id: 0, // You can set a unique ID, or ObjectBox will auto-generate one.
        name: itemName,
        alsoCalled: itemAlsocalled,
        source: itemSource,
        partUsed: itemPartUsed,
        formsAvailable: itemFormAvailable,
        uses: itemUses,
        caution: itemCaution,
        conscientiousConsumerInformation: itemConsumerInfo,
        references: itemReference,
      ));
      // Optionally, you can navigate back to the product list or another screen
      Navigator.pop(context);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _alsoCalledController,
                  decoration: InputDecoration(labelText: 'Also Called'),
                ),
                TextFormField(
                  controller: _sourceController,
                  decoration: InputDecoration(labelText: 'Source'),
                ),
                TextFormField(
                  controller: _partUsedController,
                  decoration: InputDecoration(labelText: 'Part Used'),
                ),
                TextFormField(
                  controller: _formsAvailableController,
                  decoration: InputDecoration(labelText: 'Forms Available'),
                ),
                TextFormField(
                  controller: _usesController,
                  decoration: InputDecoration(labelText: 'Uses'),
                ),
                TextFormField(
                  controller: _cautionController,
                  decoration: InputDecoration(labelText: 'Caution'),
                ),
                TextFormField(
                  controller: _conscientiousConsumerInformationController,
                  decoration:
                  InputDecoration(labelText: 'Conscientious Consumer Information'),
                ),
                TextFormField(
                  controller: _referencesController,
                  decoration: InputDecoration(labelText: 'References'),
                ),
                ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

