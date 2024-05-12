# Create new view

1. in `scripts/generate_views/exec.dart` add the path and viewname

```dart
Map<String, String> views = {
'account/deletion': 'account_deletion',
};
```

2. run this command to create view

```bash
dart scripts/generate_views/exec.dart
```
