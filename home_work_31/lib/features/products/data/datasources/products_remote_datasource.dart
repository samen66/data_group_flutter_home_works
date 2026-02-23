import '../models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    // Demo data - в реальном приложении здесь будет HTTP запрос
    await Future.delayed(const Duration(seconds: 1));
    
    return [
      ProductModel(
        id: '1',
        name: 'Laptop',
        description: 'High-performance laptop for work and gaming',
        price: 1299.99,
        imageUrl: 'https://picsum.photos/400/300?random=1',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      ProductModel(
        id: '2',
        name: 'Smartphone',
        description: 'Latest smartphone with advanced features',
        price: 899.99,
        imageUrl: 'https://picsum.photos/400/300?random=2',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ProductModel(
        id: '3',
        name: 'Headphones',
        description: 'Wireless noise-cancelling headphones',
        price: 299.99,
        imageUrl: 'https://picsum.photos/400/300?random=3',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ProductModel(
        id: '4',
        name: 'Tablet',
        description: 'Portable tablet for reading and entertainment',
        price: 599.99,
        imageUrl: 'https://picsum.photos/400/300?random=4',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
      ProductModel(
        id: '5',
        name: 'Smartwatch',
        description: 'Fitness tracking smartwatch',
        price: 399.99,
        imageUrl: 'https://picsum.photos/400/300?random=5',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }
}
