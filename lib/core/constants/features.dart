class Feature {
  final String src;
  final String dest;
  final String desc;
  final String imgUrl;

  Feature({
    required this.src,
    required this.dest,
    required this.desc,
    required this.imgUrl,
  });
}

List<Feature> features = [
  Feature(
    src: 'speech',
    dest: 'speech',
    desc: 'speech to speech',
    imgUrl: 'assets/images/asr.png',
  ),
  Feature(
    src: 'text',
    dest: 'text',
    desc: 'text to text',
    imgUrl: 'assets/images/nmt.png',
  ),
  Feature(
    src: 'speech',
    dest: 'text',
    desc: 'speech to text',
    imgUrl: 'assets/images/asr.png',
  ),
  Feature(
    src: 'text',
    dest: 'speech',
    desc: 'text to speech',
    imgUrl: 'assets/images/tts.png',
  ),
];
