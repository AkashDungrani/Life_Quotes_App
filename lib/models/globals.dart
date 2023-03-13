class CatOrAuthArgs {
  final String title;
  final bool isAuthorCat;

  CatOrAuthArgs({
    required this.title,
    required this.isAuthorCat,
  });
}


class Category {
  final String category;
  final String title;

  Category({required this.category, required this.title});
}


class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}
