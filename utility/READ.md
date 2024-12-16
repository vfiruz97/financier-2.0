# Utility

Every utility package can rely solely on another utility package. This constitutes the foundational level of our project, which is not directly tied to the project itself and can be reused in other applications.

```bash
flutter create --template=package my_flutter_package

dart create -t package-simple my_dart_package

dart run build_runner build --delete-conflicting-outputs
```
