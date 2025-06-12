part of 'coin_bloc.dart';

class CoinState extends Equatable {
  const CoinState({
    this.coinImage,
    this.isLoading = false,
  });

  final File? coinImage;
  final bool isLoading;

  CoinState copyWith({
    File? coinImage,
    bool? isLoading,
  }) {
    return CoinState(
      coinImage: coinImage ?? this.coinImage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [coinImage, isLoading];
}
