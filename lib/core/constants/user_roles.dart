import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRoles {
  @JsonValue('BUYER')
  buyer,
  @JsonValue('SELLER')
  seller,
}

extension SelectUserRole on UserRoles {
  bool get isSeller {
    switch (this) {
      case UserRoles.seller:
        return true;
      case UserRoles.buyer:
        return false;
    }
  }
}
