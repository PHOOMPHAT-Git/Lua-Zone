local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\14\23","\188\32\57\213"),function(v42) if (v9(v42,2)==(253 -172)) then local v100=0;while true do if (v100==0) then v30=v8(v11(v42,1,1));return "";end end else local v101=v10(v8(v42,16));if v30 then local v112=0;local v113;while true do if (v112==1) then return v113;end if (v112==0) then v113=v13(v101,v30);v30=nil;v112=1;end end else return v101;end end end);local function v31(v43,v44,v45) if v45 then local v102=(v43/(2^(v44-(2 -1))))%(2^(((v45-(1 -0)) -(v44-1)) + (2 -1))) ;return v102-(v102%1) ;else local v103=0;local v104;while true do if (v103==0) then v104=2^(v44-1) ;return (((v43%(v104 + v104))>=v104) and 1) or 0 ;end end end end local function v32() local v46=v9(v27,v29,v29);v29=v29 + 1 ;return v46;end local function v33() local v47=0;local v48;local v49;while true do if (1==v47) then return (v49 * 256) + v48 ;end if (v47==0) then v48,v49=v9(v27,v29,v29 + 2 );v29=v29 + 2 ;v47=1;end end end local function v34() local v50,v51,v52,v53=v9(v27,v29,v29 + 3 );v29=v29 + 4 ;return (v53 * 16777216) + (v52 * 65536) + (v51 * 256) + v50 ;end local function v35() local v54=0;local v55;local v56;local v57;local v58;local v59;local v60;while true do if (v54==0) then v55=v34();v56=v34();v54=1;end if (v54==2) then v59=v31(v56,21,31);v60=((v31(v56,32)==1) and  -1) or 1 ;v54=3;end if (v54==3) then if (v59==0) then if (v58==0) then return v60 * 0 ;else v59=1;v57=0;end elseif (v59==2047) then return ((v58==0) and (v60 * (1/0))) or (v60 * NaN) ;end return v16(v60,v59-1023 ) * (v57 + (v58/(2^52))) ;end if (v54==1) then v57=1;v58=(v31(v56,1,20) * (2^32)) + v55 ;v54=2;end end end local function v36(v61) local v62=0;local v63;local v64;while true do if (v62==2) then v64={};for v114=1, #v63 do v64[v114]=v10(v9(v11(v63,v114,v114)));end v62=3;end if (v62==0) then v63=nil;if  not v61 then v61=v34();if (v61==0) then return "";end end v62=1;end if (1==v62) then v63=v11(v27,v29,(v29 + v61) -1 );v29=v29 + v61 ;v62=2;end if (3==v62) then return v14(v64);end end end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v65={};local v66={};local v67={};local v68={v65,v66,nil,v67};local v69=v34();local v70={};for v78=1,v69 do local v79=0;local v80;local v81;while true do if (1==v79) then if (v80==1) then v81=v32()~=0 ;elseif (v80==2) then v81=v35();elseif (v80==3) then v81=v36();end v70[v78]=v81;break;end if (v79==0) then v80=v32();v81=nil;v79=1;end end end v68[3]=v32();for v82=1,v34() do local v83=v32();if (v31(v83,1,1)==0) then local v108=v31(v83,933 -(857 + 74) ,3);local v109=v31(v83,4,6);local v110={v33(),v33(),nil,nil};if (v108==0) then local v121=0;while true do if (v121==0) then v110[3]=v33();v110[4]=v33();break;end end elseif (v108==1) then v110[3]=v34();elseif (v108==2) then v110[3]=v34() -(2^(584 -(367 + 201))) ;elseif (v108==3) then local v132=0;while true do if (0==v132) then v110[3]=v34() -((929 -(214 + 713))^16) ;v110[2 + 2 ]=v33();break;end end end if (v31(v109,1,1)==1) then v110[2]=v70[v110[2]];end if (v31(v109,2,1 + 1 )==1) then v110[880 -(282 + 595) ]=v70[v110[3]];end if (v31(v109,1640 -(1523 + 114) ,3)==1) then v110[4]=v70[v110[4]];end v65[v82]=v110;end end for v84=1,v34() do v66[v84-1 ]=v39();end return v68;end local function v40(v72,v73,v74) local v75=v72[1];local v76=v72[2];local v77=v72[3];return function(...) local v86=v75;local v87=v76;local v88=v77;local v89=v38;local v90=1;local v91= -1;local v92={};local v93={...};local v94=v20("#",...) -1 ;local v95={};local v96={};for v105=0,v94 do if (v105>=v88) then v92[v105-v88 ]=v93[v105 + 1 ];else v96[v105]=v93[v105 + 1 ];end end local v97=(v94-v88) + 1 ;local v98;local v99;while true do v98=v86[v90];v99=v98[1];if (v99<=37) then if (v99<=(17 + 1)) then if (v99<=(11 -3)) then if (v99<=3) then if (v99<=1) then if (v99==0) then local v135=v98[2];local v136,v137=v89(v96[v135](v96[v135 + 1 ]));v91=(v137 + v135) -(1066 -(68 + 997)) ;local v138=0;for v238=v135,v91 do local v239=0;while true do if (0==v239) then v138=v138 + 1 ;v96[v238]=v136[v138];break;end end end else v90=v98[1273 -(226 + 1044) ];end elseif (v99==2) then do return;end else v96[v98[2]][v96[v98[3]]]=v96[v98[4]];end elseif (v99<=5) then if (v99==4) then v96[v98[2]]=v96[v98[3]];else local v144=0;local v145;while true do if (v144==0) then v145=v96[v98[17 -13 ]];if  not v145 then v90=v90 + 1 ;else local v375=0;while true do if (v375==0) then v96[v98[2]]=v145;v90=v98[3];break;end end end break;end end end elseif (v99<=(123 -(32 + 85))) then v96[v98[2]]=v96[v98[3]]%v96[v98[4]] ;elseif (v99>7) then v96[v98[2 + 0 ]]=v98[1 + 2 ];else v96[v98[2]]=v96[v98[3]] + v98[4] ;end elseif (v99<=13) then if (v99<=10) then if (v99>9) then v96[v98[2]]=v96[v98[3]]%v96[v98[4]] ;else v96[v98[959 -(892 + 65) ]]=v98[3] + v96[v98[4]] ;end elseif (v99<=11) then v96[v98[2]]=v74[v98[3]];elseif (v99==12) then v96[v98[2]]=v96[v98[3]]%v98[4] ;else v96[v98[2]][v96[v98[3]]]=v98[4];end elseif (v99<=15) then if (v99==14) then if v96[v98[4 -2 ]] then v90=v90 + (1 -0) ;else v90=v98[3];end else v96[v98[2]]=v96[v98[3]];end elseif (v99<=16) then local v153=v98[2];v96[v153]=v96[v153](v21(v96,v153 + 1 ,v98[3]));elseif (v99>17) then if (v96[v98[2]]==v96[v98[4]]) then v90=v90 + 1 ;else v90=v98[3];end else for v317=v98[2],v98[4 -1 ] do v96[v317]=nil;end end elseif (v99<=27) then if (v99<=22) then if (v99<=20) then if (v99>(369 -(87 + 263))) then local v155=0;local v156;local v157;local v158;while true do if (1==v155) then v158=v96[v156] + v157 ;v96[v156]=v158;v155=2;end if (v155==2) then if (v157>0) then if (v158<=v96[v156 + 1 ]) then local v405=0;while true do if (v405==0) then v90=v98[3];v96[v156 + 3 ]=v158;break;end end end elseif (v158>=v96[v156 + 1 ]) then local v406=0;while true do if (v406==0) then v90=v98[3];v96[v156 + 3 ]=v158;break;end end end break;end if (v155==0) then v156=v98[2];v157=v96[v156 + 2 ];v155=1;end end else local v159=v98[2];local v160=v96[v98[3]];v96[v159 + 1 ]=v160;v96[v159]=v160[v98[4]];end elseif (v99==21) then v96[v98[2]][v96[v98[3]]]=v96[v98[4]];else v96[v98[2]]=v73[v98[3]];end elseif (v99<=24) then if (v99>23) then local v168=0;local v169;local v170;local v171;local v172;while true do if (v168==2) then for v357=v169,v91 do v172=v172 + 1 + 0 ;v96[v357]=v170[v172];end break;end if (v168==1) then v91=(v171 + v169) -1 ;v172=0;v168=2;end if (0==v168) then v169=v98[2];v170,v171=v89(v96[v169](v21(v96,v169 + (181 -(67 + 113)) ,v91)));v168=1;end end else local v173=0;local v174;while true do if (0==v173) then v174=v98[2];v96[v174]=v96[v174](v21(v96,v174 + 1 ,v91));break;end end end elseif (v99<=25) then local v175=0;local v176;while true do if (v175==0) then v176=v98[2];v96[v176]=v96[v176](v21(v96,v176 + 1 ,v98[3]));break;end end elseif (v99>26) then if  not v96[v98[2]] then v90=v90 + 1 ;else v90=v98[3];end elseif (v96[v98[2]]==v96[v98[4]]) then v90=v90 + (2 -1) ;else v90=v98[3];end elseif (v99<=32) then if (v99<=29) then if (v99>28) then v96[v98[2]]=v96[v98[3]][v98[4]];else local v179=0;local v180;local v181;local v182;while true do if (v179==0) then v180=v98[2 + 0 ];v181=v96[v180];v179=1;end if (v179==1) then v182=v96[v180 + 2 ];if (v182>0) then if (v181>v96[v180 + 1 ]) then v90=v98[3];else v96[v180 + 3 ]=v181;end elseif (v181<v96[v180 + 1 ]) then v90=v98[3];else v96[v180 + 3 ]=v181;end break;end end end elseif (v99<=(119 -89)) then local v183=0;local v184;while true do if (v183==0) then v184=v98[2];do return v96[v184](v21(v96,v184 + 1 ,v98[955 -(802 + 150) ]));end break;end end elseif (v99==31) then v96[v98[2]][v96[v98[3]]]=v98[4];else v96[v98[2]]=v74[v98[3]];end elseif (v99<=34) then if (v99>33) then do return v96[v98[5 -3 ]]();end else local v185=0;local v186;local v187;local v188;while true do if (v185==0) then v186=v98[2];v187=v96[v186 + (3 -1) ];v185=1;end if (v185==2) then if (v187>0) then if (v188<=v96[v186 + 1 ]) then v90=v98[3];v96[v186 + 3 ]=v188;end elseif (v188>=v96[v186 + 1 ]) then v90=v98[3];v96[v186 + 3 ]=v188;end break;end if (v185==1) then v188=v96[v186] + v187 ;v96[v186]=v188;v185=2;end end end elseif (v99<=35) then local v189=0;local v190;while true do if (0==v189) then v190=v98[2];v96[v190]=v96[v190](v96[v190 + 1 ]);break;end end elseif (v99==36) then local v281=0;local v282;local v283;local v284;while true do if (v281==0) then v282=v98[2];v283=v96[v282];v281=1;end if (1==v281) then v284=v98[3];for v387=1,v284 do v283[v387]=v96[v282 + v387 ];end break;end end else local v285=v98[2];v96[v285]=v96[v285](v21(v96,v285 + 1 ,v91));end elseif (v99<=56) then if (v99<=46) then if (v99<=41) then if (v99<=(29 + 10)) then if (v99==(1035 -(915 + 82))) then local v191=v98[2];local v192=v96[v191];for v240=v191 + 1 ,v91 do v15(v192,v96[v240]);end else local v193=v98[2];v96[v193](v21(v96,v193 + (2 -1) ,v91));end elseif (v99==40) then do return v96[v98[2]]();end else v96[v98[2]]=v96[v98[3]]%v98[4] ;end elseif (v99<=43) then if (v99==42) then local v195=0;local v196;while true do if (0==v195) then v196=v96[v98[3 + 1 ]];if  not v196 then v90=v90 + 1 ;else v96[v98[2]]=v196;v90=v98[3];end break;end end else local v197=0;local v198;local v199;local v200;local v201;while true do if (v197==1) then v91=(v200 + v198) -1 ;v201=0;v197=2;end if (v197==2) then for v362=v198,v91 do v201=v201 + 1 ;v96[v362]=v199[v201];end break;end if (v197==0) then v198=v98[2];v199,v200=v89(v96[v198](v21(v96,v198 + 1 ,v91)));v197=1;end end end elseif (v99<=44) then v96[v98[2]]= #v96[v98[3]];elseif (v99==45) then local v287=0;local v288;local v289;local v290;local v291;while true do if (v287==2) then for v390=v288,v91 do v291=v291 + 1 ;v96[v390]=v289[v291];end break;end if (v287==0) then v288=v98[2];v289,v290=v89(v96[v288](v21(v96,v288 + 1 ,v98[3])));v287=1;end if (1==v287) then v91=(v290 + v288) -1 ;v291=0 -0 ;v287=2;end end else local v292=v98[2];local v293=v96[v292];local v294=v96[v292 + 2 ];if (v294>0) then if (v293>v96[v292 + (1188 -(1069 + 118)) ]) then v90=v98[6 -3 ];else v96[v292 + 3 ]=v293;end elseif (v293<v96[v292 + 1 ]) then v90=v98[3];else v96[v292 + 3 ]=v293;end end elseif (v99<=51) then if (v99<=(104 -56)) then if (v99>47) then v96[v98[2]]= #v96[v98[3]];else local v204=0;local v205;while true do if (0==v204) then v205=v98[2];do return v21(v96,v205,v91);end break;end end end elseif (v99<=49) then local v206=v87[v98[3]];local v207;local v208={};v207=v18({},{[v7("\203\63\68\85\18\241\24","\118\148\96\45\59")]=function(v241,v242) local v243=0;local v244;while true do if (v243==0) then v244=v208[v242];return v244[1][v244[2]];end end end,[v7("\105\141\254\21\163\95\188\244\21\172","\212\54\210\144\112")]=function(v245,v246,v247) local v248=v208[v246];v248[1 + 0 ][v248[2]]=v247;end});for v250=1,v98[4] do v90=v90 + 1 ;local v251=v86[v90];if (v251[1]==15) then v208[v250-1 ]={v96,v251[3]};else v208[v250-1 ]={v73,v251[3]};end v95[ #v95 + 1 ]=v208;end v96[v98[2]]=v40(v206,v207,v74);elseif (v99==(88 -38)) then v96[v98[2]]=v96[v98[3]][v98[4]];elseif (v96[v98[2]]==v98[4 + 0 ]) then v90=v90 + 1 ;else v90=v98[794 -(368 + 423) ];end elseif (v99<=53) then if (v99>52) then if  not v96[v98[6 -4 ]] then v90=v90 + 1 ;else v90=v98[3];end else local v210=v98[2];local v211,v212=v89(v96[v210](v21(v96,v210 + 1 ,v98[3])));v91=(v212 + v210) -1 ;local v213=0;for v253=v210,v91 do v213=v213 + 1 ;v96[v253]=v211[v213];end end elseif (v99<=54) then do return;end elseif (v99>(73 -(10 + 8))) then local v298=v98[2];do return v21(v96,v298,v91);end else v96[v98[2]]=v98[3] + v96[v98[15 -11 ]] ;end elseif (v99<=66) then if (v99<=(503 -(416 + 26))) then if (v99<=58) then if (v99==57) then local v214=0;local v215;local v216;while true do if (1==v214) then v96[v215 + 1 ]=v216;v96[v215]=v216[v98[4]];break;end if (0==v214) then v215=v98[2];v216=v96[v98[3]];v214=1;end end else local v217=v98[2];local v218=v96[v217];for v256=v217 + (3 -2) ,v98[3] do v15(v218,v96[v256]);end end elseif (v99<=59) then local v219=v98[2];local v220=v96[v219];for v257=v219 + 1 ,v91 do v15(v220,v96[v257]);end elseif (v99==60) then local v300=0;local v301;while true do if (v300==0) then v301=v98[2];v96[v301](v21(v96,v301 + 1 ,v91));break;end end else local v302=0;local v303;local v304;local v305;while true do if (v302==0) then v303=v98[2];v304=v96[v303];v302=1;end if (v302==1) then v305=v98[3];for v397=1,v305 do v304[v397]=v96[v303 + v397 ];end break;end end end elseif (v99<=63) then if (v99==62) then v96[v98[2]]=v96[v98[3]] + v98[4] ;elseif (v96[v98[2]]==v98[2 + 2 ]) then v90=v90 + 1 ;else v90=v98[3];end elseif (v99<=64) then local v222=v98[2];v96[v222]=v96[v222](v96[v222 + 1 ]);elseif (v99==65) then v90=v98[3];else v96[v98[2]]={};end elseif (v99<=71) then if (v99<=68) then if (v99==67) then v96[v98[2]]=v73[v98[3]];else local v226=0;local v227;local v228;while true do if (v226==0) then v227=v98[3];v228=v96[v227];v226=1;end if (v226==1) then for v367=v227 + 1 ,v98[4] do v228=v228   .. v96[v367] ;end v96[v98[2]]=v228;break;end end end elseif (v99<=69) then local v229=0;local v230;local v231;while true do if (v229==0) then v230=v98[3];v231=v96[v230];v229=1;end if (v229==1) then for v368=v230 + 1 ,v98[4] do v231=v231   .. v96[v368] ;end v96[v98[2]]=v231;break;end end elseif (v99>70) then local v309=0;local v310;local v311;local v312;local v313;while true do if (v309==1) then v91=(v312 + v310) -1 ;v313=0;v309=2;end if (v309==2) then for v400=v310,v91 do v313=v313 + 1 ;v96[v400]=v311[v313];end break;end if (v309==0) then v310=v98[2];v311,v312=v89(v96[v310](v96[v310 + (1 -0) ]));v309=1;end end else v96[v98[2]]=v98[3];end elseif (v99<=73) then if (v99>(510 -(145 + 293))) then local v232=v98[2];do return v96[v232](v21(v96,v232 + (431 -(44 + 386)) ,v98[3]));end else local v233=v87[v98[3]];local v234;local v235={};v234=v18({},{[v7("\180\185\39\141\143\131\54","\227\235\230\78")]=function(v258,v259) local v260=0;local v261;while true do if (v260==0) then v261=v235[v259];return v261[1][v261[2]];end end end,[v7("\100\140\38\10\235\217\71\27\94\171","\127\59\211\72\111\156\176\41")]=function(v262,v263,v264) local v265=0;local v266;while true do if (v265==0) then v266=v235[v263];v266[1][v266[1488 -(998 + 488) ]]=v264;break;end end end});for v267=1,v98[4] do local v268=0;local v269;while true do if (v268==1) then if (v269[1]==(5 + 10)) then v235[v267-(1 + 0) ]={v96,v269[3]};else v235[v267-1 ]={v73,v269[3]};end v95[ #v95 + 1 ]=v235;break;end if (v268==0) then v90=v90 + 1 ;v269=v86[v90];v268=1;end end end v96[v98[2]]=v40(v233,v234,v74);end elseif (v99<=74) then v96[v98[2]]={};elseif (v99>75) then if v96[v98[2]] then v90=v90 + 1 ;else v90=v98[3];end else for v352=v98[2],v98[3] do v96[v352]=nil;end end v90=v90 + 1 ;end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q0012203Q00013Q0020325Q0002001220000100013Q002032000100010003001220000200013Q002032000200020004001220000300053Q0006350003000A000100010004413Q000A0001001220000300063Q002032000400030007001220000500083Q002032000500050009001220000600083Q00203200060006000A00064800073Q000100062Q000F3Q00064Q000F8Q000F3Q00044Q000F3Q00014Q000F3Q00024Q000F3Q00053Q001220000800013Q00203200080008000B0012200009000C3Q001220000A000D3Q000648000B0001000100052Q000F3Q00074Q000F3Q00094Q000F3Q00084Q000F3Q000A4Q000F3Q000B4Q0004000C000B4Q0022000C00014Q002F000C6Q00023Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q004A00025Q001208000300014Q003000045Q001208000500013Q00042E0003002100012Q004300076Q0004000800024Q0043000900014Q0043000A00024Q0043000B00034Q0043000C00044Q0004000D6Q0004000E00063Q00203E000F000600012Q002D000C000F4Q0017000B3Q00022Q0043000C00034Q0043000D00044Q0004000E00014Q0030000F00014Q000A000F0006000F001037000F0001000F2Q0030001000014Q000A00100006001000103700100001001000203E0010001000012Q002D000D00104Q002B000C6Q0017000A3Q0002002029000A000A00024Q0009000A4Q002700073Q00010004210003000500012Q0043000300054Q0004000400024Q0049000300044Q002F00036Q00023Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q0006485Q000100012Q00168Q0043000100014Q0043000200024Q0043000300024Q004A00046Q0043000500034Q000400066Q0011000700074Q002D000500074Q002600043Q0001002032000400040001001208000500024Q0010000300050002001208000400034Q002D000200044Q001700013Q000200263300010018000100040004413Q001800012Q000400016Q004A00026Q0049000100024Q002F00015Q0004413Q001B00012Q0043000100044Q0022000100014Q002F00016Q00023Q00013Q00013Q00A13Q0003043Q0067616D65030A3Q0047657453657276696365030B3Q001CA35D068F235422BE4A1303073Q002654D72976DC4603103Q0065052700D75E063706CD5504341BFD5503053Q009E30764272037C3Q00A330042660FFB4E420192570AAE9AF2500263DA6F4A66B11267AEAECAE2618397CAEE8E475436724F5A8F274416E20F1ABF87C446E26F5B4A03404192AF1E2AF29073B46ADE2FF30257B27B0F488021A3E579DA8A7743E0C58F1DFF31E200964B5EEFF770719248BD0BE3D182557AFF3A8101D7B669AD69D0116625F03073Q009BCB44705613C52Q033Q0073796E03073Q007265717565737403043Q00682Q7470030C3Q00682Q74705F7265717565737403063Q00666C757875732Q033Q0073CF3A03083Q009826BD569C20188503213Q00F443B356EF0DE809FD47AE08F547AE40E519A854FB08A149EE5AA652A15DB449F203043Q00269C37C703063Q00857868201C7003083Q0023C81D1C4873149A2Q033Q003E9AE503073Q005479DFB1BFED4C03073Q008E58C2AE35473E03083Q00A1DB36A9C05A305003043Q00426F6479028Q00026Q00F03F030A3Q004A534F4E4465636F646503023Q00697003073Q007C4C0B2B46550E03043Q004529226003073Q0089CDDC040D3CB203063Q004BDCA3B76A62030B3Q00476574506C6174666F726D03043Q00456E756D03083Q00506C6174666F726D03073Q0057696E646F777303073Q0035B38533D615A903053Q00B962DAEB572Q033Q00494F5303103Q00FE2F22F4F7A4DB2933D5DBB8DD3524E303063Q00CAAB5C4786BE03083Q0049734D6F62696C6503103Q001CD2299A00CF3C9D3DF2299A3FC82F8D03043Q00E849A14C030B3Q00476574446576696365496403043Q00B2E9435903053Q007EDBB9223D030A3Q0005E16D32367EC3E6088703083Q00876CAE3E121E1793030C3Q00BFC6198B50A703CFB9E72F8203083Q00A7D6894AAB78CE532Q033Q0082DF0103063Q00C7EB90523D9803073Q00416E64726F696403073Q002618BD39081FBD03043Q004B6776D903083Q00746F737472696E6703073Q00506C616365496403053Q004A6F624964033E3Q003Q6067616D653A47657453657276696365282254656C65706F72745365727669636522293A54656C65706F7274546F506C616365496E7374616E6365282Q033Q002C2022031F3Q00222C2067616D652E506C61796572732E4C6F63616C506C61796572293Q6003083Q00D2477506B71FCA5103063Q007EA7341074D9031A3Q00E6213489B200BCCD362583A10DF9CC6E3488B159EFCB3C2990A003073Q009CA84E40E0D47903073Q0004E1ABDA02E0B103043Q00AE678EC503063Q0053255D3D214D03073Q009836483F58453E03053Q00C0CDFA50D103043Q003CB4A48E03133Q0063144F6917C5371869200B0FC23D731E4F631A03073Q0072383E6549478D030B3Q00BCECC8C7AAE0CBD0B1E6D503043Q00A4D889BB03073Q00506C6179657273030B3Q004C6F63616C506C6179657203043Q004E616D652Q033Q0092DD7103073Q006BB28651D2C69E030B3Q00446973706C61794E616D652Q033Q007833C203053Q00CA586EE2A603193Q00830783E48AC61787F4DFD70A86B7DECB0AC2E4C9D10692E38403053Q00AAA36FE29703043Q000529A23D03073Q00497150D2582E5703043Q009325CE1A03053Q0087E14CAD7203053Q0019E2B4BFBE03073Q00C77A8DD8D0CCDD03083Q00746F6E756D626572025Q00E06F4103063Q00ABD415FC7CE503063Q0096CDBD70901803043Q002B85B24903083Q007045E4DF2C64E871030C3Q00F01A11DAB579C6E00617D6EC03073Q00E6B47F67B3D61C03053Q009A042Q53E103073Q0080EC653F26842103063Q00A5A71D4DB8EE03073Q00AFCCC97124D68B2Q0103043Q0049CD38D903053Q006427AC55BC030C3Q009E7BAB8927BD3897813EA82203053Q0053CD18D9E003053Q00F0C4C128E303043Q005D86A5AD03023Q005F47030A3Q005363726970744E616D6503063Q00B7FCCDCB34CB03083Q001EDE92A1A25AAED203043Q00EB4F7D0F03043Q006A852E10030A3Q007F217EF91A6E592D76A603063Q00203840139C3A03053Q004CC9E9435F03073Q00E03AA885363A9203123Q00745759F67092970758554ECE709491025A5303083Q006B39362B9D15E6E7030E3Q0047657450726F64756374496E666F03063Q00D2851DFCB7D903073Q00AFBBEB7195D9BC010003043Q0032AE8C4903073Q00185CCFE12C8319030C3Q0063D2AA480C7C59D6F8653F2703063Q001D2BB3D82C7B03053Q00ABD82C59B803043Q002CDDB94003133Q0033E5507E7D00EB514B7A02F47B5A6117EE4B5A03053Q00136187283F030B3Q00476574436C69656E74496403063Q00A7523F32213403063Q0051CE3C535B4F03043Q0040AADD7703083Q00C42ECBB0124FA32D030B3Q0091123E3F20FFFDBD316D4403073Q008FD8421E7E449B03053Q00BCC901DEC003083Q0081CAA86DABA5C3B703063Q002B563BD1D01103073Q0086423857B8BE742Q033Q0009230503083Q00555C5169DB798B4103063Q00D0B6444D73DB03063Q00BF9DD330251C03043Q00EF30C72803053Q005ABF7F947C03073Q0050822F137D953D03043Q007718E74E030C3Q00A122AB5ED94E05CF19BC5AD903073Q0071E24DC52ABC2003103Q003B06E4B93315F5A133192QFA3005FBBB03043Q00D55A769403043Q007921B04F03053Q002D3B4ED436030A3Q004A534F4E456E636F646501C3012Q00060E3Q00C12Q013Q0004413Q00C12Q01001220000100013Q0020390001000100022Q004300035Q001208000400033Q001208000500044Q002D000300054Q001700013Q0002001220000200013Q0020390002000200022Q004300045Q001208000500053Q001208000600064Q002D000400064Q001700023Q00022Q004300035Q001208000400073Q001208000500084Q0010000300050002001220000400093Q00060E0004001B00013Q0004413Q001B0001001220000400093Q00203200040004000A0006350004002A000100010004413Q002A00010012200004000B3Q00060E0004002200013Q0004413Q002200010012200004000B3Q00203200040004000A0006350004002A000100010004413Q002A00010012200004000C3Q0006350004002A000100010004413Q002A00010012200004000D3Q00060E0004002A00013Q0004413Q002A00010012200004000D3Q00203200040004000A2Q0004000500044Q004A00063Q00022Q004300075Q0012080008000E3Q0012080009000F4Q00100007000900022Q004300085Q001208000900103Q001208000A00114Q00100008000A00022Q00030006000700082Q004300075Q001208000800123Q001208000900134Q00100007000900022Q004300085Q001208000900143Q001208000A00154Q00100008000A00022Q00030006000700082Q00230005000200022Q004300065Q001208000700163Q001208000800174Q001000060008000200060E0005006300013Q0004413Q0063000100203200070005001800060E0007006300013Q0004413Q00630001001208000700194Q0011000800093Q0026330008005D0001001A0004413Q005D00010026330008004C000100190004413Q004C0001002039000A0001001B002032000C000500182Q0010000A000C00022Q00040009000A3Q002032000A0009001C00062A0006005A0001000A0004413Q005A00012Q0043000A5Q001208000B001D3Q001208000C001E4Q0010000A000C00022Q00040006000A3Q0004413Q006300010004413Q004C00010004413Q006300010026330008004A000100190004413Q004A0001001208000800194Q0011000900093Q0012080008001A3Q0004413Q004A00012Q004300075Q0012080008001F3Q001208000900204Q00100007000900020020390008000200212Q0023000800020002001220000900223Q00203200090009002300203200090009002400061200080074000100090004413Q007400012Q004300095Q001208000A00253Q001208000B00264Q00100009000B00022Q0004000700093Q0004413Q00BF0001001220000900223Q002032000900090023002032000900090027000612000800B5000100090004413Q00B50001001220000900013Q0020390009000900022Q0043000B5Q001208000C00283Q001208000D00294Q002D000B000D4Q001700093Q000200203900090009002A2Q002300090002000200060E000900AF00013Q0004413Q00AF0001001208000900194Q0011000A000B3Q002633000A00A80001001A0004413Q00A80001002633000A0088000100190004413Q00880001001220000C00013Q002039000C000C00022Q0043000E5Q001208000F002B3Q0012080010002C4Q002D000E00104Q0017000C3Q0002002039000C000C002D2Q0023000C000200022Q0004000B000C4Q0043000C5Q001208000D002E3Q001208000E002F4Q0010000C000E0002000612000B00A00001000C0004413Q00A000012Q0043000C5Q001208000D00303Q001208000E00314Q0010000C000E00022Q00040007000C3Q0004413Q00BF00012Q0043000C5Q001208000D00323Q001208000E00334Q0010000C000E00022Q00040007000C3Q0004413Q00BF00010004413Q008800010004413Q00BF0001002633000A0086000100190004413Q00860001001208000A00194Q0011000B000B3Q001208000A001A3Q0004413Q008600010004413Q00BF00012Q004300095Q001208000A00343Q001208000B00354Q00100009000B00022Q0004000700093Q0004413Q00BF0001001220000900223Q002032000900090023002032000900090036000612000800BF000100090004413Q00BF00012Q004300095Q001208000A00373Q001208000B00384Q00100009000B00022Q0004000700093Q001220000900393Q001220000A00013Q002032000A000A003A2Q0023000900020002001220000A00013Q002032000A000A003B001208000B003C4Q0004000C00093Q001208000D003D4Q0004000E000A3Q001208000F003E4Q0045000B000B000F2Q004A000C3Q00032Q0043000D5Q001208000E003F3Q001208000F00404Q0010000D000F00022Q0043000E5Q001208000F00413Q001208001000424Q0010000E001000022Q0003000C000D000E2Q0043000D5Q001208000E00433Q001208000F00444Q0010000D000F00022Q0003000C000D000B2Q0043000D5Q001208000E00453Q001208000F00464Q0010000D000F00022Q004A000E00014Q004A000F3Q00052Q004300105Q001208001100473Q001208001200484Q00100010001200022Q004300115Q001208001200493Q0012080013004A4Q00100011001300022Q0003000F001000112Q004300105Q0012080011004B3Q0012080012004C4Q0010001000120002001220001100013Q00203200110011004D00203200110011004E00203200110011004F2Q004300125Q001208001300503Q001208001400514Q0010001200140002001220001300013Q00203200130013004D00203200130013004E0020320013001300522Q004300145Q001208001500533Q001208001600544Q00100014001600022Q004300155Q001208001600553Q001208001700564Q00100015001700022Q00450011001100152Q0003000F001000112Q004300105Q001208001100573Q001208001200584Q00100010001200022Q004300115Q001208001200593Q0012080013005A4Q00100011001300022Q0003000F001000112Q004300105Q0012080011005B3Q0012080012005C4Q00100010001200020012200011005D3Q0012080012005E4Q00230011000200022Q0003000F001000112Q004300105Q0012080011005F3Q001208001200604Q00100010001200022Q004A001100054Q004A00123Q00032Q004300135Q001208001400613Q001208001500624Q00100013001500022Q004300145Q001208001500633Q001208001600644Q00100014001600022Q00030012001300142Q004300135Q001208001400653Q001208001500664Q00100013001500022Q00030012001300072Q004300135Q001208001400673Q001208001500684Q001000130015000200201F0012001300692Q004A00133Q00032Q004300145Q0012080015006A3Q0012080016006B4Q00100014001600022Q004300155Q0012080016006C3Q0012080017006D4Q00100015001700022Q00030013001400152Q004300145Q0012080015006E3Q0012080016006F4Q0010001400160002001220001500703Q0020320015001500712Q00030013001400152Q004300145Q001208001500723Q001208001600734Q001000140016000200201F0013001400692Q004A00143Q00032Q004300155Q001208001600743Q001208001700754Q00100015001700022Q004300165Q001208001700763Q001208001800774Q00100016001800022Q00030014001500162Q004300155Q001208001600783Q001208001700794Q0010001500170002001220001600013Q0020390016001600022Q004300185Q0012080019007A3Q001208001A007B4Q002D0018001A4Q001700163Q000200203900160016007C001220001800013Q00203200180018003A2Q001000160018000200203200160016004F2Q00030014001500162Q004300155Q0012080016007D3Q0012080017007E4Q001000150017000200201F00140015007F2Q004A00153Q00032Q004300165Q001208001700803Q001208001800814Q00100016001800022Q004300175Q001208001800823Q001208001900834Q00100017001900022Q00030015001600172Q004300165Q001208001700843Q001208001800854Q0010001600180002001220001700013Q0020390017001700022Q004300195Q001208001A00863Q001208001B00874Q002D0019001B4Q001700173Q00020020390017001700882Q00230017000200022Q00030015001600172Q004300165Q001208001700893Q0012080018008A4Q001000160018000200201F00150016007F2Q004A00163Q00032Q004300175Q0012080018008B3Q0012080019008C4Q00100017001900022Q004300185Q0012080019008D3Q001208001A008E4Q00100018001A00022Q00030016001700182Q004300175Q0012080018008F3Q001208001900904Q00100017001900022Q00030016001700062Q004300175Q001208001800913Q001208001900924Q001000170019000200201F00160017007F2Q003D0011000500012Q0003000F001000112Q003D000E000100012Q0003000C000D000E2Q0004000D00044Q004A000E3Q00042Q0043000F5Q001208001000933Q001208001100944Q0010000F001100022Q0003000E000F00032Q0043000F5Q001208001000953Q001208001100964Q0010000F001100022Q004300105Q001208001100973Q001208001200984Q00100010001200022Q0003000E000F00102Q0043000F5Q001208001000993Q0012080011009A4Q0010000F001100022Q004A00103Q00012Q004300115Q0012080012009B3Q0012080013009C4Q00100011001300022Q004300125Q0012080013009D3Q0012080014009E4Q00100012001400022Q00030010001100122Q0003000E000F00102Q0043000F5Q0012080010009F3Q001208001100A04Q0010000F001100020020390010000100A12Q00040012000C4Q00100010001200022Q0003000E000F00102Q0023000D000200020004413Q00C22Q0100203200013Q001A2Q00023Q00017Q00",v17(),...);
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--
