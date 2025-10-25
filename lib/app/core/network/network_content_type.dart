enum NetworkContentType {
  applicationJson,
  multipartForm;

  Map<String, String> get header {
    var key = "Content-Type";

    switch (this) {
      case NetworkContentType.applicationJson:
        return {key: "application/json"};
      case NetworkContentType.multipartForm:
        return {key: "multipart/form-data"};
    }
  }
}
