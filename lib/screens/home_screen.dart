import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int entertainmentIndex = -1;
  int artAndTheatreIndex = -1;
  int moreIndex = -1;

  List<Map<String, dynamic>> items = [
    {"icon": Icons.category_rounded, "text": "Holi 2023"},
    {"icon": Icons.event, "text": "Date & Time"},
    {"icon": Icons.swap_vert_outlined, "text": "Sort"},
  ];

  List<String> cateItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String dataUrl =
        "https://allevents.s3.amazonaws.com/tests/categories.json";
    try {
      final response = await http.get(Uri.parse(dataUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<String> categoryEvent = jsonData.map((item) {
          return item["category"].toString();
        }).toList();

        setState(() {
          cateItems = categoryEvent;
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        print("Error message: ${response.body}");
        throw Exception("Failed to load data");
      }
    } catch (error) {
      print("Error during data fetching: $error");
      throw Exception("Failed to load data");
    }
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  List<String> artAndTheatreList = [
    "Fine Arts",
    "Theatre",
    "Literary Arts",
    "Craffts",
    "Photography",
    "Cooking",
  ];
  List<String> moreList = [
    "Fine Arts",
    "Theatre",
    "Literary Arts",
    "Craffts",
    "Photography",
    "Cooking",
    "Performances",
    "Comedy",
    "Dance",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        title: Text(
          "Holi 2023 Events in Ahmedabad",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle search action
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.green.withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Music',
                icon: Icon(Icons.music_note),
              ),
              BottomNavigationBarItem(
                label: 'Places',
                icon: Icon(Icons.location_on),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    items.length,
                        (index) => Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          showBottomSheet();
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              items[index]["icon"],
                              color: index == selectedIndex
                                  ? Colors.blue
                                  : Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              items[index]["text"],
                              style: TextStyle(
                                color: index == selectedIndex
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Your other UI components...
            ],
          ),
        ),
      ),
    );
  }

  // void showBottomSheet() {
  //   showModalBottomSheet<void>(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(builder: (context, setState) {
  //         return Container(
  //           width: MediaQuery.of(context).size.width,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20),
  //               topRight: Radius.circular(20),
  //             ),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Center(
  //                   child: Container(
  //                     width: MediaQuery.of(context).size.width * 0.3,
  //                     height: 5,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(50),
  //                       color: Colors.grey,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 15,
  //                   vertical: 10,
  //                 ),
  //                 child: Text(
  //                   "Categories",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20,
  //                   ),
  //                 ),
  //               ),
  //               Divider(),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 15),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                       "Entertainment",
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Wrap(
  //                       spacing: 10.0,
  //                       runSpacing: 10.0,
  //                       children: List.generate(
  //                         cateItems.length,
  //                             (index) => GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               entertainmentIndex = index;
  //                               artAndTheatreIndex = -1;
  //                               moreIndex = -1;
  //                             });
  //                           },
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(50),
  //                               border: Border.all(
  //                                 color: entertainmentIndex == index
  //                                     ? Colors.transparent
  //                                     : Colors.black54,
  //                               ),
  //                               color: entertainmentIndex == index
  //                                   ? Colors.blue
  //                                   : Colors.white,
  //                             ),
  //                             child: Padding(
  //                               padding: const EdgeInsets.symmetric(
  //                                 horizontal: 15,
  //                                 vertical: 5,
  //                               ),
  //                               child: Text(
  //                                 cateItems[index],
  //                                 style: TextStyle(
  //                                   color: entertainmentIndex == index
  //                                       ? Colors.white
  //                                       : Colors.black54,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Divider(),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 15),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                       "Art & Theatre",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Wrap(
  //                       spacing: 10.0,
  //                       runSpacing: 10.0,
  //                       children: List.generate(
  //                         artAndTheatreList.length,
  //                             (index) => GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               artAndTheatreIndex = index;
  //                               entertainmentIndex = -1;
  //                               moreIndex = -1;
  //                             });
  //                           },
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(50),
  //                               border: Border.all(
  //                                 color: artAndTheatreIndex == index
  //                                     ? Colors.transparent
  //                                     : Colors.black54,
  //                               ),
  //                               color: artAndTheatreIndex == index
  //                                   ? Colors.blue
  //                                   : Colors.white,
  //                             ),
  //                             child: Padding(
  //                               padding: const EdgeInsets.symmetric(
  //                                   horizontal: 15, vertical: 5),
  //                               child: Text(
  //                                 artAndTheatreList[index],
  //                                 style: TextStyle(
  //                                   color: artAndTheatreIndex == index
  //                                       ? Colors.white
  //                                       : Colors.black54,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Divider(),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 15),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                       "More",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Wrap(
  //                       spacing: 10.0,
  //                       runSpacing: 10.0,
  //                       children: List.generate(
  //                         moreList.length,
  //                             (index) => GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               moreIndex = index;
  //                               entertainmentIndex = -1;
  //                               artAndTheatreIndex = -1;
  //                             });
  //                           },
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(50),
  //                               border: Border.all(
  //                                 color: moreIndex == index
  //                                     ? Colors.transparent
  //                                     : Colors.black54,
  //                               ),
  //                               color: moreIndex == index
  //                                   ? Colors.blue
  //                                   : Colors.white,
  //                             ),
  //                             child: Padding(
  //                               padding: const EdgeInsets.symmetric(
  //                                   horizontal: 15, vertical: 5),
  //                               child: Text(
  //                                 moreList[index],
  //                                 style: TextStyle(
  //                                   color: moreIndex == index
  //                                       ? Colors.white
  //                                       : Colors.black54,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // Repeat similar sections for Art & Theatre and More categories...
  //             ],
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }

  void showBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // ... existing code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Entertainment",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(
                          cateItems.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                entertainmentIndex = index;
                                artAndTheatreIndex = -1;
                                moreIndex = -1;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailsScreen(
                                    category: cateItems[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: entertainmentIndex == index
                                      ? Colors.transparent
                                      : Colors.black54,
                                ),
                                color: entertainmentIndex == index ? Colors.blue : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                child: Text(
                                  cateItems[index],
                                  style: TextStyle(
                                    color: entertainmentIndex == index ? Colors.white : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Art & Theatre",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(
                          artAndTheatreList.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                artAndTheatreIndex = index;
                                entertainmentIndex = -1;
                                moreIndex = -1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: artAndTheatreIndex == index
                                      ? Colors.transparent
                                      : Colors.black54,
                                ),
                                color: artAndTheatreIndex == index
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  artAndTheatreList[index],
                                  style: TextStyle(
                                    color: artAndTheatreIndex == index
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(),
                      Text(
                        "More",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(
                          moreList.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                moreIndex = index;
                                entertainmentIndex = -1;
                                artAndTheatreIndex = -1;
                              });

                              // Navigate to a new page when a category is selected
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailsScreen(
                                    category: moreList[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: moreIndex == index
                                      ? Colors.transparent
                                      : Colors.black54,
                                ),
                                color: moreIndex == index
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Text(
                                  moreList[index],
                                  style: TextStyle(
                                    color: moreIndex == index
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

}


class CategoryDetailsScreen extends StatefulWidget {
  final String category;

  const CategoryDetailsScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  List<Map<String, dynamic>> categoryData = [];

  @override
  void initState() {
    super.initState();
    fetchDataForAllCategories();
  }

  Future<void> fetchDataForAllCategories() async {
    String dataUrl = "https://allevents.s3.amazonaws.com/tests/all.json";
    try {
      final response = await http.get(Uri.parse(dataUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Map<String, dynamic>> allCategoryData =
        jsonData.cast<Map<String, dynamic>>();

        setState(() {
          categoryData = allCategoryData;
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        print("Error message: ${response.body}");
        throw Exception("Failed to load data");
      }
    } catch (error) {
      print("Error during data fetching: $error");
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView.builder(
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          final event = categoryData[index];
          return ListTile(
            title: Text(event['event_name']),
            subtitle: Text(event['event_date']),
            onTap: () {
              // Navigate to event details page or handle the event tap as needed
            },
          );
        },
      ),
    );
  }
}



