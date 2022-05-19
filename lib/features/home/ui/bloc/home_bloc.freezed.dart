// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  _Started started() {
    return const _Started();
  }

  _BuyProxy buyProxy() {
    return const _BuyProxy();
  }

  _ChangeStateButtons changeStateButtons({required bool status, dynamic F}) {
    return _ChangeStateButtons(
      status: status,
      F: F,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() buyProxy,
    required TResult Function(bool status, dynamic F) changeStateButtons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyProxy value) buyProxy,
    required TResult Function(_ChangeStateButtons value) changeStateButtons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() buyProxy,
    required TResult Function(bool status, dynamic F) changeStateButtons,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyProxy value) buyProxy,
    required TResult Function(_ChangeStateButtons value) changeStateButtons,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$BuyProxyCopyWith<$Res> {
  factory _$BuyProxyCopyWith(_BuyProxy value, $Res Function(_BuyProxy) then) =
      __$BuyProxyCopyWithImpl<$Res>;
}

/// @nodoc
class __$BuyProxyCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$BuyProxyCopyWith<$Res> {
  __$BuyProxyCopyWithImpl(_BuyProxy _value, $Res Function(_BuyProxy) _then)
      : super(_value, (v) => _then(v as _BuyProxy));

  @override
  _BuyProxy get _value => super._value as _BuyProxy;
}

/// @nodoc

class _$_BuyProxy implements _BuyProxy {
  const _$_BuyProxy();

  @override
  String toString() {
    return 'HomeEvent.buyProxy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BuyProxy);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() buyProxy,
    required TResult Function(bool status, dynamic F) changeStateButtons,
  }) {
    return buyProxy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
  }) {
    return buyProxy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (buyProxy != null) {
      return buyProxy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyProxy value) buyProxy,
    required TResult Function(_ChangeStateButtons value) changeStateButtons,
  }) {
    return buyProxy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
  }) {
    return buyProxy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (buyProxy != null) {
      return buyProxy(this);
    }
    return orElse();
  }
}

abstract class _BuyProxy implements HomeEvent {
  const factory _BuyProxy() = _$_BuyProxy;
}

/// @nodoc
abstract class _$ChangeStateButtonsCopyWith<$Res> {
  factory _$ChangeStateButtonsCopyWith(
          _ChangeStateButtons value, $Res Function(_ChangeStateButtons) then) =
      __$ChangeStateButtonsCopyWithImpl<$Res>;
  $Res call({bool status, dynamic F});
}

/// @nodoc
class __$ChangeStateButtonsCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$ChangeStateButtonsCopyWith<$Res> {
  __$ChangeStateButtonsCopyWithImpl(
      _ChangeStateButtons _value, $Res Function(_ChangeStateButtons) _then)
      : super(_value, (v) => _then(v as _ChangeStateButtons));

  @override
  _ChangeStateButtons get _value => super._value as _ChangeStateButtons;

  @override
  $Res call({
    Object? status = freezed,
    Object? F = freezed,
  }) {
    return _then(_ChangeStateButtons(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      F: F == freezed ? _value.F : F,
    ));
  }
}

/// @nodoc

class _$_ChangeStateButtons implements _ChangeStateButtons {
  const _$_ChangeStateButtons({required this.status, this.F});

  @override
  final bool status;
  @override
  final dynamic F;

  @override
  String toString() {
    return 'HomeEvent.changeStateButtons(status: $status, F: $F)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeStateButtons &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.F, F) ||
                const DeepCollectionEquality().equals(other.F, F)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(F);

  @JsonKey(ignore: true)
  @override
  _$ChangeStateButtonsCopyWith<_ChangeStateButtons> get copyWith =>
      __$ChangeStateButtonsCopyWithImpl<_ChangeStateButtons>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() buyProxy,
    required TResult Function(bool status, dynamic F) changeStateButtons,
  }) {
    return changeStateButtons(status, F);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
  }) {
    return changeStateButtons?.call(status, F);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? buyProxy,
    TResult Function(bool status, dynamic F)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (changeStateButtons != null) {
      return changeStateButtons(status, F);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BuyProxy value) buyProxy,
    required TResult Function(_ChangeStateButtons value) changeStateButtons,
  }) {
    return changeStateButtons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
  }) {
    return changeStateButtons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BuyProxy value)? buyProxy,
    TResult Function(_ChangeStateButtons value)? changeStateButtons,
    required TResult orElse(),
  }) {
    if (changeStateButtons != null) {
      return changeStateButtons(this);
    }
    return orElse();
  }
}

