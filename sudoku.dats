(*
 * Filename: sudoku.dats
 * Author: Jun Xu
 * Email: jxu.vimacs@gmail.com
 * Created Time: Mon 13 Apr 2015 04:43:20 PM EDT
 *)

#include "share/atspre_staload.hats"
#include "share/atspre_define.hats"

staload "./list.sats"
staload "./sudoku.sats"

implement
rowwise_to_blkwise(board: board_rowwise): board_colwise =
	matlst_transpose(board)
