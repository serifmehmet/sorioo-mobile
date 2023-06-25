// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// class AppSpacingData extends Equatable {
//   final double zero;
//   final double small;
//   final double semiSmall;
//   final double regular;
//   final double semiBig;
//   final double big;
//   final double extraBig;

//   const AppSpacingData({
//     required this.zero,
//     required this.small,
//     required this.semiSmall,
//     required this.regular,
//     required this.semiBig,
//     required this.big,
//     required this.extraBig,
//   });

//   factory AppSpacingData.regular() => const AppSpacingData(
//         zero: 0,
//         small: 4,
//         semiSmall: 8,
//         regular: 12,
//         semiBig: 20,
//         big: 32,
//         extraBig: 48,
//       );

//   AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);

//   @override
//   List<Object?> get props => [
//         zero,
//         small,
//         semiSmall,
//         regular,
//         semiBig,
//         big,
//         extraBig,
//       ];
// }

// class AppEdgeInsetsSpacingData extends Equatable {
//   const AppEdgeInsetsSpacingData();

//   EdgeInsets get zero => EdgeInsets.all(_spacing.zero);
//   EdgeInsets get small => EdgeInsets.all(_spacing.small);
//   EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
//   EdgeInsets get regular => EdgeInsets.all(_spacing.regular);
//   EdgeInsets get semiBig => EdgeInsets.all(_spacing.semiBig);
//   EdgeInsets get big => EdgeInsets.all(_spacing.big);
//   EdgeInsets get extraBig => EdgeInsets.all(_spacing.extraBig);

//   @override
//   List<Object?> get props => [_spacing];
// }
