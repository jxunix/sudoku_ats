(*
** FRP via Bacon.js
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)

%{^
//
var
theUps = $("#up").asEventStream("click")
var
theDns = $("#down").asEventStream("click")
val
thePc = $("#piece").asEventStream("onselect")
//
var theCounts = 0
var theRes = 0
//
%} // end of [%{^]

(* ****** ****** *)
//
val theUps =
  $extval(EStream(void), "theUps")
val theDns =
  $extval(EStream(void), "theDns")
//
val theUps = map (theUps, lam(x) =<cloref1> 1)
val theDns = map (theDns, lam(x) =<cloref1> ~1)
//
val theUpDns = merge(theUps, theDns)
//
val theCounts = scan{int,int}(theUpDns, 0, lam(y, x) =>
		(
			if y + x < 0 then
				0
			else if y + x > 9 then
				9
			else
				y + x
		))
//
extvar "theCounts" = theCounts
//
(* ****** ****** *)

val thePc = $extval(EStream(int), "thePc")
val thePc = map (thePc, lam(x) =<cloref1> x)
val theRes = scan{int, int}(thePc, 0, lam(y, x) => x)
extvar "theRes" = theRes
    
%{$
//
function
Counter_initize()
{
  var _ = my_dynload()
  var _ = theCounts.assign($("#counter"), "text")
	var _ = theRes.assign($("#res"), "text")
}
//
jQuery(document).ready(function(){Counter_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Counter.dats] *)
