
class Car {
  late final String make, model, body, transmission, fuel, region, condition;
  final List<String> color, images;
  final String certified, description;
  late final double priceOfCar, mileage;
  final double? rating;
  late final int yearOfManufacture;
  final bool? isFavourite;
  late final bool isRegistered;

  Car(
      {required this.images,
      required this.make,
      required this.model,
      required this.body,
      required this.transmission,
      required this.fuel,
      required this.color,
      required this.certified,
      required this.region,
      required this.condition,
      this.rating = 0.0,
      required this.description,
      required this.priceOfCar,
      required this.yearOfManufacture,
      required this.mileage,
      this.isFavourite,
      required this.isRegistered});
}

List<Car> demoTopChoiceCars = [
  Car(
      images: ['assets/images/home_screen/img.png',
        'assets/images/home_screen/image1.png',
        'assets/images/home_screen/carPart1.png',
        'assets/images/home_screen/carPart2.png',
        'assets/images/home_screen/carPart1.png',
        'assets/images/home_screen/carPart2.png',
      ],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Manual',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja, Maitama',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Foreign Used'),
  Car(
      images: ['assets/images/home_screen/image2.png',
        'assets/images/home_screen/carPart1.png',
        'assets/images/home_screen/carPart2.png',
        'assets/images/home_screen/carPart1.png',
        'assets/images/home_screen/carPart2.png',
          'assets/images/home_screen/carPart1.png',
        'assets/images/home_screen/carPart2.png',
      ],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image1.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image2.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image1.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image1.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),

];
List<Car> demoOloworayAutosCars = [
  Car(
      images: ['assets/images/home_screen/image3.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Manual',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja, Maitama',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Foreign Used'),
  Car(
      images: ['assets/images/home_screen/image4.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image5.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image3.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image3.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image5.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),

];
List<Car> demoExploreCars = [
  Car(
      images: ['assets/images/home_screen/image6.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Manual',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja, Maitama',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Foreign Used'),
  Car(
      images: ['assets/images/home_screen/image7.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image8.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image9.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image10.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image11.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image13.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
  Car(
      images: ['assets/images/home_screen/image14.png'],
      make: 'Toyota',
      model: 'land cruiser',
      body: 'sedan',
      transmission: 'Automatic',
      fuel: 'Petrol',
      color: ['Red', 'Blue', 'Gray', 'White'],
      certified: 'certified',
      region: 'Abuja',
      priceOfCar: 21000000,
      yearOfManufacture: 2020,
      mileage: 1234,
      isRegistered: true,
      description: 'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
      condition: 'Nigerian Used'),
];