import 'package:flutter/material.dart';
import 'package:transmitter/data/model/api_model.dart';
import 'package:transmitter/data/source/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = 'Eyes';
  static List<String> categories = ['Eyes', 'Lips', 'Powder'];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Center(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  setState(() {
                    category = categories[index];
                  });
                },
                child: Text(
                  categories[index],
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
      ),
    ];
    return Scaffold(
      body: FutureBuilder<ApiModel>(
        future: getRequest(
            url: Uri.parse(
                'https://shoppeefy.herokuapp.com/api/product/category/$category')),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List products = snapshot.data!.body;
          for (var product in products) {
            items.add(
              ListTile(
                title: Text(
                  product['productName'],
                ),
              ),
            );
          }
          return ListView(
            children: items,
          );
        },
      ),
    );
  }
}
