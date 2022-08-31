class CommonPaths {
  static final CommonPaths _singleton = CommonPaths._internal();

  factory CommonPaths() {
    return _singleton;
  }
  final _assetsDIR = "assets/";
  String _imagesDIR = "";
  String _testingImage = "";
  String _logoWithoutName = "";
  String _googleIcon = "";
  String _facebookIcon = "";

  CommonPaths._internal() {
    _imagesDIR = "${_assetsDIR}images/";
    _testingImage = "${_imagesDIR}testing_image.jpg";
    _logoWithoutName = "${_imagesDIR}logo_without_name.png";
    _googleIcon = "${_imagesDIR}google_icon.jpg";
    _facebookIcon = "${_imagesDIR}fb_icon.png";
  }

  String get facebookIcon => _facebookIcon;

  String get googleIcon => _googleIcon;

  String get logoWithoutName => _logoWithoutName;

  String get testingImage => _testingImage;
}
