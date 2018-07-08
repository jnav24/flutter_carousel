final List<CardViewModel> demoCards = [
  new CardViewModel(
      backdropAssetPath: 'assets/night-bloom.jpg',
      address: '10TH Street',
      minHeightInFeet: 2,
      maxHeightInFeet: 3,
      tempInDegrees: 65.1,
      weatherType: 'Mostly Cloudy',
      windSpeedInMph: 11.2,
      cardinalDirection: 'ENE'
  ),
  new CardViewModel(
      backdropAssetPath: 'assets/LHfjRs7.jpg',
      address: '10TH Street North\nTo 14 Street no...',
      minHeightInFeet: 6,
      maxHeightInFeet: 7,
      tempInDegrees: 54.5,
      weatherType: 'Rain',
      windSpeedInMph: 20.5,
      cardinalDirection: 'E'
  ),
  new CardViewModel(
      backdropAssetPath: 'assets/cPryUMQ.jpg',
      address: 'Bells Beach',
      minHeightInFeet: 3,
      maxHeightInFeet: 4,
      tempInDegrees: 61.0,
      weatherType: 'Sunny',
      windSpeedInMph: 19.9,
      cardinalDirection: 'W'
  ),
];

class CardViewModel {
  final String backdropAssetPath;
  final String address;
  final int minHeightInFeet;
  final int maxHeightInFeet;
  final double tempInDegrees;
  final String weatherType;
  final double windSpeedInMph;
  final String cardinalDirection;

  CardViewModel({
    this.backdropAssetPath,
    this.address,
    this.minHeightInFeet,
    this.maxHeightInFeet,
    this.tempInDegrees,
    this.weatherType,
    this.windSpeedInMph,
    this.cardinalDirection
  });
}