import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_library_app/features/contents/services/remove_content.service.dart';
import 'package:my_library_app/utils/app.constants.dart';

import '../../../builders/features/contents/dtos/remove_content.dto.builder.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final Dio dio;
  late final RemoveContentService sut;

  setUpAll(() {
    dio = MockDio();
    sut = RemoveContentService(dio);
    AppConstants.token = 'any_token';
  });

  tearDown(() => reset(dio));

  group('RemoveContentService -', () {
    final dto = RemoveContentDTOBuilder.init().build();
    final route =
        '${AppConstants.baseUrl}/categories/${dto.categoryId}/contents/${dto.id}';

    test('Deve chamar o método passando os parametros esperados', () async {
      when(
        () => dio.delete(route, options: AppConstants.dioOptions),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: route),
          ),
        ),
      );

      await sut(dto);

      verify(
        () => dio.delete(route, options: AppConstants.dioOptions),
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
        () => dio.delete(route, options: AppConstants.dioOptions),
      ).thenThrow(dioException);

      expect(() async => sut(dto), throwsA(dioException));
    });

    test('Deve consumir a rota com sucesso', () async {
      when(
        () => dio.delete(route, options: AppConstants.dioOptions),
      ).thenAnswer(
        (_) => Future.value(
          Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: route),
          ),
        ),
      );

      expectSync(sut(dto), isA<void>());
    });
  });
}