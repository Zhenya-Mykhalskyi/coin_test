part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object?> get props => [];
}

class CoinImagePickRequested extends CoinEvent {
  const CoinImagePickRequested();
}
