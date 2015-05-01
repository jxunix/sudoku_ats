#include "share/atspre_define.hats"
#include "{$LIBATSCC2JS}/staloadall.hats"
//#include "./board.dats"
//#include "./solve.dats"

staload UN = "prelude/SATS/unsafe.sats"
staload "{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
staload "./board.sats"

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

abstype point_type = ptr
abstype vector_type = ptr
typedef point = point_type
typedef vector = vector_type

extern
fun
point_make_xy
	(x: double, y: double): point

extern
fun
point_get_x(point): double
and
point_get_y(point): double

overload .x with point_get_x
overload .y with point_get_y

local
	assume point_type = $tup(double, double)
in
	implement point_make_xy(x, y) = $tup(x, y)
	implement point_get_x(p) = p.0
	implement point_get_y(p) = p.1
end

extern
fun
vector_make_xy
	(vx: double, vy: double): vector

extern
fun
vector_get_x(vector): double
and
vector_get_y(vector): double

overload .x with vector_get_x
overload .y with vector_get_y

local
	assume vector_type = $tup(double, double)
in
	implement vector_make_xy(x, y) = $tup(x, y)
	implement vector_get_x(v) = v.0
	implement vector_get_y(v) = v.1
end

extern
fun
add_pvp(point, vector): point
extern
fun
sub_ppv(p1: point, p2: point): vector

overload + with add_pvp
overload - with sub_ppv

implement
add_pvp(p, v) =
	point_make_xy(p.x + v.x, p.y + v.y)
implement
sub_ppv(p1, p2) =
	vector_make_xy(p1.x - p2.x, p1.y - p2.y)

extern
fun
add_vvv(v1: vector, v2: vector): vector
and
sub_vvv(v1: vector, v2: vector): vector

extern
fun
mul_kvv(k: double, v: vector): vector
and
div_vkv(v: vector, k: double): vector

overload + with add_vvv
overload - with sub_vvv
overload * with mul_kvv
overload / with div_vkv

implement
add_vvv(v1, v2) =
	vector_make_xy(v1.x + v2.x, v1.y + v2.y)
implement
sub_vvv(v1, v2) =
	vector_make_xy(v1.x - v2.x, v1.y - v2.y)

implement
mul_kvv(k, v) =
	vector_make_xy(k * v.x, k * v.y)
implement
div_vkv(v, k) =
	vector_make_xy(v.x / k, v.y / k)

abstype color_type = ptr
typedef color = color_type

extern
fun
color_make_rgb
	(r: double, g: double, b: double): color

extern
fun color_get_r: color -> double
and color_get_g: color -> double
and color_get_b: color -> double

overload .r with color_get_r
overload .g with color_get_g
overload .b with color_get_b

local
	assume color_type = $tup(double, double, double)
in
	implement color_make_rgb(r, g, b) = $tup(r, g, b)
	implement color_get_r(c) = c.0
	implement color_get_g(c) = c.1
	implement color_get_b(c) = c.2
end

extern
fun{}
draw3p
	(p1: point, p2: point, p3: point): void

extern
fun{}
draw4p
	(p1: point, p2: point, p3: point, p4: point): void

extern
fun{}
mydraw_matgraph
	(m: intGte(1), n: intGte(1), p1: point, p2: point, p3: point, p4: point): void

extern
fun{}
mydraw_matgraph$fcell
	(i: intGte(0), j: intGte(0), p1: point, p2: point, p3: point, p4: point): void

implement
{}
mydraw_matgraph
	(m, n, p1, p2, p3, p4) = let
	val a = 1.0 / m
	val b = 1.0 / n
	val v12 = a * (p2 - p1)
	val v43 = a * (p3 - p4)
	fun loop (i: intGte(0)) : void = let
		val fi = int2double(i)
		val p1 = p1 + fi * v12
		val p2 = p1 + v12
		val p4 = p4 + fi * v43
		val p3 = p4 + v43
		val v23 = b * (p3 - p2)
		val v14 = b * (p4 - p1)
		fun loop2 (j: intGte(0)) : void = let
			val fj = int2double(j)
			val p1 = p1 + fj * v14
			val p4 = p1 + v14
			val p2 = p2 + fj * v23
			val p3 = p2 + v23
			val () = mydraw_matgraph$fcell<> (i, j, p1, p2, p3, p4)
		in
			if j + 1 < n then loop2 (j + 1) else ()
		end
		val () = loop2 (0)
	in
		if succ(i) < m then loop (succ(i)) else ()
	end
