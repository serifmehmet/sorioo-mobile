enum ServiceLength {
  unlimited(value: 'unlimited', title: 'Sınırsız'),
  uptoSixty(value: 'upToSixty', title: '30 - 60dk.');

  const ServiceLength({
    required this.value,
    required this.title,
  });
  final String value;
  final String title;
}
