enum Status { none, loading, success, error, empty }

class Resource<T> {
  final Status status;
  final T? data;
  final String? message;

  const Resource._(this.status, {this.data, this.message});

  factory Resource.success(T data) =>
      Resource._(Status.success, data: data);

  factory Resource.error(String message, {T? data}) =>
      Resource._(Status.error, data: data, message: message);

  factory Resource.loading({T? data}) =>
      Resource._(Status.loading, data: data);

  factory Resource.empty() =>
      Resource._(Status.empty);

  factory Resource.none() =>
      const Resource._(Status.none);
}
