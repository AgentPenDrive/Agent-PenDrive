:: ECHO Compiling...
:: CALL "hda_compiler.bat"

@ECHO OFF
TITLE Virtual Machine Emulator
CLS

:ENVIRONMENT -------------------------------------------------------------------
CLS
SET VME_DIR=%CD%

:CLEAR_RAM ---------------------------------------------------------------------
CLS
SET RAM=%CD%\RAM
:: IF EXIST "hda" RMDIR /Q /S "hda"
IF EXIST "RAM" RMDIR /Q /S "RAM" & MD "RAM"

:BOOT --------------------------------------------------------------------------
CLS
FOR /F "tokens=1,2 delims==" %%a in (%VME_DIR%\CMOS.ap_cmos) do (
  IF %%a==BOOT (
    IF %%b==PRIMARY (
      IF EXIST "%VME_DIR%\%%c\$mbr.ap_mbr" (
        FOR /F "eol=[ tokens=1,2 delims==" %%a in (%VME_DIR%\%%c\$mbr.ap_mbr) do IF %%a==BOOTLOADER CALL "%%b" & GOTO END
      )
    )
    IF %%b==SLAVE (
      IF EXIST "%VME_DIR%\%%c\$mbr.ap_mbr" (
        FOR /F "eol=[ tokens=1,2 delims==" %%a in (hda\$mbr.vme_mbr) do IF %%a==PRIMARY CALL "hda\%%b" & GOTO END
      )
    )
  )
)
:CDD ---------------------------------------------------------------------------

:: CHECK_CD_EXISTING -----------------------------------------------------------
CLS
IF EXIST "cda.vme_cdd" "includes\cmds\WinRAR\UNRAR" x -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 "cda.vme_cdd">nul
IF NOT EXIST "cda.vme_cdd" GOTO HDD

:: BOOT_CD ---------------------------------------------------------------------
CLS
IF EXIST "cda\$mbr.vme_mbr" FOR /F "eol=[ tokens=1,2 delims==" %%a in (cda\$mbr.vme_mbr) do IF %%a==PRIMARY CALL "cda\%%b"
IF NOT EXIST "cda\$mbr.vme_mbr" (
  ECHO Error! This CD does not support MBR record, or isn't correct!
  ECHO Cannot be booted!
  CALL "includes\cmds\Timeout\timeout" 5
  GOTO HDD
)

:HDD ---------------------------------------------------------------------------

