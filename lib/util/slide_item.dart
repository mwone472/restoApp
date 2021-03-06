import 'package:flutter/material.dart';
import 'package:restoapp/util/const.dart';

class SlideItem extends StatefulWidget {
  final String firstImage;
  final String name;
  final String description;
  final String rating;
  VoidCallback ontap;

  SlideItem(
      {@required this.firstImage,
      @required this.name,
      @required this.description,
      @required this.rating,
      this.ontap});

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.9,
        width: MediaQuery.of(context).size.width / 1.2,
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 3.0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 3.7,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.network(
                            widget.firstImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.0,
                        right: 6.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Constants.ratingBG,
                                  size: 10,
                                ),
                                Text(
                                  " ${widget.rating} ",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.0,
                        left: 6.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              " OPEN ",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "${widget.description}",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          onTap: widget.ontap,
        ),
      ),
    );
  }
}
