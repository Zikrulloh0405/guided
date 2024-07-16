import "package:flutter_svg/flutter_svg.dart";
import "package:webview_flutter/webview_flutter.dart";

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.svgPicture,
    this.webViewController,
  });
  late SvgPicture svgPicture;
  late String name;
  WebViewController? webViewController;
}