abstract class _ChangeStateButtons implements HomeEvent {
  const factory _ChangeStateButtons({required bool status, dynamic F}) =
      _$_ChangeStateButtons;

  bool get status => throw _privateConstructorUsedError;
  dynamic get F => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChangeStateButtonsCopyWith<_ChangeStateButtons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {required bool isSubmitting,
      required bool noInternet,
      required bool serverError,
      required bool isOnButton,
      required bool isHaveProxy}) {
    return _HomeState(
      isSubmitting: isSubmitting,
      noInternet: noInternet,
      serverError: serverError,
      isOnButton: isOnButton,
      isHaveProxy: isHaveProxy,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get noInternet => throw _privateConstructorUsedError;
  bool get serverError => throw _privateConstructorUsedError;
  bool get isOnButton => throw _privateConstructorUsedError;
  bool get isHaveProxy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      bool noInternet,
      bool serverError,
      bool isOnButton,
      bool isHaveProxy});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? noInternet = freezed,
    Object? serverError = freezed,
    Object? isOnButton = freezed,
    Object? isHaveProxy = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      noInternet: noInternet == freezed
          ? _value.noInternet
          : noInternet // ignore: cast_nullable_to_non_nullable
              as bool,
      serverError: serverError == freezed
          ? _value.serverError
          : serverError // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnButton: isOnButton == freezed
          ? _value.isOnButton
          : isOnButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isHaveProxy: isHaveProxy == freezed
          ? _value.isHaveProxy
          : isHaveProxy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      bool noInternet,
      bool serverError,
      bool isOnButton,
      bool isHaveProxy});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? noInternet = freezed,
    Object? serverError = freezed,
    Object? isOnButton = freezed,
    Object? isHaveProxy = freezed,
  }) {
    return _then(_HomeState(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      noInternet: noInternet == freezed
          ? _value.noInternet
          : noInternet // ignore: cast_nullable_to_non_nullable
              as bool,
      serverError: serverError == freezed
          ? _value.serverError
          : serverError // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnButton: isOnButton == freezed
          ? _value.isOnButton
          : isOnButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isHaveProxy: isHaveProxy == freezed
          ? _value.isHaveProxy
          : isHaveProxy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.isSubmitting,
      required this.noInternet,
      required this.serverError,
      required this.isOnButton,
      required this.isHaveProxy});

  @override
  final bool isSubmitting;
  @override
  final bool noInternet;
  @override
  final bool serverError;
  @override
  final bool isOnButton;
  @override
  final bool isHaveProxy;

  @override
  String toString() {
    return 'HomeState(isSubmitting: $isSubmitting, noInternet: $noInternet, serverError: $serverError, isOnButton: $isOnButton, isHaveProxy: $isHaveProxy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.noInternet, noInternet) ||
                const DeepCollectionEquality()
                    .equals(other.noInternet, noInternet)) &&
            (identical(other.serverError, serverError) ||
                const DeepCollectionEquality()
                    .equals(other.serverError, serverError)) &&
            (identical(other.isOnButton, isOnButton) ||
                const DeepCollectionEquality()
                    .equals(other.isOnButton, isOnButton)) &&
            (identical(other.isHaveProxy, isHaveProxy) ||
                const DeepCollectionEquality()
                    .equals(other.isHaveProxy, isHaveProxy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(noInternet) ^
      const DeepCollectionEquality().hash(serverError) ^
      const DeepCollectionEquality().hash(isOnButton) ^
      const DeepCollectionEquality().hash(isHaveProxy);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required bool isSubmitting,
      required bool noInternet,
      required bool serverError,
      required bool isOnButton,
      required bool isHaveProxy}) = _$_HomeState;

  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  bool get noInternet => throw _privateConstructorUsedError;
  @override
  bool get serverError => throw _privateConstructorUsedError;
  @override
  bool get isOnButton => throw _privateConstructorUsedError;
  @override
  bool get isHaveProxy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
