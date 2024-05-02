import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/auth/domain/entities/user.dart';
import 'package:emotion/src/features/auth/domain/usecases/register_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const User testUser = User(
    name: 'Test',
    email: 'test@example.com',
    password: 'password',
  );

  test('should return a User object when the user is registered', () async {

    final MockUserRepository mockUserRepository = MockUserRepository(); 
    when(mockUserRepository.registerUser(testUser.name, testUser.email, testUser.password))
        .thenAnswer((_) async => const Right(testUser));

    final RegisterUserUseCase registerUserUseCase = RegisterUserUseCase(mockUserRepository);
    final Either<Failure, User> result = await registerUserUseCase.execute(
      testUser.name,
      testUser.email,
      testUser.password,
    );

    expect(result, const Right(testUser));
    verify(mockUserRepository.registerUser(
      testUser.name,
      testUser.email,
      testUser.password,
    ),);
    verifyNoMoreInteractions(mockUserRepository);
  });
}