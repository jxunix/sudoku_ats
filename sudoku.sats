(*
 * Filename: sudoku.sats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Sun 26 Apr 2015 07:53:53 PM EDT
 *)

#include "share/atspre_staload.hats"

#define N 9

abstype piece
abstype row
abstype col
abstype blk

datatype grid =
| grid_emp of (row, col)
| grid_fil of (piece, row, col)

datatype list(a: t@ype, int) =
| list_nil(a, 0) of ()
| {n: nat}
	list_con(a, n+1) of (a, list(a, n))

typedef rows = list(piece, N)
typedef cols = list(piece, N)
typedef blks = list(piece, N)
typedef candidate = [n: nat | n < N] list(piece, n)

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
get_candidate(board, row, col): candidate

fun
{a: t@ype}
put(board, row, col, candidate): board

fun
{a: t@ype}
take(board, row, col): board
