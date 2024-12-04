// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizHistoryNotifierHash() =>
    r'dd73f5f092cafa8c7457e801b9d1941a7fc2d3a6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$QuizHistoryNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<QuizHistory>> {
  late final SharedPreferences prefs;

  FutureOr<List<QuizHistory>> build(
    SharedPreferences prefs,
  );
}

/// Notifier that manages the quiz history state
///
/// Copied from [QuizHistoryNotifier].
@ProviderFor(QuizHistoryNotifier)
const quizHistoryNotifierProvider = QuizHistoryNotifierFamily();

/// Notifier that manages the quiz history state
///
/// Copied from [QuizHistoryNotifier].
class QuizHistoryNotifierFamily extends Family<AsyncValue<List<QuizHistory>>> {
  /// Notifier that manages the quiz history state
  ///
  /// Copied from [QuizHistoryNotifier].
  const QuizHistoryNotifierFamily();

  /// Notifier that manages the quiz history state
  ///
  /// Copied from [QuizHistoryNotifier].
  QuizHistoryNotifierProvider call(
    SharedPreferences prefs,
  ) {
    return QuizHistoryNotifierProvider(
      prefs,
    );
  }

  @override
  QuizHistoryNotifierProvider getProviderOverride(
    covariant QuizHistoryNotifierProvider provider,
  ) {
    return call(
      provider.prefs,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'quizHistoryNotifierProvider';
}

/// Notifier that manages the quiz history state
///
/// Copied from [QuizHistoryNotifier].
class QuizHistoryNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    QuizHistoryNotifier, List<QuizHistory>> {
  /// Notifier that manages the quiz history state
  ///
  /// Copied from [QuizHistoryNotifier].
  QuizHistoryNotifierProvider(
    SharedPreferences prefs,
  ) : this._internal(
          () => QuizHistoryNotifier()..prefs = prefs,
          from: quizHistoryNotifierProvider,
          name: r'quizHistoryNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizHistoryNotifierHash,
          dependencies: QuizHistoryNotifierFamily._dependencies,
          allTransitiveDependencies:
              QuizHistoryNotifierFamily._allTransitiveDependencies,
          prefs: prefs,
        );

  QuizHistoryNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prefs,
  }) : super.internal();

  final SharedPreferences prefs;

  @override
  FutureOr<List<QuizHistory>> runNotifierBuild(
    covariant QuizHistoryNotifier notifier,
  ) {
    return notifier.build(
      prefs,
    );
  }

  @override
  Override overrideWith(QuizHistoryNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizHistoryNotifierProvider._internal(
        () => create()..prefs = prefs,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prefs: prefs,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<QuizHistoryNotifier,
      List<QuizHistory>> createElement() {
    return _QuizHistoryNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizHistoryNotifierProvider && other.prefs == prefs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prefs.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuizHistoryNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<QuizHistory>> {
  /// The parameter `prefs` of this provider.
  SharedPreferences get prefs;
}

class _QuizHistoryNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuizHistoryNotifier,
        List<QuizHistory>> with QuizHistoryNotifierRef {
  _QuizHistoryNotifierProviderElement(super.provider);

  @override
  SharedPreferences get prefs => (origin as QuizHistoryNotifierProvider).prefs;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