in
  loop (0)
end

//#define M 3
//#define N M * M
#define N 9
#define N1 %(N-1)

val theBoard = arrayref_make_elt{int}(N, ~1)

extern
fun
theCtx2d_get(): canvas2d = "mac#"

extern
fun
draw_theBoard(canvas2d): void = "mac#"

local
	val theP1 = ref{point}($UN.cast{point}(0))
	val theP2 = ref{point}($UN.cast{point}(0))
	val theP3 = ref{point}($UN.cast{point}(0))
	val theP4 = ref{point}($UN.cast{point}(0))
in
	extern fun theP1_get(): point
	extern fun theP2_get(): point
	extern fun theP3_get(): point
	extern fun theP4_get(): point
	
	extern fun theP1_set(x: double, y: double): void = "mac#"
	extern fun theP2_set(x: double, y: double): void = "mac#"
	extern fun theP3_set(x: double, y: double): void = "mac#"
	extern fun theP4_set(x: double, y: double): void = "mac#"

	implement theP1_get() = theP1[]
	implement theP2_get() = theP2[]
	implement theP3_get() = theP3[]
	implement theP4_get() = theP4[]

	implement theP1_set(x, y) = theP1[] := point_make_xy(x, y)
	implement theP2_set(x, y) = theP2[] := point_make_xy(x, y)
	implement theP3_set(x, y) = theP3[] := point_make_xy(x, y)
	implement theP4_set(x, y) = theP4[] := point_make_xy(x, y)
end

(*)
//val the_board = arrayref_make_elt{int}(N * N, 0)
val the_board = board_new()

extern
fun
solve_from
	(i: natLt(N), j: natLt(N)): void = "mac#"
and
solve_from_
	(i: natLt(N), j: natLt(N)): void = "mac#"

extern
fun
solve_from_using
	(i: natLt(N), j: natLt(N), cand): board

implement
solve_from_using
	(i, j, cand) =
(
case+ cand of
| list_nil() =>
	board
| list_cons(pc, cand2) => let
	val the_board2 = board_set_grid(the_board, m, n, GRIDfil(pc))
	val the_board2 =
	(
		if (m = N - 1) * (n = N - 1) then
			alert("The puzzle is solved!")
		else if n = N - 1 then
			solve_from_(m + 1, 0)
		else
			solve_from_(m, n + 1)
	)
in
	if is_full_board(board2) then
		board2
	else
		solve_from(board, m, n, cand2)
end
)

implement
solve_from
	(i: natLt(N), j: natLt(N)) = let
	val grid = board_get_grid(the_board, m, n)
in
	(
	case+ grid of
	| GRIDfil(pc) =>
		(
			if (m = N - 1) * (n =  N - 1) then
				alert("The puzzle is solved!")
			else if n = N - 1 then
				solve_from_(m + 1, 0)
			else
				solve_from_(m, n + 1)
		)
	| GRIDemp() => let
		val bd = solve_from_using(i, j, board_get_cand(the_board, i, j))
	in
		()
	end
	)
end
*)












extern
fun
configSearch
	(i: natLte(N)): void = "mac#"
and
configSearch_
	(i: natLte(N)): void = "mac#"

fun
safetyTest
	(i0: natLt(N), j0: int): bool = let
	fun
	loop(i: intGte(0)): bool =
	if i < i0 then let
		val j = theBoard[i]
	in
		if j = j0 then
			false
		else
			if abs(i0 - i) = abs(j0 - j) then
				false
			else
				loop(i+1)
	end
	else
		true
in
  loop (0)
end

fun
configSearch2
	(i: natLt(N), j: int): void = let