:: CHECK_HDD_EXISTING ----------------------------------------------------------
CLS
:: IF EXIST "hda.vme_hdd" "includes\cmds\WinRAR\UNRAR" x -p[T(ANB;sWHyzDF.etqCohzFPQ5q;SbK3]VjYdoQ}]P{Pb}[4;LRmLcAgF?meg]Gs7?RJtnY;BcSss2VwtshD5xzr;k6mvsc2x_qrvPu)?L!ytZunSb!,9!tcqXWkP}LMGBCC6(PcXTaRz4CREHTtML5Bq-,EFM744qm{,}qZ9Zw8_{!MVXFpqr?ex_yDU6n;V8CWo_:V8y_g))[9bPW2F4ECbDW(qH}KvSojZqD{pMu.Z;aAS)gdf,wQFS3]ghVc}HUf{dt,?o,6rcnJp3:45yzrR2.)HWqXkJCy:(z_y,dqdY{2-A]c}[36b3jz!8Wpxfnzsn-romfZKu-R]B[JLbv,De,HMY)JDyJ(mR,8Bg{3bFymW-]pj?q,ksJ)QVWaUmmEBntT4-.DMz!q-}dqF4s?UACqceY)ZJSh]KBeRBykB:9JCL{Xu!4NFnDx2h]?-3pBt!wJGu[Xwhn{[.c;?FSL-bJ8TTeZ,3hu7dDu7MR4]DhDETHKefcnR,TqU{PWg(QNp9GV,e;(xnQCEd3zTEmqFEfgS[C}E93[Gp6H3aUZVqhf4Kf:6Zsrk78CgqR,Xy(mog[PQ4vsTd7:;M!9sxZc5)uK:LMZKXL)DU3a;W2WA{ZDZ6tS3S[)6:X8Pq{eMYr7ySG:voZ],!N2aFyCe-PJ]sxYh]D[9[g83:aWq}7rE.SvGR),X3K9TH{ASRK-2-f_[Q6z5CrqCHkZfw2CXssx}?{8XYe;6T)epjeT.5JCt_h8!Jr3AjZPpd,LCfPo}33;KFXKrn4jvLRzaG3q!-DumFE:,aqBBRE3djs46VMZnjYW??L])6!ysJ.tyr[AGPh.{a4j]vHxdnUksnv!Sz:JH;BGuLWBgEBuumc!fz:TnWCeH)kf)n!UrGhk8D.PYCHS:.Xj.2Co:V2L9K-m)(E:S,o?FpVk?kC[kgsmG]8K6}cDYj;cvJfNL3U7QvRWe97YQYKc9y:D)eXcW2NSr[mBbEo-AE5vuAUJek,Mh;7vh[7Eb.c2[Wjmh7txrWtkcM[Q(]ju{QpvYVAAVsh6PZQ()H[:m,oWNwtZ?cTE-HA7kQoEG5rb]GoG6xKQy)tM[msAWLU5aaAT?:eM86;hss!WpPtn3m}b6-r_TLd_,t3-wGU4sYLkQRFDn{?NzE!6LvdmGRuHJVQFjqqaPBTk8f;Tu[otPsXfoBZ[8USxvoDdd_N-Josw4vQW!CQT[u{x(e?k}Yh[L.o!_B)R;!N8zj[!,ZX(Uc_6R{Q6d)e!{3[FkGdpL?VLq6Qs]u:66]B,J77,kL?xuACdWw2p::As87jjZnN]w5(EAjF.]Mx;3}g;(Ht{K_!xepgDa[P7e2rvJ)vTYsX?-D]C3:Qs]VqqK7[zfX6T;WPN9Jo)AKDH5NZ(Rv;3RuRgZZfF;Lf_o[WWSJa99twDGVPdRSFoMc4sCJ)GbsPY,r.T}b-p4:-rYW5vvqjG3M}kbL?MDVrFLre23nQ(qX,Nz7JvV-B:UQo]huW,PNGgE,GnpdxdAy-A5Q]?XM_xjw_2q64DyrzCsG;fz.TAzZQ5v2aTtjQbeXC5_mo-boJ3[MH[NgJMFewBF7a{P!q[4-dcs2j4N_(WVT7pAvBWa{dvkM[}SyJ,?,ex4X2w6cT?]!uL.]oaJZ5_tdHKc7Mh9?fB4F{}x7E_c}TcKFM9mwhea!!MbR[KXq2-]fF_L2A;f9g!v_dg;VUeZY-BwA2T?_2AonJ}MYC_{y)[-rq(LKqspw_m)aECjmT68hm.G;_V,F5[(UEXk[Q9?XUD{eWwZv3)dM).QFWS2-2d3mBMv7,,]VFJAhEfdosRA!R6Ku;s.664RnvLSwN4R9s7Q)M_zDZ}Jxmarq2sU(UryPCRL6zhDsPa;gj;.HDJE;z]t2:McWDbsV-C?-.KyQz,(j?)?JVKMUVF,Y8d,rPtMV(S3)h23h3dZ8r7wLxJnS5oxC2y[wrVR:uz}cZgT_UzgK7dc4:Y,7MyquwyqoUGqNF!!nnYuGYb8]PKdRqf:Bdt(9r.VLGLe4RkQCJKZo.)yPXcmMRp5[gfj8gDy;6d "hda.vme_hdd">nul
:: IF NOT EXIST "hda.vme_hdd" GOTO ERROR

:: BOOT_HDD --------------------------------------------------------------------
CLS
IF EXIST "hda\$mbr.vme_mbr" FOR /F "eol=[ tokens=1,2 delims==" %%a in (hda\$mbr.vme_mbr) do IF %%a==PRIMARY CALL "hda\%%b" & GOTO END
IF NOT EXIST "hda\$mbr.vme_mbr" GOTO ERROR

:ERROR -------------------------------------------------------------------------
CLS
ECHO Please insert a bootable media!
ECHO When ready, press ENTER.
PAUSE>NUL
CLS
ECHO Checking...
CLS
IF EXIST "cda.vme_cdd" (
  "includes\cmds\WinRAR\UNRAR" x -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 "cda.vme_cdd">nul
  IF EXIST "cda\$mbr.vme_mbr" FOR /F "eol=[ tokens=1,2 delims==" %%a in (cda\$mbr.vme_mbr) do IF %%a==PRIMARY CALL "cda\%%b"
  IF NOT EXIST "cda\$mbr.vme_mbr" (
    ECHO Notice! This CD doesn't support MBR record, or isn't correct!
    ECHO Cannot be booted!
    CALL "includes\cmds\Timeout\timeout" 5
    GOTO ERROR
  )
)
IF NOT EXIST "cda.vme_cdd" GOTO ERROR

:END ---------------------------------------------------------------------------
CLS
ECHO Now you can safety turn off your machine!
PAUSE>NUL
GOTO END