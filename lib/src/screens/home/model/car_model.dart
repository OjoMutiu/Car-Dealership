
class Car {
  late final String make, model, body, transmission, fuel, region, condition;
  final List<String> color, images;
  final String? certified, description;
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
      this.certified,
      required this.region,
      required this.condition,
      this.rating = 0.0,
      this.description,
      required this.priceOfCar,
      required this.yearOfManufacture,
      required this.mileage,
      this.isFavourite,
      required this.isRegistered});
}

List<Car> demoCars = [
  Car(
      images: ['assets/images/home_screen/image1.png'],
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
      condition: 'Foreign Used'),
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
      condition: 'Nigerian Used'),

];
