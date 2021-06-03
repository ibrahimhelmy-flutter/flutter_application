import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markets/src/models/field.dart';

import '../models/category.dart';
import '../models/route_argument.dart';

// ignore: must_be_immutable
class CategoriesCarouselItemWidget extends StatelessWidget {
  double marginLeft;
  Field category;
  int index;
  CategoriesCarouselItemWidget(
      {Key key, this.marginLeft, this.category, this.index})
      : super(key: key);
  int currentindex;
  int secondindex;
  int thirdIndex;
  int fourIndex;
  int fiveIndex;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      currentindex = 10;
      secondindex = 16;
      thirdIndex = 18;
      fourIndex = 17;
      fiveIndex = 19;
    } else if (index == 1) {
      currentindex = 5;
      secondindex = 2;
    } else if (index == 2) {
      currentindex = 29;
      secondindex = 30;
    } else if (index == 3) {
      currentindex = 7;
      secondindex = 8;
    } else if (index == 4) {
      currentindex = 20;
      secondindex = 21;
      
      fourIndex = 14;
      fiveIndex = 22;
    } else if (index == 5) {
      currentindex = 9;
      secondindex = 13;
      thirdIndex = 15;
      fourIndex = 11;
      fiveIndex = 12;
    }
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/Category',
            arguments: RouteArgument(id: currentindex.toString(), param: {
              "name": category.name,
              "second": secondindex.toString(),
              "third": thirdIndex.toString(),
              "four": fourIndex.toString(),
              "five": fiveIndex.toString()
            }));
      },
      // child: Text(category.name)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: category.id,
            child: Container(
              margin:
                  EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).focusColor.withOpacity(0.2),
                        offset: Offset(0, 2),
                        blurRadius: 7.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: category.image.url.toLowerCase().endsWith('.svg')
                    ? SvgPicture.network(
                        category.image.url,
                        color: Theme.of(context).accentColor,
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: category.image.icon,
                        placeholder: (context, url) => Image.asset(
                          'assets/img/loading.gif',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error_outline),
                      ),
              ),
            ),
          ),
          SizedBox(height: 5),
          FittedBox(
            child: Container(
              width: 100,
              margin: EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
              child: Text(
                category.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
