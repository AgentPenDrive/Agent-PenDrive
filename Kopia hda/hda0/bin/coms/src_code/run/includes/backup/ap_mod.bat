:RANDOMIZE ---------------------------------------------------------------------
SET MOD_ID=%RANDOM:~0,3%
IF EXIST "%RAM%\KERNEL\run\ap_mod\%MOD_ID%" GOTO RANDOMIZE
IF NOT EXIST "%RAM%\KERNEL\run\ap_mod\%MOD_ID%" (
MD "%RAM%\KERNEL\run\ap_mod\%MOD_ID%"
GOTO UNPACK_FILES
)

:UNPACK_FILES ------------------------------------------------------------------
"UNRAR" x -poZNnv!25W2T2)d}25qYR4NLyJ_]f2eTNEnA}shkPHDvVw[:2z3x3wJZESbzyPTM9F4p)L92asW(p6{P6gM)cbdw_Nw?hPTRb:FoNuP:nr{bWM?-_SDm_whAKdG__gYjjk7(e.}ZrMAMfFUoed9naQ:._K_B-7.qR7,]7AbX4rrJ)K)r;mdeAgeJ-n2{T2:r)!.kFcGq4{{fXK73]KFL?.a)nALFhP(uT)eep,5R}h)d_kFC[35A3ENPVeaC_n)3yrGosrE-9SmgB?yL843}ov4HaDZj?cK!47sVX)3(5MsmSr)?TeEF9p4J__-{mSCN;]p2GRcrj4cBTpGs33{BRg2Yq8da!w:[?sbNHND-wwHQm6HM{V55B([-jngphkypb9Bz,V?yRPPB.d5{{}hQKrW[dDyV:wJe6Zd8,k6T}.a}dEMsU]Gm,kue:t}!qYkU!W-?GdYVe}aRU:Hu{6fAP9vS3]XR9Grdjyj?cH2QWBnwE]rSf69]E43nd!CLL[;]-oBj]h}7z,4D(Tcs;K,Jt5]6aNx.W,(5pMNz]37[4}Ne9?7dR8,KC)vsZtt,u;6jRyh3ZPb[4!pC(Uv3_xsK[oB9f[a9{FS6E})m4pu)thP;BK7JHXaRLr!?.ff{,)jFMw?vkz_chXgzpMJ(ry3Bq8HqM:;PAoa3jfX3f6EW[,WxNm_EjaW8GkWan2;,Ne5)U-e}dzcn.{jPyr9h2]PpvsXgS3jnFNygVdv{c8.dnk-mag3Bsw!np43F(L-Se?{}j[NVgN{4)FNo,v!ts[efdG,q8[GM}V3y5wULK8uXtGKvCQo]Y2qCor-VzPp}qR)TN8mdFeA},2[EwwPVXDeK]mn]AbJ!_WYV[J{P;P4!vcKs9eM(y?W[sHD-z3(-!a3}zg4:()_?qSxX(Ka]Q(DGUWPT!Z2]A[JArtC,!K-vh!TuP_;mEH-fkW}q,fzCpHTfAbgF,pBktadHjh_;!Ajqcxfedex3:QGD?:Z_rgsjR5-AM}DSP:G-z,mcghDj{Z:D33MTHDBfpHvAX{8tBvzAxmte3(WfcZzE-MdQ6v]TD!9gDG9UC9b}T4t,fQhRvhc:[PSeK4{49nKs[zML8;2?7T_Mqqkk7VofqFU}p8jWU_P4-hvfmVnSvukkk45Q;S(ud7[2Ds:dzSG-}Coze9Ra4BUMk;jpWuh}ZrfkjjXjAmqQ;cPhLnRu;rGpv!cRzU7ZLLJ[]osL8hgbU(Tnyrg:g:rc-4[?:f7P-vXChQ4Q{K?8WZTVQ}X)CNpKwyRzd:Nkxs:fG6]UwB_Sg3t(hQHzk)Jg]gfpj[9f.bVHF7jCora5T4gAz;AjBZYLFEA!NpmNYFbmsT:fKdJjF!zE[A;Kg3c,nt?Agr4E)E?!d[k;n[n_{nMH,Q9hyKkmDr.zh5EupKz3Tj6FsSN?DgNF),;(Mpw6ex5W2qRQAQxa{4v?.H(E!Y2B25MtSJY)F[9oy?C{VAoajjfk-r;(Q6Mw}fq8;PkKXT{VYQa.7XaQFP}MFDXcpr9;6XbasVzQv)sT42UA;[6KYmck!}Vu?[xc89LZ[Lw;YoX_PxJS-vh6fUQmasef,bS9Jk}T]]Xay.jMx-k;,3ah:!3cwGSxyq7H9ngkxDUvECGCK-FMaw]c.dNxznvxb3EKP,[LF4FZn4h(a;XJz9..LPyKBtHsV3Bq5LAquWQf!)seBQ;A;!BPT}eb_,345kS}]8!!]Um}8dtp_w!(,F2VVF(4Hd(tX5-9C)eM7Y2ECU_KR{WSU:tvJ;Y7hbYEE7uWj8pP)PaPqhfFwBdQE7K4aq}RZeckK6F_D]XQZ)mPuZarhNF,z76aVk?.XjmpP?w8BT;g6q]ZQmQ){c}{Hkok5um_d6w-bsftKk9w9jV;5sBj4Qws}kbjeVsR?oYhfEa?;H,d-XhcPyUyNRq4A2Mv,DL_-rqn]Zs}ptswR98n8-k.Xa5eAw9BA.KGrA_.f.}5u-ZKf)(NEwNh6yVmu]:]]MR.3Z,HZBsUHSk;5wRqtm8Xj[JdDLoNeEPFkQ5K7Vkvt5zX2RMTB.w.[EdM7 "%1.ap_mod" "%RAM%\KERNEL\run\ap_mod\%MOD_ID%">nul

:FIND_WORK_DIR -----------------------------------------------------------------
DIR "%RAM%\KERNEL\run\ap_mod\%MOD_ID%\" /B /AD >"%RAM%\KERNEL\run\ap_mod\%MOD_ID%\$temp_dir.ap_ini"

:SET_WORK_DIR ------------------------------------------------------------------
FOR /F %%a in (%RAM%\KERNEL\run\ap_mod\%MOD_ID%\$temp_dir.ap_ini) do SET MODDIR=%RAM%\KERNEL\run\ap_mod\%MOD_ID%\%%a
DEL "%RAM%\KERNEL\run\ap_mod\%MOD_ID%\$temp_dir.ap_ini">nul

:EXECUTE -----------------------------------------------------------------------
FOR /F "eol=# tokens=1,2 delims==" %%a in (%MODDIR%\$boot.ap_ini) do IF %%a==BOOT (
CALL "%MODDIR%\%%b" %2 %3 %4 %5 %6 %7 %8 %9
)

:CLOSE_SESSION -----------------------------------------------------------------
RMDIR /Q /S "%RAM%\KERNEL\run\ap_mod\%MOD_ID%"

:END ---------------------------------------------------------------------------
SET ERROR=0
