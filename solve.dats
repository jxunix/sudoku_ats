(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Tue 28 Apr 2015 12:54:11 PM EDT
 *)

#include "share/atspre_staload.hats"

staload "./board.sats"
#include "./board.dats"

(*)
extern
fun
solve_from
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): board

implement
solve_from
	{m}{n}
	(board, m, n) = let
	val gd = board_get_grid(board, m, n)
in
	case- gd of
	| GRIDfil(pc) => 
	(
		if (m = N - 1) * (n = N - 1) then
			board
		else if n = N - 1 then
			solve_from(board, m + 1, 0)
		else
			solve_from(board, m, n + 1)
	)
	| GRIDemp() => let
		val cand = board_get_cand(board, m, n)
	in
		case- cand of
		| CANDnil() => board
		| CANDcon(pc, cand2) => let
			val board2 = board_set_grid(board, m, n, GRIDfil(pc))
		in
			if (m = N - 1) * (n = N - 1) then
				board
			else if n = N - 1 then
				solve_from(board2, m + 1, 0)
			else
				solve_from(board2, m, n + 1)
		end
	end
end

extern
fun
solve_sudoku
	(board): board

implement
solve_sudoku
	(board) = let
in
	solve_from(board, 0, 0)
end
*)

//assume piece = int

implement
main0() =
{
	val board = board_new()
	val () = print_board(board)

	val grid = board_get_grid(board, 0, 0)
	val () = println! ()
	val () = print_grid(grid)
	val () = println! ()
	val () = println! ()

	val row = board_get_row(board, 0)
	val () = println! ()
	val () = print_row(row)
	val () = println! ()

	val board = board_set_grid(board, 0, 0, GRIDfil(5))
	val () = print_board(board)
	val board = board_set_grid(board, 0, 1, GRIDfil(3))
	val board = board_set_grid(board, 0, 4, GRIDfil(7))
}
