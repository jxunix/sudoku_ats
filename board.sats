(*
 * Filename: sudoku.sats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Sun 26 Apr 2015 07:53:53 PM EDT
 *)

#include "share/atspre_staload.hats"

#define M 3
#define N M*M

typedef piece = int
(*)
datatype container(a: t@ype, n: int) =
| CONnil(a, 0) of ()
| {n: nat}
	CONcon(a, n + 1) of (a, container(a, n))
*)
typedef container(a: t@ype, n: int) = list(a, n)

fun
{a: t@ype}
container_new
	{n: nat}(a, int(n)): container(a, n)

fun
{a: t@ype}
container_get
	{n: nat}{i: nat | i < n}(container(a, n), int(i)): a

fun
{a: t@ype}
container_set
	{n: nat}{i: nat | i < n}(container(a, n), int(i), a): container(a, n)

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
typedef board = container(grid, N * N)

(*
 * row, colomun and block are containers of size N.
 *)
typedef row = container(grid, N)
typedef col = container(grid, N)
typedef blk = container(grid, N)

typedef cand = List0(piece)

fun
equals_piece
	(piece, piece): bool

fun
grid_new
	(): grid

fun
print_grid
	(grid): void

fun
is_full_grid
	(grid): bool

fun
equals_grid
	(grid, grid): bool

fun
board_new
	(): board

fun
print_board
	(board): void

fun
is_valid_board
	(board): bool

fun
is_full_board
	(board): bool

fun
board_get_grid
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): grid
fun
board_set_grid
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n), grid): board

fun
print_row
	(row): void

fun
board_get_row
	{n: nat | n < N}
	(board, int(n)): row
fun
board_set_row
	{n: nat | n < N}
	(board, int(n), row): board

fun
print_col
	(col): void

fun
board_get_col
	{n: nat | n < N}
	(board, int(n)): col
fun
board_set_col
	{n: nat | n < N}
	(board, int(n), col): board

fun
print_blk
	(blk): void
									 
fun
board_get_blk1
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
board_get_blk2
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
board_get_cand
	{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): cand

fun
print_cand
	(cand): void
