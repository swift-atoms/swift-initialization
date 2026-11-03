# swift-initialization

Use this package when generic code has to make a value from nothing: either from its type alone, via `Initiable` (a type you can build with no arguments, including `~Copyable` types and types whose `init()` throws a typed error), or from a value that makes elements on request, via `Initialization.Protocol` (also spelled `Initializing`), with `Initialization.Witness<Element, Failure>` as its closure-backed, copyable form. Start from `Initiable` when the type itself knows how to start; start from `Initialization.Witness<Element, Failure>` when the way of making a value has to be passed around or stored.

## Laws

- An `Initiable` conformer's `init()` either returns its empty value or throws. Every standard-library conformer (`Swift.Array`, `Swift.ContiguousArray`, `Swift.ArraySlice`, `Swift.Set`, `Swift.Dictionary`, `Swift.String`, `Swift.Substring`) returns an empty instance.
- Nothing is cached. Each `make()` on an `Initialization.Witness<Element, Failure>` runs its closure again. Each `make()` on `Initiable.initializer` calls `init()` again, so every call returns a fresh empty value that changes to an earlier result cannot reach.
