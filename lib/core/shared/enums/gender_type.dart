enum GenderType {
  MAN(title: 'آقا'),
  WOMAN(title: 'خانم');

  const GenderType({
    required this.title,
  });

  final String title;
}