in
	if j < N then
		if safetyTest(i, j) then let
			val () = theBoard[i] := j
			val () = draw_theBoard (theCtx2d_get())
		in
			configSearch_(i+1)
		end
		else
			configSearch2(i, j+1)
	else let
		val () = theBoard[i] := ~1
		val () = draw_theBoard (theCtx2d_get())
	in
		if i > 0 then
			configSearch_(i-1)
		else
			configSearch_final ()
	end
end

and
configSearch_found
	(): void = let
	val yn = confirm("A solution is found. Continue?")
in
  if yn then
		configSearch2 (N1, theBoard[N1]+1)
end

and
configSearch_final
	(): void =
  alert("There is no more solution to be found.")

implement
configSearch
	(i) =
(
	if i = N then
		configSearch_found ()
	else
		configSearch2 (i, theBoard[i]+1)
)

// change to digit instead of dots
fun
draw_queen
	(ctx: canvas2d , p1: point, p2: point, p3: point, p4: point): void =
{
	val rgb = "rgb(40, 40, 0)"
	val () = ctx.fillStyle(rgb)

	val xc = (p1.x+p2.x+p3.x+p4.x)/4
	val yc = (p1.y+p2.y+p3.y+p4.y)/4

	val dx = ((p1.x+p2.x)-(p3.x+p4.x))/2
	val dy = ((p1.y+p2.y)-(p3.y+p4.y))/2

	val rad = 0.425*JSmath_sqrt(dx*dx+dy*dy)
	
	val () = ctx.beginPath()
	val () = ctx.arc (xc, yc, rad, 0.0, 2*JSmath_PI, true)
	val () = ctx.closePath()

	val () = ctx.fill()
}





















implement
draw_theBoard
  (ctx) = let
	val p1 = theP1_get()
	val p2 = theP2_get()
	val p3 = theP3_get()
	val p4 = theP4_get()
	implement
	mydraw_matgraph$fcell<>
		(i, j, p1, p2, p3, p4) = let
		macdef floor = JSmath_floor
		val a = 0.40 * ((i / 3 + j / 3) % 2)
		val c = String(120 + floor(a * 255))
		val rgb = "rgb(" + c + "," + c + "," + c + ")"
		val () = ctx.fillStyle(rgb)
		val () = ctx.beginPath()
		val () = ctx.moveTo(p1.x, p1.y)
		val () = ctx.lineTo(p2.x, p2.y)
		val () = ctx.lineTo(p3.x, p3.y)
		val () = ctx.lineTo(p4.x, p4.y)
		val () = ctx.closePath()
		val () = ctx.fill()
		val i = $UN.cast{natLt(N)}(i)
		val () = if (theBoard[i] = j) then
		//val () = assertloc(i >= 0)
		//val () = assertloc(i < N)
		//val () = assertloc(j >= 0)
		//val () = assertloc(j < N)
		//val () = if (~is_full_grid(board_get_grid(board, i, j))) then
			draw_queen (ctx, p1, p2, p3, p4)
	in
	end
in
	mydraw_matgraph<> (N, N, p1, p2, p3, p4)
end 

%{$
my_dynload();
var canvas = document.getElementById("Patsoptaas-Evaluate-canvas");
var ctx2d = canvas.getContext('2d');

function theCtx2d_get() { return ctx2d; }

function initize()
{
	var w = canvas.width
	var h = canvas.height
	var wh = 0.88 * Math.min(w, h)
	theP1_set(0, 0);
	theP2_set(0, wh);
	theP3_set(wh, wh);
	theP4_set(wh, 0);
	ctx2d.save();
	ctx2d.translate((w - wh) / 2, (h - wh) / 2);
	return;
}

function configSearch_(i)
{
	setTimeout(function()
	{
		initize();
		configSearch(i);
		ctx2d.restore();
		return;
	}, 100);
}

function solve_from_(i, j)
{
	setTimeout(function()
	{
		initize();
		solve_from(i, j);
		ctx2d.restore();
		return;
	}, 100);
}

function draw_main()
{
	initize();
	draw_theBoard(ctx2d);
	ctx2d.restore();
	configSearch_(0);
	//solve_from_(0, 0);
	return;
}

jQuery(document).ready(function()
{
	draw_main();
})

%}
