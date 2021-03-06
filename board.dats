(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Mon 13 Apr 2015 04:43:20 PM EDT
 *)

#include "share/atspre_staload.hats"

staload "./board.sats"

implement
{a}
container_new
	{n}
	(a, n) =
(
	if n = 0 then
		list_nil()
	else
		list_cons(a, container_new(a, n - 1))
)

implement
{a}
container_get
	(container, i) =
	list_get_at(container, i)

implement
{a}
container_set
	(container, i, a) =
	list_set_at(container, i, a)

implement
equals_piece
	(pc1, pc2) =
(
	if pc1 = pc2 then
		true
	else
		false
)

implement
grid_new
	() =
	GRIDemp()

implement
print_grid
	(grid) =
(
case+ grid of
| GRIDemp() => print " - "
| GRIDfil(pc) => print! (" ", pc, " ")
)

implement
is_full_grid
	(grid) =
(
case+ grid of
| GRIDemp() => false
| GRIDfil(pc) => true
)

implement
equals_grid
	(gd1, gd2) =
(
case+ gd1 of
| GRIDemp() =>
	false
| GRIDfil(pc1) =>
	(
	case+ gd2 of
	| GRIDemp() =>
		false
	| GRIDfil(pc2) =>
		equals_piece(pc1, pc2))
)

implement
board_new
	() = let
	val grid = grid_new()
in
	container_new(grid, N * N)
end

implement
print_board
	(board) = let
	fun
	print_board_aux
		{m: nat | m < N}{n: nat | n < N}
		(board, m: int(m), n: int(n)): void = let
		val grid = board_get_grid(board, m, n)
		val () = print_grid(grid)
	in
		if (m = N - 1) * (n = N - 1) then let
			val () = println! ()
			val () = println! ()
		in
			()
		end
		else if n = N - 1 then let
			val () = println! ()
		in
			print_board_aux(board, m + 1, 0)
		end
		else
			print_board_aux(board, m, n + 1)
	end
in
	print_board_aux(board, 0, 0)
end

implement
is_valid_board
	(board) = let
	fun
	is_valid_board_aux
		{m: nat | m < N}{n: nat | n < N}
		(board, m: int(m), n: int(n)): bool = let
		val gd = board_get_grid(board, m, n)
	in
		case+ gd of
		| GRIDemp() => false
		| GRIDfil(pc) => let
			val row = board_get_row(board, m)
			val col = board_get_col(board, n)
			val (blk, i, j) = board_get_blk2(board, m, n)
			val test1 = is_valid_by_row(row, n, pc)
			val test2 = is_valid_by_col(col, m, pc)
			val test3 = is_valid_by_blk(blk, j, pc)
		in
			if test1 * test2 * test3 then
				if (m = N - 1) * (n = N - 1) then
					true
				else if n = N - 1 then
					is_valid_board_aux(board, m + 1, 0)
				else
					is_valid_board_aux(board, m, n + 1)
			else
				false
		end
	end
in
	is_valid_board_aux(board, 0, 0)
end

implement
is_full_board
	(board) = let
	fun
	is_full_board_aux
		{m: nat | m < N}{n: nat | n < N}
		(board, m: int(m), n: int(n)): bool = let
		val gd = board_get_grid(board, m, n)
		val rt = is_full_grid(gd)
	in
		if rt then
			if (m = N - 1) * (n = N - 1) then
				true
			else if n = N - 1 then
				is_full_board_aux(board, m + 1, 0)
			else
				is_full_board_aux(board, m, n + 1)
		else
			false
	end
in
	is_full_board_aux(board, 0, 0)
end

implement
board_get_grid
	{m}{n}(board, m, n) =
	container_get(board, m * N + n)

implement
board_set_grid
	{m}{n}(board, m, n, grid) =
	container_set(board, m * N + n, grid)

implement
print_row
	(row) = let
	fun
	print_row_aux
		{n: nat | n < N}
		(row, n: int(n)): void = let
		val grid = row_get_grid(row, n)
		val () = print_grid(grid)
	in
		if n = N - 1 then let
			val () = println! ()
		in
			()
		end
		else
			print_row_aux(row, n + 1)
	end
in
	print_row_aux(row, 0)
end

