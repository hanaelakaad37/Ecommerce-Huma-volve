import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';

class ErrorHandling {
  static Failure handle(dynamic exception) {
    if (exception is DioException) {
      return _handleRemoteError(exception.toString());
    }

    return const Failure(
      errorMessage: "Unexpected Error",
    );
  }

  static Failure _handleRemoteError(String message) {
    final errorMessage = message.trim();

    // 401 - Unauthorized
    if (errorMessage.contains("401") ||
        errorMessage.contains("Unauthorized") ||
        errorMessage.contains("Unauthenticated")) {
      return const Failure(
        errorMessage: "Unauthorized",
      );
    }

    // 403 - Forbidden
    if (errorMessage.contains("403") ||
        errorMessage.contains("Forbidden")) {
      return const Failure(
        errorMessage: "Forbidden",
      );
    }

    // 404 - Not Found
    if (errorMessage.contains("404") ||
        errorMessage.contains("Not Found")) {
      return const Failure(
        errorMessage: "404 Not Found",
      );
    }

    // 422 - Unprocessable Content
    if (errorMessage.contains("422") ||
        errorMessage.contains("Unprocessable Content")) {
      return const Failure(
        errorMessage: "Unprocessable Content",
      );
    }

    // 500 - Internal Server Error
    if (errorMessage.contains("500") ||
        errorMessage.contains("Internal Server Error")) {
      return const Failure(
        errorMessage: "Internal Server Error",
      );
    }

    // No Internet Connection
    if (errorMessage.contains("SocketException") ||
        errorMessage.contains("Connection failed") ||
        errorMessage.contains("HandshakeException")) {
      return const Failure(
        errorMessage: "No Internet Connection",
      );
    }

    // Connection Timeout
    if (errorMessage.contains("Timeout") ||
        errorMessage.contains("Deadline")) {
      return const Failure(
        errorMessage: "Connection Timeout",
      );
    }

    // Processing Error
    if (errorMessage.contains("TypeError") ||
        errorMessage.contains("FormatException")) {
      return const Failure(
        errorMessage: "Processing Error",
      );
    }

    // Return the original error if it is meaningful
    if (errorMessage.isNotEmpty &&
        errorMessage.contains("Exception") &&
        errorMessage.contains("Error")) {
      return Failure(
        errorMessage: errorMessage,
      );
    }

    // Default Error
    return const Failure(
      errorMessage: "Unexpected Error",
    );
  }
}