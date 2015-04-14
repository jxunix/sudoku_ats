(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Mon 13 Apr 2015 04:43:20 PM EDT
 *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define N 9

typedef int9 = '(
	int, int, int, int, int, int, int, int, int
)

fun
new_int9(): int9 =
	'( 0, 0, 0, 0, 0, 0, 0, 0, 0)

fun
print_grid(i: int): void =
	if i = 1 then print "1 "
	else if i = 2 then print "2 "
	else if i = 3 then print "3 "
	else if i = 4 then print "4 "
	else if i = 5 then print "5 "
	else if i = 6 then print "6 "
	else if i = 7 then print "7 "
	else if i = 8 then print "8 "
	else if i = 9 then print "9 "
	else print ". "

fun
print_row(r: int9): void = begin
	print "| ";
	print_grid(r.0);
	print_grid(r.1);
	print_grid(r.2);
	print_grid(r.3);
	print_grid(r.4);
	print_grid(r.5);
	print_grid(r.6);
	print_grid(r.7);
	print_grid(r.8);
	print "|\n";
end

typedef int99 = '(
	int9, int9, int9, int9, int9, int9, int9, int9, int9
)

fun
print_board(bd: int99): void = begin
	print "---------------------\n";
	print_row(bd.0);
	print_row(bd.1);
	print_row(bd.2);
	print_row(bd.3);
	print_row(bd.4);
	print_row(bd.5);
	print_row(bd.6);
	print_row(bd.7);
	print_row(bd.8);
	print "---------------------\n";
end

fun
board_get_row(bd: int99, i: int): int9 =
	if i = 0 then bd.0
	else if i = 1 then bd.1
	else if i = 2 then bd.2
	else if i = 3 then bd.3
	else if i = 4 then bd.4
	else if i = 5 then bd.5
	else if i = 6 then bd.6
	else if i = 7 then bd.7
	else if i = 8 then bd.8
	else new_int9()

fun
row_get_grid(row: int9, i: int): int =
	if i = 0 then row.0
	else if i = 1 then row.1
	else if i = 2 then row.2
	else if i = 3 then row.3
	else if i = 4 then row.4
	else if i = 5 then row.5
	else if i = 6 then row.6
	else if i = 7 then row.7
	else if i = 8 then row.8
	else 0

fun
board_get_grid(bd: int99, i: int, j: int): int =
	if i = 0 then row_get_grid(bd.0, j)
	else if i = 1 then row_get_grid(bd.1, j)
	else if i = 2 then row_get_grid(bd.2, j)
	else if i = 3 then row_get_grid(bd.3, j)
	else if i = 4 then row_get_grid(bd.4, j)
	else if i = 5 then row_get_grid(bd.5, j)
	else if i = 6 then row_get_grid(bd.6, j)
	else if i = 7 then row_get_grid(bd.7, j)
	else if i = 8 then row_get_grid(bd.8, j)
	else 0

fun
row_set_grid(row: int9, j: int, k: int): int9 = let
	val '(x0, x1, x2, x3, x4, x5, x6, x7, x8) = row
in
	if j = 0 then let val x0 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 1 then let val x1 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 2 then let val x2 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 3 then let val x3 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 4 then let val x4 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 5 then let val x5 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 6 then let val x6 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 7 then let val x7 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else if j = 8 then let val x8 = k in '(x0, x1, x2, x3, x4, x5, x6, x7, x8) end
	else row
end

fun
board_set_grid(bd: int99, i: int, j: int, k: int): int99 = let
	val '(r0, r1, r2, r3, r4, r5, r6, r7, r8) = bd