implement
board_get_row
	{n}(board, n) = let
	val row = container_new(GRIDemp(), N)
	fun
	board_get_row_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), row): row = let
		val gd = board_get_grid(board, n, i)
		val row = row_set_grid(row, i, gd)
	in
		if i = N - 1 then
			row
		else
			board_get_row_aux(board, n, i + 1, row)
	end
in
	board_get_row_aux(board, n, 0, row)
end

implement
board_set_row
	{n}(board, n, row) = let
	fun
	board_set_row_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), row): board = let
		val gd = row_get_grid(row, i)
		val board = board_set_grid(board, n, i, gd)
	in
		if i = N - 1 then
			board
		else
			board_set_row_aux(board, n, i + 1, row)
	end
in
	board_set_row_aux(board, n, 0, row)
end

implement
print_col
	(col) = let
	fun
	print_col_aux
		{n: nat | n < N}
		(col, n: int(n)): void = let
		val grid = col_get_grid(col, n)
		val () = print_grid(grid)
	in
		if n = N - 1 then let
			val () = println! ()
		in
			()
		end
		else
			print_col_aux(col, n + 1)
	end
in
	print_col_aux(col, 0)
end

implement
board_get_col
	{n}(board, n) = let
	val col = container_new(GRIDemp(), N)
	fun
	board_get_col_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), col): col = let
		val gd = board_get_grid(board, i, n)
		val col = col_set_grid(col, i, gd)
	in
		if i = N - 1 then
			col
		else
			board_get_col_aux(board, n, i + 1, col)
	end
in
	board_get_col_aux(board, n, 0, col)
end

implement
board_set_col
	{n}(board, n, col) = let
	fun
	board_set_col_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), col): board = let
		val gd = col_get_grid(col, i)
		val board = board_set_grid(board, i, n, gd)
	in
		if i = N - 1 then
			board
		else
			board_set_col_aux(board, n, i + 1, col)
	end
in
	board_set_col_aux(board, n, 0, col)
end

implement
print_blk
	(blk) = let
	fun
	print_blk_aux
		{n: nat | n < N}
		(blk, n: int(n)): void = let
		val grid = blk_get_grid(blk, n)
		val () = print_grid(grid)
	in
		if n = N - 1 then let
			val () = println! ()
		in
			()
		end
		else
			print_blk_aux(blk, n + 1)
	end
in
	print_blk_aux(blk, 0)
end

implement
board_get_blk1
	{n}(board, n) = let
	val blk = container_new(GRIDemp(), N)
	fun
	board_get_blk_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), blk): blk = let
		val r = n / M * M + i / M
		val c = n * M - (n / M * N) + (i - (i / M * M))
		val () = assertloc(r >= 0)
		val () = assertloc(r < N)
		val () = assertloc(c >= 0)
		val () = assertloc(c < N)
		val gd = board_get_grid(board, r, c)
		val blk = blk_set_grid(blk, i, gd)
	in
		if i = N - 1 then
			blk
		else
			board_get_blk_aux(board, n, i + 1, blk)
	end
in
	board_get_blk_aux(board, n, 0, blk)
end

implement
board_set_blk
	{n}(board, n, blk) = let
	fun
	board_set_blk_aux
		{n: nat | n < N}{i: nat | i < N}
		(board, n: int(n), i: int(i), blk): board = let
		val gd = blk_get_grid(blk, i)
		val r = n / M * M + i / M
		val c = n * M - (n / M * N) + (i - (i / M * M))
		val () = assertloc(r >= 0)
		val () = assertloc(r < N)
		val () = assertloc(c >= 0)
		val () = assertloc(c < N)
		val board = board_set_grid(board, r, c, gd)
	in
		if i = N - 1 then
			board
		else
			board_set_blk_aux(board, n, i + 1, blk)
	end
in
	board_set_blk_aux(board, n, 0, blk)
end

implement
board_get_blk2
	{m}{n}
	(board, m, n) = let
	val i = m / M * M + n / M
	val j = m * M - (m / M * N) + (n - (n / M * M))
	val () = assertloc(i >= 0)
	val () = assertloc(i < N)
	val () = assertloc(j >= 0)
	val () = assertloc(j < N)
	val blk = board_get_blk1(board, i)
in
	(blk, i, j)
