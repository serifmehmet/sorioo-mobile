import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/features/category/data/category_repository.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

part 'seller_service.g.dart';

class SellerService {
  SellerService(this.ref);

  final Ref ref;

  Future<List<Category>?> fetchCategories() async {
    final categoryTask = ref.read(categoryRepositoryProvider).fetchCategories();

    return (await categoryTask.run()).match(
      (l) => null,
      (categoryList) => categoryList,
    );
  }
}

@Riverpod(keepAlive: true)
SellerService sellerService(SellerServiceRef ref) {
  return SellerService(ref);
}
