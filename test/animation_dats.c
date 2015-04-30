/*
**
** The C code is generated by ATS/Postiats
** The starting compilation time is: 2015-4-30: 12h:54m
**
*/

/*
** include runtime header files
*/
#ifndef _ATS_CCOMP_HEADER_NONE
#include "pats_ccomp_config.h"
#include "pats_ccomp_basics.h"
#include "pats_ccomp_typedefs.h"
#include "pats_ccomp_instrset.h"
#include "pats_ccomp_memalloc.h"
#ifndef _ATS_CCOMP_EXCEPTION_NONE
#include "pats_ccomp_memalloca.h"
#include "pats_ccomp_exception.h"
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE]
#endif /* _ATS_CCOMP_HEADER_NONE */


/*
** include prelude cats files
*/
#ifndef _ATS_CCOMP_PRELUDE_NONE
//
#include "prelude/CATS/basics.cats"
#include "prelude/CATS/integer.cats"
#include "prelude/CATS/pointer.cats"
#include "prelude/CATS/bool.cats"
#include "prelude/CATS/char.cats"
#include "prelude/CATS/integer_ptr.cats"
#include "prelude/CATS/integer_fixed.cats"
#include "prelude/CATS/float.cats"
#include "prelude/CATS/memory.cats"
#include "prelude/CATS/string.cats"
#include "prelude/CATS/strptr.cats"
//
#include "prelude/CATS/filebas.cats"
//
#include "prelude/CATS/list.cats"
#include "prelude/CATS/option.cats"
#include "prelude/CATS/array.cats"
#include "prelude/CATS/arrayptr.cats"
#include "prelude/CATS/arrayref.cats"
#include "prelude/CATS/matrix.cats"
#include "prelude/CATS/matrixptr.cats"
//
#endif /* _ATS_CCOMP_PRELUDE_NONE */
/*
** for user-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER
//
#include _ATS_CCOMP_PRELUDE_USER
//
#endif /* _ATS_CCOMP_PRELUDE_USER */
/*
** for user2-supplied prelude
*/
#ifdef _ATS_CCOMP_PRELUDE_USER2
//
#include _ATS_CCOMP_PRELUDE_USER2
//
#endif /* _ATS_CCOMP_PRELUDE_USER2 */

