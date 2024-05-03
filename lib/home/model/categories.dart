class Category{
  final int id;
  final String name;

  Category({
    required this.id, 
    required this.name});
}
  final List<Category> listCategory = [
      Category(id: 1, name: 'All'),
      Category(id: 2, name: 'Smartphones'),
      Category(id: 3, name: 'Headphones'),
      Category(id: 4, name: 'Laptop'),
      Category(id: 5, name: 'Keyboard'),
  ];