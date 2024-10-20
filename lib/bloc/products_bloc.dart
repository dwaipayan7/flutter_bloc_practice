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

        // Fetching data from the API
        var response = await http.get(
          Uri.parse('https://fakestoreapi.com/products'),
        );

        if (response.statusCode == 200) {
          // Parse the response body and convert to Product list
          List<Product> products = (json.decode(response.body) as List)
              .map((json) => Product.fromJson(json))
              .toList();
          ProductsLoadedState(productModel: products);

        } else {
          ProductsErrorState(errorMessage: "Fetching Error");
        }
      } catch (e) {
        ProductsErrorState(errorMessage: e.toString());
      }
    });
  }
}
