import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coinin_test/src/core/utils/image_picker_util.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(const CoinState()) {
    on<CoinImagePickRequested>(_onImagePickRequested);
  }

  Future<void> _onImagePickRequested(
    CoinImagePickRequested event,
    Emitter<CoinState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final pickedImage = await ImagePickerUtil.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      emit(state.copyWith(
        coinImage: pickedImage,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}
