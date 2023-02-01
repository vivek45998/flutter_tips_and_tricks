class NetworkConstant {
  static const baseUrl = "http://10.10.20.52:3001/api";
  static const baseUrlV2 = "http://10.10.20.52:3001/api";
  static const ngrokBaseUrl = "http://10.10.20.52:3001/api";

  static const ngrokCheckOutUrl = "$ngrokBaseUrl/checkout";
  static const ngrokLoggedInUrl = "$ngrokBaseUrl/stdLogIn";
  static const ngrokAddUserUrl = "$ngrokBaseUrl/stdDataAdd";
  static const ngrokUpdateUserUrl = "$ngrokBaseUrl/stdDataUpdate";
  static const ngrokDeleteUserUrl = "$ngrokBaseUrl/stdDataDelete";
  static const ngrokGetUserUrl = "$ngrokBaseUrl/stdDataGet";
  static const checkOut = "$baseUrl/checkout";
  static const gPayCardSaveAndSuccessReturnUrlApi = "$baseUrlV2/cardSave";
  static const userListApi="http://localhost:3001/users/user-profile";

  ///autorization key
  static const authKey =
      "Basic eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoidml2ZWswMSIsImlhdCI6MTY3NTI4NjIyNSwiZXhwIjoxNjc1MjkzNDI1fQ.dImjaLmOL9EYNBG427rtm3W8OWKBA9nzFvLd7yuPJ54";
}
