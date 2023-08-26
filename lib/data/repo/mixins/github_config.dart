mixin GithubConfig {
  String get url => 'https://api.github.com';

  errorResponse(int statusCode) {
    return switch (statusCode) {
      403 => throw Exception('Api rate limit exceeded. Try again later...'),
      404 => throw Exception('Not found'),
      422 => throw Exception('Request validation error'),
      500 => throw Exception('Server error'),
      _ => throw Exception('Unknown error')
    };
  }
}
