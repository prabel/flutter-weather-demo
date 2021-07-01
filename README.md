# Demo Weather App

This project is created in flutter using Bloc and Provider.

## Getting Started

Requirements:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (v2.2.2)
- [Dart SDK](https://dart.dev/get-dart) (>=2.12.0 <3.0.0)
- [Android Studio](https://developer.android.com/studio) (4.0.1 or newer) or IntelliJ IDEA (2020.3.3 or newer)
- [XCode 12.4](https://developer.apple.com/xcode/) or newer (only for Mac users)

Run the following command to see if there are any dependencies you need to install to complete the setup:
```shell
 flutter doctor
```

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
TODO: add repo dir
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `freezed` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

*More about [build_runner](https://dart.dev/tools/build_runner)*

**Step 4:**

To generate environment config file with host address, instabug_token etc just run:
```sh
flutter pub run environment_config:generate
```


**IMPORTANT:**
To run application, you have to set `weather_api_key` inside `environment_config.yaml` file and run commend. 
```sh
flutter pub run environment_config:generate
```
API key you can generate on https://openweathermap.org/api

## Architecture

This project is based on a combination of Clean Architecture and [BLoC pattern](https://bloclibrary.dev/#/).

![](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)

Every "feature" of the app, will be divided into 3 layers - `presentation`, `domain` and `data`

**Presentation:**

This layer is responsible for UI, and everything which is connected with user interactions.
In most of the cases, it will be divided into 3 packages:
* `bloc` - with all bloc's (or cubit) and states used in this feature,
* `pages` - which defines all high level scaffolds, in most cases with some AppBar which includes title and navigation button,
* `components` - all smaller widgets used in this feature.

**Domain:**

This layer will contain only the core business logic (use cases) and business objects (entities). It should be totally independent of every other layer.
Domain layer will be divided into 3 packages:
* `entities` - all business objects and holders used in this feature,
* `repositories` - which should contain only abstract definition of repository,
* `usecases` - with classes which encapsulate all the business logic of a particular use case of the app.

**Data:**

The data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources, in our case defined inside `.graphql` files.
This layer contains 2 packages:
* `models`
* `repositories` - with implementation for all repositories defined inside `domain` layer.

## Testing

### Golden tests
To update all golden tests, run:
```sh
flutter test --update-goldens
```
or if you want to update specific test
```sh
flutter test --update-goldens --name=Golden
```

## Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- doc
|- graphql
|- ios
|- lib
|- test
|- tools
```

Here is the folder structure, with flutter implementation:

```
lib/
|- app/
    |- environment_config.dart
    |- theme.dart
    |- router.dart
|- core/
    |- data/
    |- error/
    |- extensions/
    |- repositories/
    |- usecases/
    |- util/
|- features/
    |- common/
        |- ...
    |- home/
        |- ...
    |- location/
        |- ...
    |- search/
        |- ...
    |- weather/
        |- ...
|- main.dart
```

### Libraries & Tools Used

The most important packages used in this project:

* [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
* [Dio](https://pub.dev/packages/dio)
* [Freezed](https://pub.dev/packages/freezed)
* [Dartz](https://pub.dev/packages/dartz)
* [Cached network image](https://pub.dev/packages/cached_network_image)
* [Geolocator](https://pub.dev/packages/geolocator/)