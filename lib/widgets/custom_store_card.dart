

import 'package:flutter/material.dart';
import 'package:mobile_local_db/models/fovorite_stores_model.dart';
import 'package:mobile_local_db/models/store_model.dart';
import 'package:provider/provider.dart';



class CustomStoreCard extends StatefulWidget {
  final StoreModel store;
  final VoidCallback? onTap;

  CustomStoreCard({required this.store, this.onTap});

  @override
  State<CustomStoreCard> createState() => _CustomStoreCardState();
}

class _CustomStoreCardState extends State<CustomStoreCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shadowColor: Colors.grey[500],
        color: Color.fromARGB(255, 235, 233, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.store.storeName != null)
                          Text(
                            widget.store.storeName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        Row(
                          children: [
                            if (widget.store.storeType != null)
                              Text(
                                widget.store.storeType!,
                              ),
                            SizedBox(width: 20),
                            Icon(Icons.location_on),
                            if (widget.store.location != null)
                              Text(
                                widget.store.location!,
                                style: TextStyle(),
                              ),
                              SizedBox(width: 100,),
                            IconButton(
                              icon: Icon(
                                widget.store.is_favourite ?? false
                                    ? Icons.star_rate
                                    : Icons.star_border,
                                color: widget.store.is_favourite ?? false
                                    ? Color.fromARGB(255, 132, 119, 1)
                                    : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.store.is_favourite =
                                      !(widget.store.is_favourite ?? false);

                                  Provider.of<FavoriteStoresModel>(context, listen: false)
                                  .toggleFavorite(widget.store);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}