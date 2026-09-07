enum Status {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == .initial;
  bool get isLoading => this == .loading;
  bool get isSuccess => this == .success;
  bool get isError => this == .error;

  T map<T>({
    required T Function() onInitial,
    required T Function() onLoading,
    required T Function() onSuccess,
    required T Function() onError,
  }) => switch (this) {
    .initial => onInitial(),
    .loading => onLoading(),
    .success => onSuccess(),
    .error => onError(),
  };

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? onInitial,
    T Function()? onLoading,
    T Function()? onSuccess,
    T Function()? onError,
  }) => switch (this) {
    .initial => onInitial?.call() ?? orElse(),
    .loading => onLoading?.call() ?? orElse(),
    .success => onSuccess?.call() ?? orElse(),
    .error => onError?.call() ?? orElse(),
  };
}
