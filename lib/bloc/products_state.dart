part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable{



  @override
  // TODO: implement props
  List<Object?> get props => [];
}



final class ProductsblocInitial extends ProductsState {}


final class ProductsLoadingState extends ProductsState {}


final class ProductsLoadedState extends ProductsState {
  final List<Product> productModel;

  ProductsLoadedState({required this.productModel});
  @override
  List<Object> get props => [productModel];
}


final class ProductsErrorState extends ProductsState {

  final String errorMessage;

  ProductsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}