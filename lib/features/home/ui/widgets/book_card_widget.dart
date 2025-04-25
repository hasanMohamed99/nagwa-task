import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nagwa_task/core/core.dart';
import '../../home_feature.dart';
import 'expandable_text.dart';

class BookCardWidget extends StatelessWidget {
  /// The [BookItemModel] object that contains the book details.
  final BookItemModel bookItemModel;
  const BookCardWidget({super.key, required this.bookItemModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.kRadius10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: bookItemModel.getImageLink(),
            fit: BoxFit.cover,
            height: 190,
            width: double.infinity,
            placeholder: (context, url) {
              return const Icon(Icons.image);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: AppConstants.kHorizontalPadding10,
              left: AppConstants.kHorizontalPadding10,
              top: AppConstants.kVerticalPadding10,
            ),
            child: Text(
              bookItemModel.title,
              style: AppTextStyles.font16Bold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding10,
              vertical: AppConstants.kVerticalPadding10,
            ),
            child: Text(
              bookItemModel.getAuthorNames(),
              style: AppTextStyles.font12Bold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: AppConstants.kHorizontalPadding10,
              left: AppConstants.kHorizontalPadding10,
              bottom: AppConstants.kVerticalPadding10,
            ),
            child: ExpandableText(
              text: bookItemModel.getFirstSummary() ?? '',
              textStyle: AppTextStyles.font12Medium.copyWith(color: AppColors.gray),
              expandTextStyle: AppTextStyles.font12Bold.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              collapsedLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
