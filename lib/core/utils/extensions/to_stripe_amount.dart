// ignore_for_file: file_names

extension ToStripeAmount on double {
  String toStripeAmount() => (this * 100).toInt().toString();
}
