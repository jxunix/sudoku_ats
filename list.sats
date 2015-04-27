(*
 * Filename: list.sats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Mon 27 Apr 2015 11:54:44 AM EDT
 *)

#include "share/atspre_staload.hats"

datatype list(a: t@ype, int) =
| list_nil(a, 0) of ()
| {n: nat}
	list_con(a, n+1) of (a, list(a, n))

#define -- list_nil
#define || list_con

typedef matlst(a: t@ype, m: int, n: int) = list(list(a, n), m)

fun
{a: t@ype}
list_length{n: nat}
	(xs: list(a, n)): int(n)

fun
{a: t@ype}
list_append{m: nat}{n: nat}
	(list(a, m), list(a, n)): list(a, m+n)

fun
{a: t@ype}
list_reverse{n: nat}
	(list(a, n)): list(a, n)

fun
{a: t@ype}
{b: t@ype}
list_map{n: nat}
	(list(a, n), a -> b): list(b, n)

fun
{a: t@ype}
list_get{n: int}{i: nat | i < n}
	(list(a, n), int(i)): (a)

fun
{a: t@ype}
list_split{n: int}{i: nat | i <= n}
	(list(a, n), int(i)): (list(a, i), list(a, n-i))

fun
{a: t@ype}
matlst_get_col{m, n: int}{i: nat | i < n}
	(matlst(a, m, n), int(i)): list(a, m)

fun
{a: t@ype}
matlst2list_by_row{m, n: nat}
	(matlst(a, m, n)): list(a, m*n)

fun
{a: t@ype}
matlst2list_by_col{m, n: nat}
	(matlst(a, m, n)): list(a, m*n)

fun
{a: t@ype}
matlst_split{m, n: nat}
	(matlst(a, m, n)): (list(a, m), matlst(a, m, n-1))

fun
{a: t@ype}
matlst_transpose{m, n: nat}
	(matlst(a, m, n)): matlst(a, n, m)
