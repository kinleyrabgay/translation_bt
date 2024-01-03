enum FeatureLabel {
  speech,
  text,
}

extension FeatureLabelExtension on FeatureLabel {
  String get label {
    switch (this) {
      case FeatureLabel.speech:
        return 'Speech';
      case FeatureLabel.text:
        return 'Text';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case FeatureLabel.speech:
        return '🗣️';
      case FeatureLabel.text:
        return '📝';
      default:
        return '';
    }
  }
}
