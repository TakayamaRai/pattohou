import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingStatus {
  final String text;
  final bool isLoading;

  const LoadingStatus({this.text = "しばらくお待ちください", this.isLoading = false});

  LoadingStatus copyWith({String? text, bool? isLoading}) {
    return LoadingStatus(text: text ?? this.text, isLoading: isLoading ?? this.isLoading);
  }
}

class LoadingStatusNotifier extends StateNotifier<LoadingStatus> {
  LoadingStatusNotifier() : super(const LoadingStatus());

  void start([String text = "しばらくお待ちください"]) {
    state = state.copyWith(text: text, isLoading: true);
  }

  void end() {
    state = state.copyWith(isLoading: false);
  }
}

final loadingStatusProvider = StateNotifierProvider<LoadingStatusNotifier, LoadingStatus>((_) => LoadingStatusNotifier());
