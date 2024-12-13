import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:prueba_tecnica_movies/features/movies/data/services/movies_services.dart';
import 'package:prueba_tecnica_movies/features/movies/domain/models/movie.dart';
import 'movies_services_mock.mocks.dart';

void main() {
  group('MoviesServicesImpl', () {
    late MockDio mockDio;
    late MoviesServicesImpl moviesServices;

    setUp(() {
      mockDio = MockDio();
      moviesServices = MoviesServicesImpl(mockDio);

      // Configurar el mock para devolver un objeto `BaseOptions` al acceder a `dio.options`
      when(mockDio.options).thenReturn(BaseOptions());
    });
    test('getTopRatedMovies returns a list of movies', () async {
      // Arrange
      final mockResponse = {
        'results': [
          {
            'id': 1,
            'poster_path': '/poster1.jpg',
            'title': 'Movie 1',
            'vote_average': 8.5,
            'overview': 'Overview of Movie 1',
            'release_date': '2023-12-01',
          },
          {
            'id': 2,
            'poster_path': '/poster2.jpg',
            'title': 'Movie 2',
            'vote_average': 7.9,
            'overview': 'Overview of Movie 2',
            'release_date': '2023-11-15',
          }
        ]
      };

      when(mockDio.get('/movie/top_rated')).thenAnswer(
        (_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/movie/top_rated'),
        ),
      );

      // Act
      final movies = await moviesServices.getTopRatedMovies();

      // Assert
      expect(movies, isA<List<Movie>>());
      expect(movies.length, 2);
      expect(movies[0].title, 'Movie 1');
      expect(movies[0].poster, '/poster1.jpg');
      expect(movies[0].score, '8.5');
    });
  });
}