end

implement
row_get_grid
	{n}
	(row, n) =
	container_get(row, n)

implement
row_set_grid
	{n}
	(row, n, grid) =
	container_set(row, n, grid)

implement
col_get_grid
	{n}
	(col, n) =
	container_get(col, n)

implement
col_set_grid
	{n}
	(col, n, grid) =
	container_set(col, n, grid)

implement
blk_get_grid
	{n}
	(blk, n) =
	container_get(blk, n)

implement
blk_set_grid
	{n}
	(blk, n, grid) =
	container_set(blk, n, grid)

implement
is_valid_by_row
	{n}
	(row, n: int(n), piece) = let
	fun
	is_valid_by_row_aux
		{n: nat | n < N}{i: nat | i < N}
		(row, n: int(n), i: int(i), piece): bool = let
		val gd = row_get_grid(row, i)
		val rt = equals_grid(gd, GRIDfil(piece))
	in
		if i = N - 1 && i = n then
			true
		else if i = N - 1 then
			~rt
		else if i = n then
			is_valid_by_row_aux(row, n, i + 1, piece)
		else
			if rt then
				false
			else
				is_valid_by_row_aux(row, n, i + 1, piece)
	end
in
	is_valid_by_row_aux(row, n, 0, piece)
end
implement is_valid_by_col
	{n}
	(col, n: int(n), piece) = let
	fun
	is_valid_by_col_aux
		{n: nat | n < N}{i: nat | i < N}
		(col, n: int(n), i: int(i), piece): bool = let
		val gd = col_get_grid(col, i)
		val rt = equals_grid(gd, GRIDfil(piece))
	in
		if i = N - 1 && i = n then
			true
		else if i = N - 1 then
			~rt
		else if i = n then
			is_valid_by_col_aux(col, n, i + 1, piece)
		else
			if rt then
				false
			else
				is_valid_by_col_aux(col, n, i + 1, piece)
	end
in
	is_valid_by_col_aux(col, n, 0, piece)
end

implement
is_valid_by_blk
	{n}
	(blk, n: int(n), piece) = let
	fun
	is_valid_by_blk_aux
		{n: nat | n < N}{i: nat | i < N}
		(blk, n: int(n), i: int(i), piece): bool = let
		val gd = blk_get_grid(blk, i)
		val rt = equals_grid(gd, GRIDfil(piece))
	in
		if i = N - 1 && i = n then
			true
		else if i = N - 1 then
			~rt
		else if i = n then
			is_valid_by_blk_aux(blk, n, i + 1, piece)
		else
			if rt then
				false
			else
				is_valid_by_blk_aux(blk, n, i + 1, piece)
	end
in
	is_valid_by_blk_aux(blk, n, 0, piece)
end

extern
fun
board_get_cand_aux
	{m: nat | m < N}{n: nat | n < N}{k: nat | k > 0; k <= N}
	(board, m: int(m), n: int(n), k: int(k), cand): cand

implement
board_get_cand_aux
	{m}{n}{k}
	(board, m, n, k, cand) = let
	val row = board_get_row(board, m)
	val col = board_get_col(board, n)
	val (blk, i, j) = board_get_blk2(board, m, n)
	val pc = k
	val test1 = is_valid_by_row(row, n, pc)
	val test2 = is_valid_by_col(col, m, pc)
	val test3 = is_valid_by_blk(blk, j, pc)
in
	if k = N then
		if test1 * test2 * test3 then
			list_cons(k, cand)
		else
			cand
	else
		if test1 * test2 * test3 then
			board_get_cand_aux(board, m, n, k + 1, list_cons(k, cand))
		else
			board_get_cand_aux(board, m, n, k + 1, cand)
end

implement
board_get_cand
	{m}{n}
	(board, m: int(m), n: int(n)) = let
	val grid = board_get_grid(board, m, n)
in
	case+ grid of
	| GRIDemp() =>
		board_get_cand_aux(board, m, n, 1, list_nil())
	| GRIDfil(pc) =>
		list_nil()
end

implement
print_cand
	(cand) =
(
	case+ cand of
	| list_nil() =>
		println! ()
	| list_cons(pc, cand2) => let
		val () = print! (pc, " ")
	in
		print_cand(cand2)
	end
)
