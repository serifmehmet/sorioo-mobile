import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/features/category/domain/models/category.dart';
import 'package:sorioo/features/seller/application/seller_service.dart';

part 'seller_category_dropdown_contoller.g.dart';

@riverpod
class SellerCategoryDropdownController extends _$SellerCategoryDropdownController {
  @override
  FutureOr<List<Category>?> build() {
    return _fetchCategories();
  }

  SellerService get sellerService => ref.read(sellerServiceProvider);

  Future<List<Category>?> _fetchCategories() async {
    final categories = await sellerService.fetchCategories();
    return categories;
  }
}
