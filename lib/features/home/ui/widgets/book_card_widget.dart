import 'package:cached_network_image/cached_network_image.dart';
import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
            progressIndicatorBuilder: (context, url, progress) {
              return const SkeletonizerWidget(
                child: Skeleton.leaf(
                  child: Card(elevation: 0, clipBehavior: Clip.antiAlias, margin: EdgeInsets.zero),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Skeleton.leaf(
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.kRadius10),
                      topRight: Radius.circular(AppConstants.kRadius10),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: Icon(Icons.book, color: Theme.of(context).colorScheme.primary, size: 40),
                ),
              );
            },
            errorListener: (value) {},
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
            child: ReadMoreText(
              bookItemModel.getFirstSummary() ?? '',
              trimMode: TrimMode.Line,
              trimLines: 3,
              colorClickableText: Theme.of(context).colorScheme.primary,
              trimCollapsedText: ' See More',
              trimExpandedText: ' See Less',
              moreStyle: AppTextStyles.font12Medium.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              style: AppTextStyles.font12Medium.copyWith(color: AppColors.gray),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     right: AppConstants.kHorizontalPadding10,
          //     left: AppConstants.kHorizontalPadding10,
          //     bottom: AppConstants.kVerticalPadding10,
          //   ),
          //   child: ExpandableText(
          //     text: bookItemModel.getFirstSummary() ?? '',
          //     textStyle: AppTextStyles.font12Medium.copyWith(color: AppColors.gray),
          //     expandTextStyle: AppTextStyles.font12Bold.copyWith(
          //       color: Theme.of(context).colorScheme.primary,
          //     ),
          //     collapsedLines: 4,
          //   ),
          // ),
        ],
      ),
    );
  }
}
