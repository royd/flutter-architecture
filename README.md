# architecture

A Flutter architecture proposal

## Dependencies
1. Prefer class instances over static classes
2. Depend on abstractions, not concretions
3. Use `get_it` to locate dependencies
4. Use a local private static variable named `_get` in each necessary file, e.g `final _get = GetIt.instance;`
5. Prefer using `_get` as a callable, e.g. `_get<MyBloc>()` instead of `_get.get<MyBloc>()`
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
