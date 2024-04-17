# sample_list ReadMe

sample_list is a Flutter project designed for learning Isar Database's local DB package. This README serves as a comprehensive guide, covering everything from installation instructions to a detailed description of its features.

## Table of Contents

- [Features](#features)

- [Installation](#installation)

  - [Prerequisites](#prerequisites)

  - [Clone the Repository](#clone-the-repository)

  - [Configuration](#configuration)

  - [Build and Run](#build-and-run)

- [Usage](#usage)

- [Contributing](#contributing)

- [License](#license)

## Features

List the key features and functionalities of sample_list:

- **Customizable**: You can change to any item you like. I'm developing an app to manage cars, so I'm using Databese for car.

- **Local Database Management**: Utilizing Isar Database's local DB package, sample_list allows for efficient management of local databases.

- **List Creation and Management**: Easily create, edit, and delete lists to organize your items efficiently.

- **User-Friendly Interface**: The app boasts a clean and intuitive interface, making it easy for users to navigate and utilize its features.

## Installation

Follow these steps to install and run sample_list on your system.

### Prerequisites

Before you begin, ensure you have the following dependencies and tools installed:

- [isar](https://pub.dev/packages/isar)

- [intl](https://pub.dev/packages/intl)

- [flutter_slidable](https://pub.dev/packages/flutter_slidable)

### Clone the Repository

1. Open your terminal or command prompt.

2. Use the following command to clone the sample_list repository:

```bash
git clone https://github.com/tomgly/sample-list.git
```

### Configuration

1. Change your working directory to the cloned repository:

```bash
cd sample-list
```

2. Install the required dependencies using:

```bash
flutter pub get
```

3. If you want to change your items, edit this [collections/car.dart](lib/collections/car.dart) or create a new file like this:

```dart
import 'package:isar/isar.dart';

part '[File Name].g.dart';

@Collection()
class [File Name] {
  /// ID to auto-increment
  Id id = Isar.autoIncrement;

  /// Item Name
  late String name;
}
```

4. Run the following command to generate an auto-generated file of collection classes:

```bash
flutter pub run build_runner build
```

When executed, *.g.dart file is automatically generated as follows this:

```
.
└── collections
    ├── [File Name].dart
    ├── [File Name].g.dart
```


### Build and Run

1. Connect your device or start an emulator.

2. To build and run the project, use the following command:

```bash
flutter build
flutter run
```

This will build the project and install it on your connected device or emulator.

## Usage

Once the application is running, you can start creating item lists and managing your items effortlessly.

## Contributing

We welcome contributions to sample_list. If you would like to contribute to the development or report issues, please follow these guidelines:

1. Fork the repository.

2. Create a new branch for your feature or bug fix.

3. Make your changes and commit them with descriptive messages.

4. Push your changes to your fork.

5. Submit a pull request to the main repository.

## License

sample_list is licensed under the [MIT](LICENSE).

Thank you for choosing and reading all sample_list! If you encounter any issues or have suggestions for improvements, please don't hesitate to [create an issue](https://github.com/tomgly/sample_list/issues) or [contribute to the project](#contributing). We look forward to your feedback and collaboration.