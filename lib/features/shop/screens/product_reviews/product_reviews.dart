import 'package:clickcompras/common/widgets/appbar/appbar.dart';
import 'package:clickcompras/common/widgets/products/ratings/rating_indicator.dart';
import 'package:clickcompras/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:clickcompras/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device.utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Comentários e notas'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "As classificações e comentários são verificados e provenientes de pessoas que usam o mesmo tipo de dispositivo que você."
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TOverallProductRating(),
              
              const TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}

