import 'dart:developer';

import 'package:design_pattern/composite/category.dart';
import 'package:design_pattern/composite/composite.dart';
import 'package:test/test.dart';

void main() {
  test('withoiut composite', () {
    final category1 = Cateogory("books");
    final category2 = Cateogory("movies");
    final category3 = Cateogory("music");

    log(category1.name);
    log(category2.name);
    log(category3.name);
  });

  test('with composite', () {
    final category1 = CategoryComposite("books", children: [
      Cateogory("fiction"),
      Cateogory("non-fiction"),
    ]);

    final category2 = CategoryComposite("movies", children: [
      Cateogory("action"),
      Cateogory("comedy"),
    ]);

    final category3 = CategoryComposite("music", children: [
      Cateogory("rock"),
      Cateogory("pop"),
    ]);

    // log
    log(category1.name);
    for (var element in category1.children) {
      log("-${element.name}");
    }

    log(category2.name);
    for (var element in category2.children) {
      log("-${element.name}");
    }

    log(category3.name);
    for (var element in category3.children) {
      log("-${element.name}");
    }
  });

  test('with composite & more than 1 child', () {
    final category = CategoryComposite("gadget", children: [
      CategoryComposite("xiaomi", children: [
        Cateogory("redmi"),
        Cateogory("mi"),
      ]),
      CategoryComposite("samsung", children: [
        Cateogory("galaxy"),
        Cateogory("note"),
      ]),
      CategoryComposite("apple", children: [
        Cateogory("iphone"),
        CategoryComposite("macbook", children: [
          Cateogory("air"),
          Cateogory("pro"),
        ]),
      ]),
      Cateogory("Nokia"),
    ]);

    log(category.name);
    for (var element in category.children) {
      if (element is CategoryComposite) {
        log("-${element.name}");
        for (var child in element.children) {
          log("--${child.name}");

          if (child is CategoryComposite) {
            for (var child2 in element.children) {
              log("---${child2.name}");
            }
          }
        }
      } else {
        log("-${element.name}");
      }
    }
  });
}
