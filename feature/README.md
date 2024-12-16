Folder Structure in feature.

```bash

lib/
|- src/
|---- di
|---- domain/
|-------- api/
|-------- model/
|-------- repository/
|---- navigator
|---- presentation/
|-------- bloc/
|- marvel_characters.dart

```

di — a place for DI initializer and DI modules
domain — holds all domain-specific classes related to the feature. Domain models, API services, repositories, and use cases go here.
navigator — no feature should know about another feature. When we need to navigate from one feature to another, we create a navigator class that will be defined in the feature, and implemented on the application level.
presentation — holds the UI for the feature. Notice, that we treat bloc as an implementation detail for the UI, that’s why we put bloc in the presentation layer.
