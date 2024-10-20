import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';  // Assuming you have this model

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());

        // Fetch products from API
        var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

        if (response.statusCode == 200) {
          // Parse response body into a List of Products
          List<dynamic> jsonResponse = json.decode(response.body);
          List<Product> products = jsonResponse.map((productJson) {
            return Product.fromJson(productJson);
          }).toList();

          emit(ProductsLoadedState(productModel: products));
        } else {
          // If response is not OK, emit an error state
          emit(ProductsErrorState(errorMessage: "Failed to load products. Status code: ${response.statusCode}"));
        }
      } catch (e) {
        // Catch and emit any other errors
        emit(ProductsErrorState(errorMessage: "An error occurred: ${e.toString()}"));
      }
    });
  }
}
