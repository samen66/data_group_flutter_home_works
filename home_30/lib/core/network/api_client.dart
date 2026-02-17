import 'dart:convert';
import 'package:http/http.dart' as http;

/// Abstract API client interface
abstract class ApiClient {
  Future<Map<String, dynamic>> get(String endpoint);
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body);
}

/// Real API client implementation using HTTP
class RealApiClient implements ApiClient {
  final http.Client client;
  final String baseUrl;

  RealApiClient({
    required this.client,
    this.baseUrl = 'https://jsonplaceholder.typicode.com',
  });

  @override
  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}

/// Mock API client for testing and development
class MockApiClient implements ApiClient {
  final Duration delay;

  MockApiClient({this.delay = const Duration(milliseconds: 500)});

  @override
  Future<Map<String, dynamic>> get(String endpoint) async {
    await Future.delayed(delay);
    
    // Simulate different responses based on endpoint
    if (endpoint.contains('/users/')) {
      return {
        'id': 1,
        'name': 'Mock User',
        'username': 'mockuser',
        'email': 'mock@example.com',
      };
    }
    
    return {
      'id': 1,
      'title': 'Mock Data',
      'body': 'This is mock data for testing',
    };
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    await Future.delayed(delay);
    return {
      'id': 999,
      ...body,
      'created': DateTime.now().toIso8601String(),
    };
  }
}
