
# Loading Modal Button
This package allow indicating async process on modal screen after tap button    


## Features

You can use Flutter default buttons, and also custom widget.  
Below, you can use button type.  
- ElevatedButton
- OutlinedButton
- TextButton
- IconButton

## Getting started

```
import 'package:loading_modal_button/loading_modal_button.dart';
```

## Usage
### Easy Usage
```dart
LoadingModalButton(
  onPressed: () async {
    // async process
  },
),
```

### Another Default Flutter Buttons Usage
```dart
LoadingModalButton(
  buttonType: ButtonType.outlined,
  // You can choose [ButtonType.elevated], [ButtonType.outlined], [ButtonType.text]
  onPressed: () async {
  },
),
```

### After async example
```dart
  LoadingModalButton(
    onPressed: () async {
      await Future.delayed(const Duration(seconds: 1));
    },
    afterAsync: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SnackBar'),
        ),
      );
    },
  ),
```

