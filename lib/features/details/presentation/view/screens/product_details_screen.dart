import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app_huma_volve/core/theme.dart';
import 'package:ecommerce_app_huma_volve/core/widgets/primary_button.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/details/presentation/view_model/cubit/details_cubit.dart';
import '../../../details_di/details_cubit_factory.dart';
import '../widgets/share_product_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsCubitFactory.create()..getProductDetails(productId),
      child: _ProductDetailsView(productId: productId),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  final int productId;

  const _ProductDetailsView({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading || state is DetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DetailsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    Text(state.errorMessage, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<DetailsCubit>().getProductDetails(
                          productId,
                        );
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is DetailsSuccess) {
            return _buildDetails(context, state.product);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDetails(BuildContext context, ProductEntity product) {
    final imageUrl = product.images.isNotEmpty ? product.images.first : '';

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          pinned: true,
          backgroundColor: AppTheme.background,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios_new, size: 16),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: imageUrl.isEmpty
                ? _imagePlaceholder()
                : Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _imagePlaceholder(),
                  ),
          ),
          actions: [
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite_border, size: 18),
              ),
              onPressed: () {},
            ),
            ShareProductButton(productId: productId.toString())
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            transform: Matrix4.translationValues(0, -24, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(fontSize: 26, height: 1.2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: AppTheme.primary, fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(product.category.name),
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(height: 1.6, fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: 'Add to Cart',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} added to cart'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppTheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.grey, size: 80),
      ),
    );
  }
}
