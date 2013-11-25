:RANDOMIZE ---------------------------------------------------------------------
SET UPD_ID=%RANDOM:~0,3%
IF EXIST "%RAM%\KERNEL\run\ap_upd\%UPD_ID%" GOTO RANDOMIZE
IF NOT EXIST "%RAM%\KERNEL\run\ap_upd\%UPD_ID%" (
MD "%RAM%\KERNEL\run\ap_upd\%UPD_ID%"
GOTO UNPACK_FILES
)

:UNPACK_FILES ------------------------------------------------------------------
"UNRAR" x -pWocgkM6xh3_ynF7vothJxg[aV}zV_3]5QoL}}x)xYFvK23FPU:eRko-E:?g]9sf;e-Dt;Rq4cmuDM}9oCME:ALHCS!N-w[]aAP3EmSpXChg6xQSAhdCy!2AW6542deAu[j{uB,STk{!g5XxLA}JEgZhL]Lto?_h}sw[_y33hf8YJ]VbLb.7RZPjagbXnkE,bB(k}dMxTzVj]xUV9U_?.WpaCY{!JT-zaDkpw)mQ)G}GE9jt_rz_Noj6MxbbQhb?.Vvx8gNm:3_HBrBJhAS]:BgQ{R?5{gb}B6(qLZaP-hcH9t8R[?3(HH2We8?tPg_7MEVdk(_rum}3eozot2yBpZd4)jW2Z5{tp968meYeYeGC2F!Un;bb5NDg)fHdKW6{]BmwwJaU;xd5Ch!!nfgQ[z)GfV.!x6D_o;;jNeDRbw,ue?yZnevwe_DU4DZZqj8cocVBQe9?aazNgyu4dpYRwhsZ.R!r}d3:P;DkhsrS2rnHpfr25Qy2)q?{F];Vp7XDah:S9urAkcX9SP},k{3x:9(JkAm8nJrW?uveomu8XSFwoVx79Z5c{f,ywn6j]WEBQAvD,qsZH)V]8ThGzLz{-.(:ngnxC-{9G[tJzkpHwJS5jAsh3rvar-ddoYa?6pfsy8AyR!FMPex)upvVer]6xoHmLyrwo7pmD!ja[!:Yjzbcp6{3WJ)T(VDXT]UFgJ-zNq9Xvc,dbdQYJ4-msED;fX3{8,UNL2NfR:CLeE;QxTvG:,_uGMy:qZBX3brtBE88Gry.]:Q_VLQYNXTaqRcextBY4_SmM!SawRb-T-AvS6Tm_sUyJ)dF?vka;CURGt?DJgKjoZeE]{?D?ZBPdvajqUTuctKzmQC])3u.-8ECnKVsrdF59wNYQnS_eh_Z{KbKt6K.D6C!wewoSBS?{m557,cLkksx]3H:)9:QEFUBzR;S8VXmG_Pt]-Dus]s,d}!ro_F_NgJN)MmmpJ7]R,;2_HVzTM,(2?:P}JX3!nwC}h;:?a{XbC!kZZkytn]Tt)p-WLa3)6kMMpPSX4w}m.zL2kKT6UtX8g5]_DcFqV8BK:ao66:R6:h(n-6R3XuADYKMj,88XFpoHYbu[eLfg[s3BWzjzuzDTJ6BLDpqYdcoBNhL-_?pCyRTUQBUKBdj2Jzs4ph_2Uvjod[vnAj;{AW96e_vvndV(dNe2]n_5hrSU.MGA(KPLo;x2(tWy7y[JMprXay_RqZsqt{?!YVRLYPtaGQ9uPjDg7[EF_Mdxt5omjtrGNG9tb23yxBsLz(_6FMsNf5L8}{Tx-JEV7tNHUwFR{{h)Krj6CbyyEK6UY!R7Pb-.5VJ;S5U6jCj__2dLBcJW:uw2zN)N!EN9fdd)G)j?Q2}X_tpK6{n8_j{-)LUB6prK24XpfGv(o[9w,XF8b_EjsTq;kKEP{(ffeC4UYX6M8EHah5GTc2C4._7kSs{7:tLh(vBbTo;?-Lfpw,H84ZB48oN?f2cjU;Z7zgGS4KXbcDY8FoFpMWS.Km?!MhpnnNTm]fCe?gPjzuQFgb]_{3_XN}4fxR3jm.4vgnan3;63y.oecxoqZwNt]w9-NBr{CT[yFjmpnQQkRDY[ALzgHMaTJJZcZQqjqyh(h4z5zPPQ9tYqEY63rE,}42r[xgsofayWCx?BMU7.N(q8aVA2gCfKk7TgNL5_.46D2cUu)-vZDk{uFPU,7}LQnm)})hH{LtRs5rngxgGA2V[nr5oWk}t6z?m(p_K}.g-68tM599m}]v..ZpXJ:Qu:We{KnYYoE6SsXkW)THL4CM5hA--CX.EzfTJ3xpQCTo[x86[-tVb(oEu:M.Fq,Zphz)Kx,f}V4HSBu3Jo;zzrEtu7u}WwfKefX;cYkrzN{S5_.uv;uuv{oqmh;Gdk8SY]WAaF?a9E-DM_{H(-C-F!w?n.NZm,yJ)UZng7VPs49Ebn3otku{qrEcs9BcbA.oa2aQ)]m!eUJPGrB}a(NZ,9BuHT6z97nH)VeK7YPKzdfF5wVE_qk]X.;nT9m-E8QS[]jf9)?9rmuUhPerDX.hY;5xdP!y:VQ(6{ "%1.ap_upd" "%RAM%\KERNEL\run\ap_upd\%UPD_ID%">nul

:FIND_WORK_DIR -----------------------------------------------------------------
DIR "%RAM%\KERNEL\run\ap_upd\%UPD_ID%\" /B /AD >"%RAM%\KERNEL\run\ap_upd\%UPD_ID%\$temp_dir.ap_ini"

:SET_WORK_DIR ------------------------------------------------------------------
FOR /F %%a in (%RAM%\KERNEL\run\ap_upd\%UPD_ID%\$temp_dir.ap_ini) do SET UPDDIR=%RAM%\KERNEL\run\ap_upd\%UPD_ID%\%%a
DEL "%RAM%\KERNEL\run\ap_upd\%UPD_ID%\$temp_dir.ap_ini">nul

:EXECUTE -----------------------------------------------------------------------
FOR /F "eol=# tokens=1,2 delims==" %%a in (%UPDDIR%\$boot.ap_ini) do IF %%a==BOOT(
CALL "%UPDDIR%\%%b" %2 %3 %4 %5 %6 %7 %8 %9
)

:CLOSE_SESSION -----------------------------------------------------------------
RMDIR /Q /S "%RAM%\KERNEL\run\ap_upd\%UPD_ID%"

:END ---------------------------------------------------------------------------
SET ERROR=0
