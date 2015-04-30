(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Tue 28 Apr 2015 12:54:11 PM EDT
 *)

#include "share/atspre_staload.hats"

staload "./board.sats"
#include "./board.dats"

extern
fun
solve_from
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n), cand): board

implement
solve_from
	{m}{n}
	(board, m, n, cand) = let
	val grid = board_get_grid(board, m, n)
in
	(
		case+ grid of
		| GRIDfil(pc) =>
			(
				if (m = N - 1) * (n =  N - 1) then
					board
				else if n = N - 1 then
					solve_from(board, m + 1, 0, board_get_cand(board, m + 1, 0))
				else
					solve_from(board, m, n + 1, board_get_cand(board, m, n + 1))
			)
		| GRIDemp() =>
			(
			case+ cand of
			| list_nil() =>
				board
			| list_cons(pc, cand2) => let
				val board2 = board_set_grid(board, m, n, GRIDfil(pc))
				val board2 =
				(
					if (m = N - 1) * (n = N - 1) then
						board2
					else if n = N - 1 then
						solve_from(board2, m + 1, 0, board_get_cand(board2, m + 1, 0))
					else
						solve_from(board2, m, n + 1, board_get_cand(board2, m, n + 1))
				)
			in
				if is_full_board(board2) then
					board2
				else
					solve_from(board, m, n, cand2)
			end
			)
	)
end

extern
fun
solve_sudoku
	(board): board

implement
solve_sudoku
	(board) = let
	val cand = board_get_cand(board, 0, 0)
in
	solve_from(board, 0, 0, cand)
end

implement
main0() =
{
	val board = board_new()

	val board = board_set_grid(board, 0, 0, GRIDfil(5))
	val board = board_set_grid(board, 0, 1, GRIDfil(3))
	val board = board_set_grid(board, 0, 4, GRIDfil(7))
	val board = board_set_grid(board, 1, 0, GRIDfil(6))
	val board = board_set_grid(board, 1, 3, GRIDfil(1))
	val board = board_set_grid(board, 1, 4, GRIDfil(9))
	val board = board_set_grid(board, 1, 5, GRIDfil(5))
	val board = board_set_grid(board, 2, 1, GRIDfil(9))
	val board = board_set_grid(board, 2, 2, GRIDfil(8))
	val board = board_set_grid(board, 2, 7, GRIDfil(6))
	val board = board_set_grid(board, 3, 0, GRIDfil(8))
	val board = board_set_grid(board, 3, 4, GRIDfil(6))
	val board = board_set_grid(board, 3, 8, GRIDfil(3))
	val board = board_set_grid(board, 4, 0, GRIDfil(4))
	val board = board_set_grid(board, 4, 3, GRIDfil(8))
	val board = board_set_grid(board, 4, 5, GRIDfil(3))
	val board = board_set_grid(board, 4, 8, GRIDfil(1))
	val board = board_set_grid(board, 5, 0, GRIDfil(7))
	val board = board_set_grid(board, 5, 4, GRIDfil(2))
	val board = board_set_grid(board, 5, 8, GRIDfil(6))
	val board = board_set_grid(board, 6, 1, GRIDfil(6))
	val board = board_set_grid(board, 6, 6, GRIDfil(2))
	val board = board_set_grid(board, 6, 7, GRIDfil(8))
	val board = board_set_grid(board, 7, 3, GRIDfil(4))
	val board = board_set_grid(board, 7, 4, GRIDfil(1))
	val board = board_set_grid(board, 7, 5, GRIDfil(9))
	val board = board_set_grid(board, 7, 8, GRIDfil(5))
	val board = board_set_grid(board, 8, 4, GRIDfil(8))
	val board = board_set_grid(board, 8, 7, GRIDfil(7))
	val board = board_set_grid(board, 8, 8, GRIDfil(9))

	val () = print_board(board)

	val board = solve_sudoku(board)
	val () = print_board(board)
}
