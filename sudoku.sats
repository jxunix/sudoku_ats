(*
 * Filename: sudoku.sats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Sun 26 Apr 2015 07:53:53 PM EDT
 *)

#include "share/atspre_staload.hats"

#define M 3
#define N M*M

// board is a container essentially
abstype board

fun
{a: t@ype}
is_valid_board
	(board): bool

fun
{a: t@ype}
is_full_board
	(board): bool

// row, colomun and block are smaller container than board
abstype row
abstype col
abstype blk

fun
{a: t@ype}
board_get_row{n: nat | n < N}
	(board, int(n)): row

fun
{a: t@ype}
board_get_col{n: nat | n < N}
	(board, int(n)): col
									 
fun
{a: t@ype}
board_get_blk{n: nat | n < N}
	(board, int(n)): blk

fun
{a: t@ype}
is_valid_row
	(row): bool

fun
{a: t@ype}
is_valid_col
	(col): bool

fun
{a: t@ype}
is_valid_blk
	(blk): bool

abstype piece
abstype candidates

fun
{a: t@ype}
board_get_piece{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): piece

fun
{a: t@ype}
board_set_piece{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): board

fun
{a: t@ype}
board_get_candidates{m: nat | m < N}{n: nat | n < N}
	(board, int(m), int(n)): candidates

////
abstype piece
abstype row
abstype col
abstype blk

datatype grid =
| grid_emp of (row, col)
| grid_fil of (piece, row, col)

typedef rows = list(piece, N)
typedef cols = list(piece, N)
typedef blks = list(piece, N)
typedef candidates = [n: nat | n < N] list(piece, n)

typedef board_rowwise = list(rows, N)
typedef board_colwise = list(cols, N)
typedef board_blkwise = list(blks, N)
typedef board = board_rowwise

fun
rowwise_to_colwise(board_rowwise): board_colwise

fun
rowwise_to_blkwise(board_rowwise): board_blkwise

fun
colwise_to_rowwise(board_colwise): board_rowwise

fun
colwise_to_blkwise(board_colwise): board_blkwise

fun
blkwise_to_rowwise(board_blkwise): board_rowwise

fun
blkwise_to_colwise(board_blkwise): board_colwise

fun
print_board_rowwise(board_rowwise): void

overload print with print_board_rowwise

fun
{a: t@ype}
get(board, row, col): (a)

fun
{a: t@ype}
set(board, row, col, a): board

fun
{a: t@ype}
check_row(rows): bool

fun
{a: t@ype}
check_col(cols): bool

fun
{a: t@ype}
check_blk(board): bool

fun
{a: t@ype}
check_board(board): bool

fun
{a: t@ype}
is_full(board): bool

fun
{a: t@ype}
get_candidate(board, row, col): candidates

fun
{a: t@ype}
put(board, row, col, candidates): board

fun
{a: t@ype}
take(board, row, col): board
