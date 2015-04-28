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
			else sif n == N - 1 then
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
	{m}{n}
	(board, m: int(m), n: int(n), piece) = let
	fun
	is_valid_by_row_aux
		{m: nat | m < N}{n: nat | n < N}{i: nat | i < N}
		(board, m: int(m), n: int(n), i: int(i), piece): bool = let
		val gd = board_get_grid(board, m, i)
		val rt = equals_grid(gd, GRIDfil(piece))
	in
		if rt then
			false
		else
			sif i == N - 1 then
				true
			else
				is_valid_by_row_aux(board, m, n, i + 1, piece)
	end
in
	is_valid_by_row_aux(board, m, n, 0, piece)
end

implement
is_valid_by_col
	{m}{n}
	(board, m: int(m), n: int(n), piece) = let
	fun
	is_valid_by_col_aux
		{m: nat | m < N}{n: nat | n < N}{i: nat | i < N}
		(board, m: int(m), n: int(n), i: int(i), piece): bool = let
		val gd = board_get_grid(board, i, n)
		val rt = equals_grid(gd, GRIDfil(piece))
	in
		if rt then
			false
		else
			sif i == N - 1 then
				true
			else
				is_valid_by_col_aux(board, m, n, i + 1, piece)
	end
in
	is_valid_by_col_aux(board, m, n, 0, piece)
end

fun
is_valid_by_blk_aux
	{n: nat | n < N}
	(blk, n: int(n), piece): bool = let
	val gd = blk_get_grid(blk, n)
	val rt = equals_grid(gd, GRIDfil(piece))
in
	if rt then
		false
	else
		sif n == N - 1 then
			true
		else
			is_valid_by_blk_aux(blk, n + 1, piece)
end

implement
is_valid_by_blk
	{m}{n}
	(board, m: int(m), n: int(n), piece) = let
	val blk = board_get_blk(board, m, n)
in
	is_valid_by_blk_aux(blk, 0, piece)
end
