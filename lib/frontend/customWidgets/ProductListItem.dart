import '../../backend/Enums/ScanResult.dart';
import './CircularImage.dart';
import './ResultCircle.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductListItem extends StatelessWidget {
  ImageProvider image;
  String name;
  DateTime scanDate;
  ScanResult scanResult;
  void Function() onProductSelected;

  ProductListItem({
    Key key,
    this.image,
    this.name,
    this.scanDate,
    this.scanResult,
    this.onProductSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        //color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, color: Colors.indigo[200]),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ListTile(
          leading: CircularImage(
            diameter: 40.0,
            image: image,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: Text(
            'gescannt am ' + new DateFormat('dd.MM.yyyy').format(scanDate),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ResultCircle(
                result: scanResult,
                small: true,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          onTap: onProductSelected,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Theme.of(context).accentColor,
            blurRadius: 4.0,
            offset: new Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }
}