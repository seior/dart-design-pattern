import 'package:design_pattern/composite/category.dart';

class CategoryComposite extends Cateogory {
  final List<Cateogory> children;

  CategoryComposite(super.name, {required this.children});
}
