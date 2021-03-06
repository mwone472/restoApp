import 'package:flutter/material.dart';

class ProductModel extends StatelessWidget {
  String name;
  String price;
  String category;
  String firstImage;
  String secondImage;
  String description;
  VoidCallback onTap;
  double rating;

  ProductModel(
      {this.name,
      this.price,
      this.category,
      this.firstImage,
      this.secondImage,
      this.description,
      this.onTap,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      this.firstImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: this.onTap,
                ),
                SizedBox(height: 8),
                Text(this.name,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'Pirata',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis),
                SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