/*
staload-prologues(beg)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/list.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/list.dats: 357(line=27, offs=1) -- 396(line=28, offs=32)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/list.dats: 423(line=32, offs=1) -- 455(line=32, offs=33)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/list.dats: 482(line=36, offs=1) -- 512(line=36, offs=31)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/print.sats: 189(line=14, offs=1) -- 218(line=14, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/list.dats: 513(line=37, offs=1) -- 545(line=37, offs=33)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/filebas.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/list.dats: 572(line=41, offs=1) -- 601(line=41, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/list.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/option.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/option.dats: 359(line=27, offs=1) -- 398(line=28, offs=32)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/option.dats: 425(line=32, offs=1) -- 457(line=32, offs=33)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/option.dats: 484(line=36, offs=1) -- 515(line=36, offs=32)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/option.sats: 262(line=21, offs=1) -- 291(line=21, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/stream.dats: 359(line=27, offs=1) -- 398(line=28, offs=32)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/stream.dats: 425(line=32, offs=1) -- 457(line=33, offs=25)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/stream.dats: 461(line=35, offs=1) -- 491(line=35, offs=31)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/print.sats: 189(line=14, offs=1) -- 218(line=14, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/DATS/stream.dats: 516(line=39, offs=1) -- 547(line=39, offs=32)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/reference.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/JSmath.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/JSdate.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/JSarray.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/JSglobal.sats: 200(line=16, offs=1) -- 229(line=16, offs=30)
*/
/*
/cs/coursedata/cs520/ATS2-017/contrib/libatscc/libatscc2js/SATS/Bacon.js/baconjs.sats: 1110(line=39, offs=1) -- 1142(line=40, offs=25)
*/
/*
staload-prologues(end)
*/
/*
/home/grad3/junx/project/animation.dats: 342(line=27, offs=1) -- 532(line=39, offs=3)
*/
ATSextcode_beg()
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
ATSextcode_end()
/*
typedefs-for-tyrecs-and-tysums(beg)
*/
/*
typedefs-for-tyrecs-and-tysums(end)
*/
/*
dynconlst-declaration(beg)
*/
/*
dynconlst-declaration(end)
*/
/*
dyncstlst-declaration(beg)
*/
ATSdyncst_mac(ats2js_bacon_EStream_map)
ATSdyncst_mac(ats2jspre_neg_int0)
ATSdyncst_mac(ats2js_bacon_EStream_merge2)
ATSdyncst_mac(ats2js_bacon_EStream_scan)
ATSdyncst_mac(ats2jspre_lt_int0_int0)
ATSdyncst_mac(ats2jspre_add_int0_int0)
ATSdyncst_mac(ats2jspre_gt_int0_int0)
/*
dyncstlst-declaration(end)
*/
/*
dynvalist-implementation(beg)
*/
/*
dynvalist-implementation(end)
*/
/*
exnconlst-declaration(beg)
*/
#ifndef _ATS_CCOMP_EXCEPTION_NONE
ATSextern()
atsvoid_t0ype
the_atsexncon_initize
(
  atstype_exnconptr d2c, atstype_string exnmsg
) ;
#endif // end of [_ATS_CCOMP_EXCEPTION_NONE]
/*
exnconlst-declaration(end)
*/
/*
assumelst-declaration(beg)
*/
/*
assumelst-declaration(end)
*/
/*
extypelst-declaration(beg)
*/
/*
extypelst-declaration(end)
*/
ATSstatmpdec(statmp0, atstkind_type(atstype_ptrk)) ;
ATSstatmpdec(statmp2, atstkind_type(atstype_ptrk)) ;
ATSstatmpdec(statmp4, atstkind_type(atstype_ptrk)) ;
ATSstatmpdec(statmp5, atstkind_type(atstype_ptrk)) ;
ATSstatmpdec(statmp11, atstkind_type(atstype_ptrk)) ;
ATSstatmpdec(statmp13, atstkind_type(atstype_ptrk)) ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_0(atsvoid_t0ype) ;

ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_1(atsvoid_t0ype) ;

ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_2(atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)) ;

ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_3(atstkind_t0ype(atstype_int)) ;

ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_4(atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)) ;

