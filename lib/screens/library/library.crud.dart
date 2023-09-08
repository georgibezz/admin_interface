import 'package:admin/entities/item.entity.dart';
import 'package:admin/objectbox.store.dart';
import 'package:admin/screens/library/library.add.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

class ItemListingPage extends StatefulWidget {
  @override
  _ItemListingPageState createState() => _ItemListingPageState();
}

class _ItemListingPageState extends State<ItemListingPage> {
  late final Box<Item> _itemBox;
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _itemBox = ObjectBoxService.objectBoxStore.box<Item>();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = _itemBox.getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Listing')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item.name),
                  onTap: () {
                    //Navigator.push(
                      //context,
                      //MaterialPageRoute(
                        //builder: (context) => AddItemScreen(),
                     // ),
                    //);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          ).then((value) {
            if (value != null && value) {
              _loadItems();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
