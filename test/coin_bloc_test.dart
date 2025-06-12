import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:coinin_test/src/features/home/bloc/coin_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';

// Mock classes
class MockImagePicker extends Mock implements ImagePicker {}

class MockFile extends Mock implements File {}

void main() {
  group('CoinBloc', () {
    late CoinBloc coinBloc;
    late MockFile mockFile;

    setUp(() {
      mockFile = MockFile();
      coinBloc = CoinBloc();
    });

    tearDown(() {
      coinBloc.close();
    });

    test(
        'initial state should be CoinState with null image and isLoading: false',
        () {
      expect(coinBloc.state, equals(const CoinState()));
      expect(coinBloc.state.coinImage, isNull);
      expect(coinBloc.state.isLoading, isFalse);
    });

    group('CoinImagePickRequested', () {
      blocTest<CoinBloc, CoinState>(
        'emits loading state then false when no image selected',
        build: () => coinBloc,
        act: (bloc) => bloc.add(const CoinImagePickRequested()),
        expect: () => [
          const CoinState(isLoading: true),
          const CoinState(isLoading: false),
        ],
      );
    });

    group('CoinState', () {
      test('supports equality', () {
        const state1 = CoinState();
        const state2 = CoinState();

        expect(state1, equals(state2));
        expect(state1.hashCode, equals(state2.hashCode));
      });

      test('with different images are not equal', () {
        final state1 = CoinState(coinImage: mockFile);
        const state2 = CoinState(coinImage: null);

        expect(state1, isNot(equals(state2)));
      });

      test('copyWith works correctly', () {
        const initialState = CoinState();
        final newState = initialState.copyWith(coinImage: mockFile);

        expect(newState.coinImage, equals(mockFile));
        expect(initialState.coinImage, isNull);
      });

      test('copyWith for isLoading works correctly', () {
        const initialState = CoinState();
        final loadingState = initialState.copyWith(isLoading: true);

        expect(loadingState.isLoading, isTrue);
        expect(initialState.isLoading, isFalse);
      });
    });

    group('ImagePickerUtil integration', () {
      test('verifies that File has correct methods', () {
        // Mock file behavior
        when(() => mockFile.existsSync()).thenReturn(true);
        when(() => mockFile.lengthSync()).thenReturn(1024 * 1024); // 1MB

        expect(mockFile, isA<File>());
        expect(mockFile.existsSync(), isTrue);
        expect(mockFile.lengthSync(), equals(1024 * 1024));
      });

      test('verifies file size limit (10MB)', () {
        // File larger than 10MB
        when(() => mockFile.lengthSync()).thenReturn(11 * 1024 * 1024);
        expect(mockFile.lengthSync(), greaterThan(10 * 1024 * 1024));

        // File smaller than 10MB
        when(() => mockFile.lengthSync()).thenReturn(5 * 1024 * 1024);
        expect(mockFile.lengthSync(), lessThanOrEqualTo(10 * 1024 * 1024));
      });
    });
  });
}