ATSclosurerize_beg(__patsfun_0, (), (atsvoid_t0ype), atstkind_t0ype(atstype_int))
typedef
ATSstruct {
atstype_funptr cfun ;
} __patsfun_0__closure_t0ype ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_0__cfun
(
__patsfun_0__closure_t0ype *p_cenv, atsvoid_t0ype arg0
)
{
ATSFCreturn(__patsfun_0(arg0)) ;
} /* end of [cfun] */
ATSstatic()
atstype_cloptr
__patsfun_0__closureinit
(
__patsfun_0__closure_t0ype *p_cenv
)
{
p_cenv->cfun = __patsfun_0__cfun ;
return p_cenv ;
} /* end of [closureinit] */
ATSstatic()
atstype_cloptr
__patsfun_0__closurerize
(
// argumentless
)
{
return __patsfun_0__closureinit(ATS_MALLOC(sizeof(__patsfun_0__closure_t0ype))) ;
} /* end of [closurerize] */
ATSclosurerize_end()
ATSclosurerize_beg(__patsfun_1, (), (atsvoid_t0ype), atstkind_t0ype(atstype_int))
typedef
ATSstruct {
atstype_funptr cfun ;
} __patsfun_1__closure_t0ype ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_1__cfun
(
__patsfun_1__closure_t0ype *p_cenv, atsvoid_t0ype arg0
)
{
ATSFCreturn(__patsfun_1(arg0)) ;
} /* end of [cfun] */
ATSstatic()
atstype_cloptr
__patsfun_1__closureinit
(
__patsfun_1__closure_t0ype *p_cenv
)
{
p_cenv->cfun = __patsfun_1__cfun ;
return p_cenv ;
} /* end of [closureinit] */
ATSstatic()
atstype_cloptr
__patsfun_1__closurerize
(
// argumentless
)
{
return __patsfun_1__closureinit(ATS_MALLOC(sizeof(__patsfun_1__closure_t0ype))) ;
} /* end of [closurerize] */
ATSclosurerize_end()
ATSclosurerize_beg(__patsfun_2, (), (atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)), atstkind_t0ype(atstype_int))
typedef
ATSstruct {
atstype_funptr cfun ;
} __patsfun_2__closure_t0ype ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_2__cfun
(
__patsfun_2__closure_t0ype *p_cenv, atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1
)
{
ATSFCreturn(__patsfun_2(arg0, arg1)) ;
} /* end of [cfun] */
ATSstatic()
atstype_cloptr
__patsfun_2__closureinit
(
__patsfun_2__closure_t0ype *p_cenv
)
{
p_cenv->cfun = __patsfun_2__cfun ;
return p_cenv ;
} /* end of [closureinit] */
ATSstatic()
atstype_cloptr
__patsfun_2__closurerize
(
// argumentless
)
{
return __patsfun_2__closureinit(ATS_MALLOC(sizeof(__patsfun_2__closure_t0ype))) ;
} /* end of [closurerize] */
ATSclosurerize_end()
ATSclosurerize_beg(__patsfun_3, (), (atstkind_t0ype(atstype_int)), atstkind_t0ype(atstype_int))
typedef
ATSstruct {
atstype_funptr cfun ;
} __patsfun_3__closure_t0ype ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_3__cfun
(
__patsfun_3__closure_t0ype *p_cenv, atstkind_t0ype(atstype_int) arg0
)
{
ATSFCreturn(__patsfun_3(arg0)) ;
} /* end of [cfun] */
ATSstatic()
atstype_cloptr
__patsfun_3__closureinit
(
__patsfun_3__closure_t0ype *p_cenv
)
{
p_cenv->cfun = __patsfun_3__cfun ;
return p_cenv ;
} /* end of [closureinit] */
ATSstatic()
atstype_cloptr
__patsfun_3__closurerize
(
// argumentless
)
{
return __patsfun_3__closureinit(ATS_MALLOC(sizeof(__patsfun_3__closure_t0ype))) ;
} /* end of [closurerize] */
ATSclosurerize_end()
ATSclosurerize_beg(__patsfun_4, (), (atstkind_t0ype(atstype_int), atstkind_t0ype(atstype_int)), atstkind_t0ype(atstype_int))
typedef
ATSstruct {
atstype_funptr cfun ;
} __patsfun_4__closure_t0ype ;
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_4__cfun
(
__patsfun_4__closure_t0ype *p_cenv, atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1
)
{
ATSFCreturn(__patsfun_4(arg0, arg1)) ;
} /* end of [cfun] */
ATSstatic()
atstype_cloptr
__patsfun_4__closureinit
(
__patsfun_4__closure_t0ype *p_cenv
)
{
p_cenv->cfun = __patsfun_4__cfun ;
return p_cenv ;
} /* end of [closureinit] */
ATSstatic()
atstype_cloptr
__patsfun_4__closurerize
(
// argumentless
)
{
return __patsfun_4__closureinit(ATS_MALLOC(sizeof(__patsfun_4__closure_t0ype))) ;
} /* end of [closurerize] */
ATSclosurerize_end()
/*
/home/grad3/junx/project/animation.dats: 698(line=48, offs=27) -- 717(line=48, offs=46)
*/
/*
local: 
global: __patsfun_0$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_0(atsvoid_t0ype arg0)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret1, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 698(line=48, offs=27) -- 717(line=48, offs=46)
*/
ATSINSflab(__patsflab___patsfun_0):
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 716(line=48, offs=45) -- 717(line=48, offs=46)
*/
ATSINSmove(tmpret1, ATSPMVi0nt(1)) ;
ATSfunbody_end()
ATSreturn(tmpret1) ;
} /* end of [__patsfun_0] */

