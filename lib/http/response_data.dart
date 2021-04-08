class ResponseData<T> {
  final int code;
  final T data;
  final bool result;
  final String message;
  ResponseData(this.code, this.data, this.result, this.message);
}


class RealResponseData<T> {
  final T data;
  final bool result;
  RealResponseData(this.data, this.result);
}
