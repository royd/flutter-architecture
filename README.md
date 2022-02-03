# architecture

A Flutter architecture proposal

## Dependencies
1. Prefer class instances over static classes
2. Depend on abstractions, not concretions
3. Use `get_it` to locate dependencies
4. Define a public static variable named `get` in its own top-level file, e.g `final get = GetIt.instance;`, for import by other files
5. Prefer using `get` as a callable, e.g. `get<MyBloc>()` instead of `get.get<MyBloc>()`
6. Register a dependency within the scope appropriate to its lifetime and unregistered afterward
7. Prefer lazy registration

## Shared UI State
1. Use the name suffix `Bloc`
2. Inputs are methods
3. Outputs are streams
4. Stream implementations are `rxdart` [subjects](https://pub.dev/documentation/rxdart/latest/rx_subjects/rx_subjects-library.html)
6. Implement `Disposable` to clean up resources
7. Use a `StatefulWidget` to register and unregister close to usage in the `Widget` tree

## Data
1. Use the name suffix `Dto`
2. In a folder named `dtos`
3. Must be immutable
4. Do not contain logic
5. If serializable, fields are nullable

## App Components
1. Stateful use the name suffix `Manager`
2. Stateless use the name suffix `Service`
3. HTTP clients use the name suffix `Client`
