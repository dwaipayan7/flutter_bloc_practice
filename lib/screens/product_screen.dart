import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/products_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dispatch the event to load products when the screen is built
    context.read<ProductsBloc>().add(ProductsLoadedEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ProductsLoadedState) {
            // Display the fetched products
            return ListView.builder(
              itemCount: state.productModel.length, // Use the actual number of products
              itemBuilder: (context, index) {
                final product = state.productModel[index];
                return ListTile(
                  leading: Image.network(product.image ?? ''),
                  title: Text(product.title ?? 'No Title'),
                  subtitle: Text(product.category ?? 'No Category'),
                  trailing: Text('\$${product.price?.toStringAsFixed(2) ?? 'N/A'}'),
                );
              },
            );
          }
          if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Center(
            child: Text("No Products Found"),
          );
        },
      ),
    );
  }
}