in
	if i = 0 then let val r0 = row_set_grid(r0, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 1 then let val r1 = row_set_grid(r1, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 2 then let val r2 = row_set_grid(r2, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 3 then let val r3 = row_set_grid(r3, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 4 then let val r4 = row_set_grid(r4, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 5 then let val r5 = row_set_grid(r5, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 6 then let val r6 = row_set_grid(r6, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 7 then let val r7 = row_set_grid(r7, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else if i = 8 then let val r8 = row_set_grid(r8, j, k) in '(r0, r1, r2, r3, r4, r5, r6, r7, r8) end
	else bd
end

fun
test_row(i: int, j: int, k: int, bd: int99, m: int): bool =
if m = j then
	test_row(i, j, k, bd, m + 1)
else if m = N then
	true
else if k != board_get_grid(bd, i, m) then
	test_row(i, j, k, bd, m + 1)
else
	false

fun
test_col(i: int, j: int, k: int, bd: int99, m: int): bool =
if m = i then
	test_col(i, j, k, bd, m + 1)
else if m = N then
	true
else if k != board_get_grid(bd, m, j) then
	test_col(i, j, k, bd, m + 1)
else
	false

fun
test_blk(i: int, j: int, k: int, bd: int99): bool = let
	val i0 = i / 3
	val j0 = j / 3
	fun test_blk_aux(i: int, j: int, k: int, bd: int99, m: int, n: int): bool =
		if m = i && n = j then
			test_blk_aux(i, j, k, bd, m, n + 1)
		else if m = i0 * 3 + 3 then
			true
		else if n = j0 * 3 + 3 then
			test_blk_aux(i, j, k, bd, m + 1, j0 * 3)
		else if k != board_get_grid(bd, m, n) then
			test_blk_aux(i, j, k, bd, m, n + 1)
		else
			false
in
	test_blk_aux(i, j, k, bd, i0 * 3, j0 * 3)
end

fun
test(i: int, j: int, k: int, bd: int99): bool =
if test_row(i, j, k, bd, 0) then
	if test_col(i, j, k, bd, 0) then
		if test_blk(i, j, k, bd) then
			true
		else false
	else false
else false

fun
test_board(bd: int99): bool = let
	fun
	test_board_aux(bd: int99, i: int, j: int): bool =
	if i = N then
		true
	else if j = N then
		test_board_aux(bd, i + 1, 0)
	else if test(i, j, board_get_grid(bd, i, j), bd) then
		test_board_aux(bd, i, j + 1)
	else
		false
in
	test_board_aux(bd, 0, 0)
end

fun
is_full(bd: int99): bool = let
	fun
	is_full_aux(bd: int99, i: int, j: int): bool =
	if i = N then
		true
	else if j = N then
		is_full_aux(bd, i + 1, 0)
	else if board_get_grid(bd, i, j) != 0 then
		is_full_aux(bd, i, j + 1)
	else
		false
in
	is_full_aux(bd, 0, 0)
end

extern
fun
solve(bd: int99): int99

implement
solve(bd) = let
	fun
	solve_aux(bd: int99, i: int, j: int, k: int): int99 =
	if i = N then
		bd
	else if j = N then
		solve_aux(bd, i + 1, 0, 1)
	else if board_get_grid(bd, i, j) != 0 then
		solve_aux(bd, i, j + 1, 1)
	else if k = N + 1 then
		bd
	else if test(i, j, k, bd) then let
			val bd2 = board_set_grid(bd, i, j, k)
			val bd3 = solve_aux(bd2, i, j + 1, 1)
		in
			if is_full(bd3) then
				bd3
			else
				solve_aux(bd, i, j, k + 1)
		end
	else
		solve_aux(bd, i, j, k + 1)
in
	solve_aux(bd, 0, 0, 1)
end

val board = '(
		'( 5, 3, 0, 0, 7, 0, 0, 0, 0 ),
		'( 6, 0, 0, 1, 9, 5, 0, 0, 0 ),
		'( 0, 9, 8, 0, 0, 0, 0, 6, 0 ),
		'( 8, 0, 0, 0, 6, 0, 0, 0, 3 ),
		'( 4, 0, 0, 8, 0, 3, 0, 0, 1 ),
		'( 7, 0, 0, 0, 2, 0, 0, 0, 6 ),
		'( 0, 6, 0, 0, 0, 0, 2, 8, 0 ),
		'( 0, 0, 0, 4, 1, 9, 0, 0, 5 ),
		'( 0, 0, 0, 0, 8, 0, 0, 7, 9 )
		)

val board_par = '(
		'( 5, 3, 4, 6, 7, 8, 9, 1, 2 ),
		'( 6, 7, 2, 1, 9, 5, 3, 4, 8 ),
		'( 1, 9, 8, 3, 4, 2, 5, 6, 7 ),
		'( 8, 5, 9, 7, 6, 1, 4, 2, 3 ),
		'( 4, 2, 6, 8, 5, 3, 7, 9, 1 ),
		'( 7, 1, 3, 9, 2, 4, 8, 5, 6 ),
		'( 9, 6, 1, 5, 3, 7, 2, 8, 0 ),
		'( 2, 8, 7, 4, 1, 9, 0, 0, 5 ),
		'( 3, 4, 5, 2, 8, 6, 0, 7, 9 )
		)

val board_sol = '(
		'( 5, 3, 4, 6, 7, 8, 9, 1, 2 ),
		'( 6, 7, 2, 1, 9, 5, 3, 4, 8 ),
		'( 1, 9, 8, 3, 4, 2, 5, 6, 7 ),
		'( 8, 5, 9, 7, 6, 1, 4, 2, 3 ),
		'( 4, 2, 6, 8, 5, 3, 7, 9, 1 ),
		'( 7, 1, 3, 9, 2, 4, 8, 5, 6 ),
		'( 9, 6, 1, 5, 3, 7, 2, 8, 4 ),
		'( 2, 8, 7, 4, 1, 9, 6, 3, 5 ),
		'( 3, 4, 5, 2, 8, 6, 1, 7, 9 )
		)

implement main0() = {
	val () = println! ("Here is the puzzle:")
	val () = print_board(board)		

	val solved = solve(board)
	val () = println! ("\nand its solution:")
	val () = print_board(solved)

	val ret = is_full(board)
	val () = assertloc (ret = false)

	val ret = is_full(board_sol)
	val () = assertloc (ret = true)

	val ret = test_board(solved)
	val () = assertloc (ret = true)
}
