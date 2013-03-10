:RANDOMIZE ---------------------------------------------------------------------
SET LIB_ID=%RANDOM:~0,3%
IF EXIST "%RAM%\KERNEL\lib\dll\%LIB_ID%" GOTO RANDOM
IF NOT EXIST "%RAM%\KERNEL\lib\dll\%LIB_ID%" (
  MD "%RAM%\KERNEL\lib\dll\%LIB_ID%"
  GOTO UNPACK_FILES
)

:UNPACK_FILES ------------------------------------------------------------------
UNRAR x -px:xyHQ.6b4t2)JnLozm(Po(prYo)NAxKCvJZLJ(,t;3!NNQANAMh:X6u,T?Q9;fsz!SKP4LG7uLzHgAcx3Uz??u_Y.X{;D!;HWNc!fycaJcy?ta:U[:2}w9ew)s.Qw;dSRQX)N}odsmjkUnE5pmkkUXg7Pg:LkgkB(GPZWBDP,:{VpS?cDqWdMCKhyM_j[tzEANmd6;-7?E_ud{7w:_aQLz{KMG_V}_gPW3_-6}dcUm7)zC_:LjSch6,]s]7-CNWfv5nZjZBCLoQK?YMRGm[!R(}JFnRX}tD[W!aF5sYwfvGnT9DfUMksXzAjm7GzZZ[:6kJAco(RhSDB-Ww3pfTMe9]ZFSZmyao4T(k(zv3hNnyVHv:(bVXQ]9vQ-UB![!94BSeBMGzg_yBQtD34f?yqfuFnNXrX3Y?kwm.J-z?AxG7r2{UFES]zLQnftcDVBJE{]FXBF4SDr;[RC4cW,oWNDH_).L8CbtRm}u:UXUdNYnmgQWDRKfk4;tf!ENHwFehU9mv(F8ZkUKZqojF)Y?f4zU9EowA[ay5JjYU;(.o7KNV)(hKbp!DoZs_NpJWYG-o?6H]hHxN9LqmW7({VARJgJR[)f6b:dX_HnD?[ATh3J4;weCRvafby(k(sQnv_K:R(FWFWw;!E7[BLL8G.MxyYh[R{wLFGPdTb}e{(jCRPL8gcE:c8.b)jm4wguC;HvWy]B(GzNdPeK(Q6}_CAjPy4xvKs)N}_r{D-KZ-dDVS48p{nwR,fmzHjv8a-,qAs:UzMz??D3Xn}M.,HR::C:L,yzc!.2Ft5fsxfy:y22mftnhBCmEVp6Wn5{r6f)XJtQG8PK7vsSbmDS,WCFy?sUsV9j-Pw6ep,.WQL[KC2.:mT!GbLEhCf9ePSmjNRXCSXeopo{-P}[}8}WJZg?hWfVr)Ga2d)j(bWzZK)8eMgtzwQHV(PC9[eZF.AneM6q;-q5R,B(Py!PuUdP7-7EALkWMzJ?MuwR.m.SoB4CA97[_JXeQ]z7Vk_pkRu(Kr4Lc5jZnMh,.N][c9o_jofE7o_QE:35u]w6ef(Z-t2_FcCyK?-[tnPYaWuuZVXU7U?K}BrG[RQQ_8PTdV36Hw]xT!rzZPT)pZW;gMKrkfGtNbL?)tcVqnSHrJGReg43F?7:TwuDcA(?sX(!RpZFby53Hry,834u9Aw_(rLp?Xuy.?;Rv5d63G)q{(rmeUeNabVn2nb8J67Kcah8DUDnhRcv34gG;Vae(]2dxBLGox7Z8P)spQd7nQ3PyHc,jLfvWG9TYzfLxLs6f!W5VABH6jd5?P7qfMkC9Sb)SQYPhQzXVW_wdJDJ-wt{KY:?snHZEzdcQB-)8-b_4j;F_H5}EXN6:QbuCzUWz){PNE2.MC[v.)B_VnHfJbKM-,FJ.fmzszPFEvG7)Q3{3jG:66juG_FN[3c]HX]AWYVhUhN8)wmfe_jJd2Dz9ZNj_!tQ4:6?3-o,qB9:)Uhs42BG-VGg.aZ_fSYHV]N:CA!-Se[5}sWhSd;Z{LG}.nGfEn:gxQk}7pG;4R9hH]Zgo5F.v4}vQWbaJdQF[}Vf;hj7{SPW3vCPYYQU_6QX_?)Rj4dsj{8nwRT]pp8QjrmHPAhWm).tD)K,g:uYB3K{ykJn8wCRn:eBDWe!aeytsHv8Lp(4QWgPG!Bu.TLoW!;g2hmAVk[N-;.Tt(,J9jdvouqpNAbrEf8nWT:yC(LK}Mj_YmR)4[-R;wES(wJRbwD{PF)7SYx8rffPZ(2[E9ZJ5khgg?)R:Q6Rch;[F.g(gV2G7_QsgvBLfy-V!Et-bXXME3WZ4DcJeD6LL,D_xUTcTZ{Xm?5V4_ppbLPD5-4HK}acAtk)NCpoj:K4_v!c:tZdEuxp.Z)Ken,ufm-[;wwnyGP-BUjDNHx8BuVCU84{U6_AR}JU(FF[3bAj]z,XGz(Yu7hNEK3evbuLqDn,Y-(?jLpuKrR8q3)k}u)TDe{}P_ZELLGqTSvBkk(]a3hZ]vJKpWk-BxG7?nsR{{G86CqP,.Yc4GCdB2;!;o)EmUrrFhGUv5_2nxwpxUZZhhDzJH "%1" "%RAM%\KERNEL\lib\dll\%LIB_ID%">nul

:FIND_WORK_DIR -----------------------------------------------------------------
DIR "%RAM%\KERNEL\lib\dll\%LIB_ID%\*.*" /b /ad /one  > "%RAM%\KERNEL\lib\dll\$temp_name.ap_ini"

:SET_PATH_DIR ------------------------------------------------------------------
FOR /F %%a in (%RAM%\KERNEL\lib\dll\$temp_name.ap_ini) do PATH %RAM%\KERNEL\lib\dll\%LIB_ID%\%%a;%PATH%

:DEL_TMP_NAME_FILE -------------------------------------------------------------
DEL "%RAM%\KERNEL\lib\dll\$temp_name.ap_ini"

:REGISTER_LIB ------------------------------------------------------------------
ECHO %LIB_ID%>>"%RAM%\KERNEL\lib\dll\$act_lib.ap_ini"

:END ---------------------------------------------------------------------------
SET LIB_ID=
