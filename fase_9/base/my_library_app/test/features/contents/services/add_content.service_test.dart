import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_library_app/features/contents/services/add_content.service.dart';
import 'package:my_library_app/shared/entities/content.entity.dart';
import 'package:my_library_app/utils/app.constants.dart';

import '../../../builders/features/contents/dtos/add_content.dto.builder.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final Dio dio;
  late final AddContentService sut;

  setUpAll(() {
    dio = MockDio();
    sut = AddContentService(dio);
    AppConstants.token = 'any_token';
  });

  tearDown(() => reset(dio));

  group('AddContentService -', () {
    final dto = AddContentDTOBuilder.init().build();
    final route =
        '${AppConstants.baseUrl}/categories/${dto.categoryId}/contents';
    final contentMap = {
      'id': 1,
      'name': dto.name,
      'isChecked': false,
    };

    test('Deve chamar o método passando os parametros esperados', () async {
      when(
        () => dio.post(
          route,
          data: dto.toMap(),
          options: AppConstants.dioOptions,
        ),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            data: contentMap,
            statusCode: 200,
            requestOptions: RequestOptions(path: route),
          ),
        ),
      );

      await sut(dto);

      verify(
        () => dio.post(
          route,
          data: dto.toMap(),
          options: AppConstants.dioOptions,
        ),
      ).called(1);
    });

    test('Deve ser lançado um erro, caso seja retornado pela chamada da rota',
        () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'success': false,
            'code': 500,
            'error': 'any_message',
          },
          statusCode: 500,
        ),
      );

      when(
        () => dio.post(
          route,
          data: dto.toMap(),
          options: AppConstants.dioOptions,
        ),
      ).thenThrow(dioException);

      expect(() async => sut(dto), throwsA(dioException));
    });

    test('Deve consumir a rota com sucesso e retornar um Content', () async {
      when(
        () => dio.post(
          route,
          data: dto.toMap(),
          options: AppConstants.dioOptions,
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response(
            data: contentMap,
            statusCode: 200,
            requestOptions: RequestOptions(path: route),
          ),
        ),
      );

      final result = await sut(dto);

      expect(result, equals(Content.fromMap(contentMap)));
    });
  });
}
