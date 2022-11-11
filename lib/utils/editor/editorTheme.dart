import 'package:flutter/material.dart';

const FontWeight fontWeight = FontWeight.w400;

const Color tagColor = Colors.pinkAccent;
const Color quoteColor = Colors.greenAccent;
const Color attrColor = Colors.amberAccent;
const Color propertyColor = Colors.lightBlueAccent;
const Color idColor = Colors.amber;
const Color classColor = Colors.yellowAccent;

const Color keywordColor = Colors.lightBlueAccent;
const Color methodsColor = Colors.amber;
const Color titlesColor = Colors.amber;

const myTheme = {
  'root': TextStyle(
    backgroundColor: Colors.transparent,
    color: Colors.white,
  ),
  'keyword': TextStyle(color: keywordColor),
  'params': TextStyle(color: Colors.cyan),
  'selector-tag': TextStyle(color: attrColor),
  'selector-id': TextStyle(color: idColor),
  'selector-class': TextStyle(color: classColor),
  'regexp': TextStyle(color: Colors.redAccent),
  'literal': TextStyle(color: Colors.white),
  'section': TextStyle(color: Colors.white),
  'link': TextStyle(color: Colors.white),
  'subst': TextStyle(color: Colors.cyan),
  'string': TextStyle(color: quoteColor),
  'title': TextStyle(color: titlesColor),
  'name': TextStyle(color: tagColor),
  'type': TextStyle(color: tagColor),
  'attribute': TextStyle(color: propertyColor),
  'symbol': TextStyle(color: tagColor),
  'bullet': TextStyle(color: tagColor),
  'built_in': TextStyle(color: methodsColor),
  'addition': TextStyle(color: tagColor),
  'variable': TextStyle(color: tagColor),
  'template-tag': TextStyle(color: tagColor),
  'template-variable': TextStyle(color: tagColor),
  'comment': TextStyle(color: Colors.grey),
  'quote': TextStyle(color: Colors.grey),
  'deletion': TextStyle(color: Colors.grey),
  'meta': TextStyle(color: Colors.grey),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
};
