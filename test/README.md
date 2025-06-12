# CoinIn App Testing

## Test Description

This folder contains unit tests for the photo selection functionality in the CoinIn app.

### Test Files:
- `coin_bloc_test.dart` - tests for CoinBloc (photo selection logic)
- `widget_test.dart` - basic widget test

## What is Tested

### CoinBloc Tests:
1. **Initial State** - verifies that the bloc starts with the correct state
2. **Photo Selection** - tests the process of selecting an image from gallery  
3. **Loading States** - checks isLoading states
4. **Equality** - tests that states are compared correctly
5. **CopyWith** - verifies that copyWith works correctly
6. **File Operations** - mocks file operations

## How to Run Tests

### Install Dependencies
```bash
flutter pub get
```

### Run All Tests
```bash
flutter test
```

### Run Specific Test
```bash
flutter test test/coin_bloc_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### View Coverage Results
```bash
# Install lcov (macOS)
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open report in browser
open coverage/html/index.html
```

## Test Structure

```
test/
├── README.md              # This instruction
├── coin_bloc_test.dart    # Unit tests for CoinBloc
└── widget_test.dart       # Widget tests
```

## Testing Libraries Used

- `flutter_test` - Flutter's basic testing library
- `bloc_test` - BloC pattern testing  
- `mocktail` - creating mock objects

## Example Commands

```bash
# Run tests in watch mode
flutter test --watch

# Run tests with verbose output
flutter test --verbose

# Run only one test group
flutter test --name "CoinBloc"

# Run tests with tags
flutter test --tags unit
```

## Adding New Tests

1. Create a new `*_test.dart` file in the `test/` folder
2. Import necessary libraries
3. Use `group()` for grouping tests
4. Use `test()` for unit tests
5. Use `blocTest()` for testing BloC

## Useful Tips

- Always add `setUp()` and `tearDown()` for initialization
- Use descriptive test names in English
- Group similar tests together
- Mock external dependencies
- Test both successful and unsuccessful scenarios 