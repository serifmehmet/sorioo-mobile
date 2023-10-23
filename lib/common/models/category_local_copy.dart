class CategoryLocalCopy {
  CategoryLocalCopy({
    required this.id,
    required this.name,
    required this.localImageUrl,
  });

  final String id;
  final String name;
  final String localImageUrl;

  static List<CategoryLocalCopy> categoryList() {
    return [
      CategoryLocalCopy(
        id: '28a01196-5c62-4a1d-b6fb-787a8a3be567',
        name: 'İş ve Kariyer',
        localImageUrl: 'assets/images/isvekariyer.png',
      ),
      CategoryLocalCopy(
        id: '15d79c58-5ce6-4adf-8c1a-6bbd3a77a378',
        name: 'Mühendislik',
        localImageUrl: 'assets/images/muhendislik.png',
      ),
      CategoryLocalCopy(
        id: '8d26d827-e1f0-4223-a38a-6dd93c969c85',
        name: 'Yazılım',
        localImageUrl: 'assets/images/yazilim.png',
      ),
      CategoryLocalCopy(
        id: '760c71a1-9d4c-43b9-adb3-27a3c50dfaa2',
        name: 'Tasarım',
        localImageUrl: 'assets/images/tasarim.png',
      ),
      CategoryLocalCopy(
        id: '448e9617-8d38-42ce-8189-c3b3f7ddf0d7',
        name: 'Ofis',
        localImageUrl: 'assets/images/ofis.png',
      ),
    ];
  }
}
