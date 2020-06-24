import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel> _items = [];


  @override
  void initState() {
    populateItems();
    super.initState();
  }


  void populateItems() {
    for (int i = 0; i < 10; i++) {
      _items.add(ItemModel(isSelected: false));     //By default not selected
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding + Opacity"),
      ),
      body: ListView.builder(itemBuilder: (_, position) {
        ItemModel item = _items[position];

        return GestureDetector(
          onTap: () {
            setState(() {
              item.isSelected = !item.isSelected;
            });
          },
          child: ListItem(
            isSelected: item.isSelected,
          ),
        );
      },
        itemCount: _items.length,
      ),
    );
  }
}







class ItemModel {
  bool isSelected;

  ItemModel({this.isSelected = false});
}








class ListItem extends StatelessWidget {

  final bool isSelected;

  const ListItem({Key key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(
        milliseconds: 200,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 16 : 32,
        vertical: isSelected ? 8 : 16,
      ),
      child: AnimatedOpacity(
        duration: Duration(
          milliseconds: 200,
        ),
        opacity: isSelected ? 0.7 : 1,
        child: Container(
          color: Colors.blue,
          height: 100,
        ),
      ),
    );
  }
}