/*
/home/grad3/junx/project/animation.dats: 745(line=49, offs=27) -- 765(line=49, offs=47)
*/
/*
local: 
global: __patsfun_1$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_1(atsvoid_t0ype arg0)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret3, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 745(line=49, offs=27) -- 765(line=49, offs=47)
*/
ATSINSflab(__patsflab___patsfun_1):
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 763(line=49, offs=45) -- 765(line=49, offs=47)
*/
ATSINSmove(tmpret3, ats2jspre_neg_int0(ATSPMVi0nt(1))) ;

ATSfunbody_end()
ATSreturn(tmpret3) ;
} /* end of [__patsfun_1] */

/*
/home/grad3/junx/project/animation.dats: 853(line=53, offs=44) -- 950(line=61, offs=4)
*/
/*
local: 
global: __patsfun_2$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_2(atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret6, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp7, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp8, atstkind_t0ype(atstype_int)) ;
ATStmpdec(tmp9, atstkind_t0ype(atstype_bool)) ;
ATStmpdec(tmp10, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 853(line=53, offs=44) -- 950(line=61, offs=4)
*/
ATSINSflab(__patsflab___patsfun_2):
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 876(line=55, offs=7) -- 881(line=55, offs=12)
*/
ATSINSmove(tmp8, ats2jspre_add_int0_int0(arg0, arg1)) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 876(line=55, offs=7) -- 885(line=55, offs=16)
*/
ATSINSmove(tmp7, ats2jspre_lt_int0_int0(tmp8, ATSPMVi0nt(0))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 873(line=55, offs=4) -- 946(line=60, offs=10)
*/
ATSif(
tmp7
) ATSthen() {
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 895(line=56, offs=5) -- 896(line=56, offs=6)
*/
ATSINSmove(tmpret6, ATSPMVi0nt(0)) ;
} ATSelse() {
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 908(line=57, offs=12) -- 913(line=57, offs=17)
*/
ATSINSmove(tmp10, ats2jspre_add_int0_int0(arg0, arg1)) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 908(line=57, offs=12) -- 917(line=57, offs=21)
*/
ATSINSmove(tmp9, ats2jspre_gt_int0_int0(tmp10, ATSPMVi0nt(9))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 905(line=57, offs=9) -- 946(line=60, offs=10)
*/
ATSif(
tmp9
) ATSthen() {
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 927(line=58, offs=5) -- 928(line=58, offs=6)
*/
ATSINSmove(tmpret6, ATSPMVi0nt(9)) ;
} ATSelse() {
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 941(line=60, offs=5) -- 946(line=60, offs=10)
*/
ATSINSmove(tmpret6, ats2jspre_add_int0_int0(arg0, arg1)) ;

} /* ATSendif */
} /* ATSendif */
ATSfunbody_end()
ATSreturn(tmpret6) ;
} /* end of [__patsfun_2] */

/*
/home/grad3/junx/project/animation.dats: 1077(line=68, offs=25) -- 1096(line=68, offs=44)
*/
/*
local: 
global: __patsfun_3$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_3(atstkind_t0ype(atstype_int) arg0)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret12, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1077(line=68, offs=25) -- 1096(line=68, offs=44)
*/
ATSINSflab(__patsflab___patsfun_3):
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1095(line=68, offs=43) -- 1096(line=68, offs=44)
*/
ATSINSmove(tmpret12, arg0) ;
ATSfunbody_end()
ATSreturn(tmpret12) ;
} /* end of [__patsfun_3] */

