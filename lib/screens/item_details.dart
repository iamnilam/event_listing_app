

import 'package:flutter/material.dart';


class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
            )),
        title: Text(
          "Valentine's Day Party",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.save_alt_sharp,
                color: Colors.black,
                size: 16,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 200,
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Valentine's Day Party, 2023-By DJ Kabir",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    child: Icon(Icons.api_rounded),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                      height: 24,
                                      width: 24,
                                      child: Icon(Icons.api_rounded)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      height: 24,
                                      width: 24,
                                      child: Icon(Icons.api_rounded)),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "+20 Going",
                              style:
                              TextStyle(color: Colors.green, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range_sharp),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Date & Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Tuesday, 14 Fab | 07:00 PM - 11:00 PM | IST"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Venue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "63, Netaji Subhas Chandra Bose Road, Manik Bandyopadhyay Sarani, Nehru Colony, Ashok Nagar"),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "View Map",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.arrow_drop_up_outlined,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}