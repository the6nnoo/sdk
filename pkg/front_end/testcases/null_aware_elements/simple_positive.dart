// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

foo1(int? x) => <int>[?x];
foo2(String? x) => <String>{?x};
foo3(bool? x, num y) => <bool, num>{?x: y};

bar1(int? x) => <int>[?x];
bar2(int? x, bool b) => <int>{ if (b) ?x };
bar3(int? x) => <int>{ for (var _ in []) ?x };
bar4(String x, bool? y) => <String, bool>{x: ?y};
bar5(int? x, num y) => <int, num>{?x: y};
bar6(double? x, Symbol? y) => <double, Symbol>{?x: ?y};
bar7(num? x, double? y, bool b) => <num, double>{ if (b) ?x: ?y };
bar8(num? x, double? y) => <num, double>{ for (var _ in []) ?x: ?y };
