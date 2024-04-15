import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheNetworkImageHelper {
  static CachedNetworkImage getImage(String url){
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) =>
          CupertinoActivityIndicator(color: Colors.grey.shade400,),
      errorWidget: (context, url, error) =>
      const Icon(Icons.image_outlined),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
