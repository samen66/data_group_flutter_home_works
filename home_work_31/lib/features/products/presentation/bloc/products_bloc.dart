import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository repository;

  ProductsBloc({required this.repository}) : super(const ProductsState.initial()) {
    on<_LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    _LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(const ProductsState.loading());
    final result = await repository.getProducts();
    result.fold(
      (failure) => emit(ProductsState.error(failure)),
      (products) => emit(ProductsState.loaded(products)),
    );
  }
}
