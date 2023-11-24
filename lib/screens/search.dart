import 'package:adkosh/models/corpora.dart';
import 'package:adkosh/screens/meaning.dart';
import 'package:adkosh/services/dbServices.dart';
import 'package:adkosh/widgets/not_found.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  List<Corpora> items = [];
  @override
  void initState() {
    super.initState();
    searchController.addListener(_printLatestValue);

    setInitialItems();
  }

  void setInitialItems() async {
    List<Corpora> res = await DBService.instance.getWordSearchList(term: '');

    res.length > 0
        ? setState(() {
            items = res;
          })
        : setState(() {
            items = [];
          });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _printLatestValue() async {
    List<Corpora> res = await DBService.instance
        .getWordSearchList(term: searchController.text.trim());

    res.length > 0
        ? setState(() {
            items = res;
          })
        : setState(() {
            items = [];
          });
  }

  // void _handleSubmit() {
  //   print('Submitted the value: ${searchController.text}');
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     color: Colors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 2,
          //         blurRadius: 5,
          //         offset: Offset(0, 3),
          //       ),
          //     ],
          //   ),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.all(16.0),
          //       border: InputBorder.none,
          //       hintText: 'यहाँ शब्दको अर्थ खोज्नुहोस्...',
          //       suffixIcon: Icon(
          //         Icons.search,
          //         color: Colors.grey,
          //       ),
          //     ),
          //     style: TextStyle(fontSize: 18, color: Colors.black),
          //     controller: searchController,
          //   ),
          // ),

          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'यहाँ शब्दको अर्थ खोज्नुहोस्...',
                suffixIcon: Icon(Icons.search)),
            style: TextStyle(fontSize: 20),
            controller: searchController,
          ),
        ),
        items.length > 0
            ? Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 1,
                        // color: Color(0xFF808080),
                        child: ListTile(
                          // leading: Icon(Icons.favorite),
                          // trailing: Icon(Icons.arrow_circle_right_outlined),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_circle_right_outlined),
                              Text('अर्थ')
                            ],
                          ),
                          // tileColor: index.isEven || index == 0 ? Colors.grey[300] : Colors.white,
                          title: Text(
                            items[index].word,
                            style: TextStyle(fontSize: 20),
                          ),
                          // subtitle: ,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Meaning(
                                      id: items[index].id,
                                      word: items[index].word),
                                ));
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: 8,
                      endIndent: 8,
                    );
                  },
                ),
              )
            : NoResults()
      ],
    );
  }
}
