(*
 * Filename: sudoku.sats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Sun 26 Apr 2015 07:53:53 PM EDT
 *)

#include "share/atspre_staload.hats"

#define M 3
#define N M*M

abstype piece

(*
 * Either the grid is empty, or a piece is placed.
 * In other words, either grid (as a container) contains a piece,
 * or it contains nothing
 *)
datatype grid =
| GRIDfil of piece
| GRIDemp of ()

(*
 * Board is a container of size N^2 essentially.
 * It contains grid
 *)
abstype board

(*
 * row, colomun and block are containers of size N.
 *)
abstype row
abstype col
abstype blk

abstype candidates

// NYI, up to specific type of piece we use
fun
equals_piece
	(piece, piece): bool

fun
is_full_grid
	(grid): bool

fun
equals_grid
	(grid, grid): bool

fun
is_valid_board
	(board): bool

fun
is_full_board
	(board): bool

// NYI for all get() & set(), up to specific type of board we use
fun
board_get_grid
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): grid
fun
board_set_grid
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n), grid): board

fun
board_get_row
	{n: nat | n < N}
	(board, int(n)): row
fun
board_set_row
	{n: nat | n < N}
	(board, int(n), row): board

fun
board_get_col
	{n: nat | n < N}
	(board, int(n)): col
fun
board_set_col
	{n: nat | n < N}
	(board, int(n), col): board
									 
fun
board_get_blk
	{n: nat | n < N}
	(board, int(n)): blk
fun
board_set_blk
	{n: nat | n < N}
	(board, int(n), blk): board

(*
 * Given a 2d coordinate in the board
 * get the corresponding block
 * compute the index of the block in the board
 * and the index of the grid in the block
 *)
fun
board_get_blk
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): [i: nat | i < N][j: nat | j < N] (blk, int(i), int(j))

fun
row_get_grid
	{n: nat | n < N}
	(row, int(n)): grid
fun
row_set_grid
	{n: nat | n < N}
	(row, int(n), grid): row

fun
col_get_grid
	{n: nat | n < N}
	(col, int(n)): grid
fun
col_set_grid
	{n: nat | n < N}
	(col, int(n), grid): col

fun
blk_get_grid
	{n: nat | n < N}
	(blk, int(n)): grid
fun
blk_set_grid
	{n: nat | n < N}
	(blk, int(n), grid): blk

fun
is_valid_by_row
	{n: nat | n < N}
	(row, int(n), piece): bool

fun
is_valid_by_col
	{n: nat | n < N}
	(col, int(n), piece): bool

fun
is_valid_by_blk
	{n: nat | n < N}
	(blk, int(n), piece): bool

fun
board_get_candidates
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): candidates