/*
/home/grad3/junx/project/animation.dats: 1136(line=69, offs=39) -- 1150(line=69, offs=53)
*/
/*
local: 
global: __patsfun_4$0(level=0)
local: 
global: 
*/
ATSstatic()
atstkind_t0ype(atstype_int)
__patsfun_4(atstkind_t0ype(atstype_int) arg0, atstkind_t0ype(atstype_int) arg1)
{
/* tmpvardeclst(beg) */
ATStmpdec(tmpret14, atstkind_t0ype(atstype_int)) ;
/* tmpvardeclst(end) */
ATSfunbody_beg()
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1136(line=69, offs=39) -- 1150(line=69, offs=53)
*/
ATSINSflab(__patsflab___patsfun_4):
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1149(line=69, offs=52) -- 1150(line=69, offs=53)
*/
ATSINSmove(tmpret14, arg1) ;
ATSfunbody_end()
ATSreturn(tmpret14) ;
} /* end of [__patsfun_4] */

/*
** for initialization(dynloading)
*/
ATSdynloadflag_init(_057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynloadflag) ;
ATSextern()
atsvoid_t0ype
_057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynload()
{
ATSfunbody_beg()
ATSdynload(/*void*/)
ATSdynloadflag_sta(
_057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynloadflag
) ;
ATSif(
ATSCKiseqz(
_057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynloadflag
)
) ATSthen() {
ATSdynloadset(_057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynloadflag) ;
/*
dynexnlst-initize(beg)
*/
/*
dynexnlst-initize(end)
*/
/* (*nothing*) */
/* (*nothing*) */
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 685(line=48, offs=14) -- 718(line=48, offs=47)
*/
ATSINSmove(statmp0, ats2js_bacon_EStream_map(ATSPMVextval(theUps), ATSPMVcfunlab(-1, __patsfun_0, ()))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 732(line=49, offs=14) -- 766(line=49, offs=48)
*/
ATSINSmove(statmp2, ats2js_bacon_EStream_map(ATSPMVextval(theDns), ATSPMVcfunlab(-1, __patsfun_1, ()))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 785(line=51, offs=16) -- 806(line=51, offs=37)
*/
ATSINSmove(statmp4, ats2js_bacon_EStream_merge2(statmp0, statmp2)) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 826(line=53, offs=17) -- 951(line=61, offs=5)
*/
ATSINSmove(statmp5, ats2js_bacon_EStream_scan(statmp4, ATSPMVi0nt(0), ATSPMVcfunlab(-1, __patsfun_2, ()))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 955(line=63, offs=1) -- 985(line=63, offs=31)
*/
ATSINSextvar_assign(ATSPMVextval(theCounts), statmp5) ;
/* (*nothing*) */
/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1065(line=68, offs=13) -- 1097(line=68, offs=45)
*/
ATSINSmove(statmp11, ats2js_bacon_EStream_map(ATSPMVextval(thePc), ATSPMVcfunlab(-1, __patsfun_3, ()))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1111(line=69, offs=14) -- 1151(line=69, offs=54)
*/
ATSINSmove(statmp13, ats2js_bacon_EStream_scan(statmp11, ATSPMVi0nt(0), ATSPMVcfunlab(-1, __patsfun_4, ()))) ;

/*
emit_instr: loc0 = /home/grad3/junx/project/animation.dats: 1152(line=70, offs=1) -- 1176(line=70, offs=25)
*/
ATSINSextvar_assign(ATSPMVextval(theRes), statmp13) ;
} /* ATSendif */
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} /* end of [*_dynload] */
ATSextern()
atsvoid_t0ype
my_dynload()
{
ATSfunbody_beg()
ATSINSmove_void(tmpret_void, _057_home_057_grad3_057_junx_057_project_057_animation_056_dats__dynload()) ;
ATSfunbody_end()
ATSreturn_void(tmpret_void) ;
} // end-of-dynload-alias
/*
/home/grad3/junx/project/animation.dats: 1182(line=72, offs=1) -- 1399(line=84, offs=3)
*/
ATSextcode_beg()
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
ATSextcode_end()

/* ****** ****** */

/* end-of-compilation-unit */