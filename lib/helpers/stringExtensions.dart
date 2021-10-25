extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String truncate(int cutoff) {
    return (this.length <= cutoff) ? this : '${this.substring(0, cutoff)}...';
  }
}
