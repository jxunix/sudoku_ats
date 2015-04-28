(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Mon 13 Apr 2015 04:43:20 PM EDT
 *)

#include "share/atspre_staload.hats"

staload "./board.sats"

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
		equals_piece(pc1, pc2)
	)
)

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
			sif m == N - 1 && n == N - 1 then
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

implement
is_valid_by_col
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

(*)
implement
board_get_candidates
	{m}{n}
	(board, m: int(m), n: int(n)) = let
	fun
	board_get_candidates_aux
		{m: nat | m < N}{n: nat | n < N}{i: nat | i < N}
		(board, m: int(m), n: int(n), i: int(i)): candidates = 
in
end
*)

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
			val (blk, i, j) = board_get_blk(board, m, n)
			val test1 = is_valid_by_row(row, n, pc)
			val test2 = is_valid_by_col(col, m, pc)
			val test3 = is_valid_by_blk(blk, j, pc)
		in
			if test1 && test2 && test3 then
				sif m == N - 1 && n == N - 1 then
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
