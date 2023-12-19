// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart = 2.9
// Requirements=nnbd-weak


// Test that a generic type alias `T` denoting `void`
// can give rise to the expected errors.

import 'dart:async';
import 'generic_usage_void_error_lib.dart';

// Use the aliased type.

abstract class C {
  final T<Null> v7;

  C(): v7 = T();
  //        ^
  // [analyzer] unspecified
  // [cfe] unspecified
}

class D1<X> extends T<X> {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class D2 extends C with T<int> {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class D3<X, Y> implements T<T> {}
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class D4 = C with T<void>;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

extension E on T<dynamic> {
  T<dynamic> foo(T<dynamic> t) => t;
}

X foo<X>(X x) => x;

main() {
  var v8 = <T<C>>[];
  var v9 = <Set<T<T>>, Set<T<T>>>{{}: {}};
  var v10 = {v8};
  v9[{}] = {T<T>()};
  //        ^
  // [analyzer] unspecified
  // [cfe] unspecified

  Set<List<T<C>>> v11 = v10;
  v10 = v11;

  T<Null>();
//^
// [analyzer] unspecified
// [cfe] unspecified

  T<Null>.named();
//^
// [analyzer] unspecified
// [cfe] unspecified

  T<Object> v12 = foo<T<bool>>(T<bool>());
  //                           ^
  // [analyzer] unspecified
  // [cfe] unspecified

  T<List<List<List<List>>>>.staticMethod<T<int>>();
  //                        ^^^^^^^^^^^^
  // [analyzer] unspecified
  // [cfe] unspecified
}
