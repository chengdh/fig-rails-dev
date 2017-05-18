(function (root, factory) {if (typeof define === 'function' && define.amd) {define(['exports', 'echarts'], factory);} else if (typeof exports === 'object' && typeof exports.nodeName !== 'string') {factory(exports, require('echarts'));} else {factory({}, root.echarts);}}(this, function (exports, echarts) {var log = function (msg) {if (typeof console !== 'undefined') {console && console.error && console.error(msg);}};if (!echarts) {log('ECharts is not Loaded');return;}if (!echarts.registerMap) {log('ECharts Map is not loaded');return;}echarts.registerMap('410800', {"type":"FeatureCollection","features":[{"type":"Feature","id":"410802","properties":{"name":"解放区","cp":[113.226126,35.241353],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@@@E@C@AABG@AACAABADBDA@GAECAAAAC@CLOFWBYNYBEAAAECEO@MBSA[MEAECALBJFF@HAFIBOHIHCFK@CD@HJNFF@JCF@@@@@@@@@@CF@P@BGBKBAFI^@HXLFJAH@@@@@JHLDD@@@@RLRJJBB@JSL[NOFKHCBAJCBA"],"encodeOffsets":[[115963,36116]]}},{"type":"Feature","id":"410804","properties":{"name":"马村区","cp":[113.321703,35.265453],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@EBABCBCBA@@@EDC@@FBNDP@FCFCDEJGHCLCFBDJD@FA@E@AB@FDF`JDDLDJ@B@BDADEBG@C@ADIDAJAHELAF@@@@ABGBODGD@@B@BDFBDBDDB@BBBBDB@BBB@BDBBBDD@@BDBBDDB@DBBBBB@BB@BBD@BAB@DABABAB@FOJIF@JJTDHDHTBB@B@B@BBB@B@BBB@@BDDB@@BBB@D@JAXKJEnANARBH@FM@A@@@E@A@@BAAACACCCEAC@G@A@AAABA@A@A@ABC@AAC@@EACCA@A@AAA@EAAAECAAAA@AA@AA@CCCACA@@AAC@@BA@A@A@A@AAACEA@CA@AA@A@AAA@AACAC@G@A@AAAACG@CAA@AAA@ACC@@CCAAA@AAAACC@AAAAA@@@G@A@A@A@C@A@@@AA@AAA@A@A@C@G@A@E@C@E@A@A@EAA@@A@A@ABA@A@C@ACA@@AE@@@A@A@A@@@AAC@ACA@@CAA@AAA@AAA@AAC@AAA@CBA@AAABA@CAA@"],"encodeOffsets":[[116050,36060]]}},{"type":"Feature","id":"410803","properties":{"name":"中站区","cp":[113.175485,35.236145],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@JABE@GEEAIBK@AKAMCC@EB@@CB@DCAI@@@AHAB@BC@@@C@@BC@@D@@@@A@ADA@@DA@B@C@@@A@@@G@@@C@@@@@@CAABCA@@ED@BC@@A@AAABC@EFA@ABABA@@@C@A@A@CBABCBED@@CBA@A@A@@BG@A@A@CBCB@@ABABABAB@BA@AD@FAB@B@BCBABCDAB@@@B@B@B@B@@@B@B@@BB@B@D@@AB@@@BBD@@@B@B@B@FAFAD@DADADABAB@@CAGBE@CB@@@@BL@B@D@@BB@B@@@B@B@@B@@@B@BB@@@B@@@@@@BB@@BB@@DBBBA@BB@@@@B@@@@@B@@@@B@@B@B@@@BB@@B@@@BB@B@@D@@@A@@BB@@@@@@@@@@@@D@BABAB@BA@A@@@@BA@@@@@@@@@@B@@@@@@@B@@A@A@@@@BBBA@@BB@@BBB@@@@E@@@@@BB@@A@@B@@@@AB@B@BAB@B@@B@@@@@@@@@BB@@BA@@@BB@B@@@B@@@@B@@DB@@BB@@A@C@A@ABA@B@@B@@@@A@@@@D@@B@@BBB@@BBBB@@@BBBBDBB@B@@B@@B@@B@B@B@B@@B@@@D@@BB@B@@@BA@@@@BBB@BB@B@@BB@DBBBBB@@B@B@@@B@BB@@@BABAB@BAHBBDBF@D@BBB@@BBB@D@BCHAB@B@B@@DBD@HBB@B@@@D@@@@B@@@BBAB@@AD@DAB@J@@@B@D@H@D@D@HBD@@BH@BBD@D@B@BBD@D@LGNM@ABA@@DEBA@ADC@@BC@@@ABABCBCDKAGCGA@IAQIQK@@@@CCGK@I@@@@BGEIWK@GJ]BELAHA@A@ODE@@@@@@@@@@DE@IEEIM@GDCL@DEJGPG"],"encodeOffsets":[[115922,36049]]}},{"type":"Feature","id":"410811","properties":{"name":"山阳区","cp":[113.26766,35.21476],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@I@BIA@@AC@@CBKUAC@I@IHG@@F@@DB@@DA@LABF@@FC@ADS@@@G@GHMBE@I@O@A@MAC@ABCBKB@H@B@D@@@@@JBJ@@JHD@H@@FH@@@BJ@@BBBB@B@DB@@@B@BJ@F@B@H@DPDFLFB@@D@DNJF@@@@B@@A@@FBD@BEF@DC@AB@@@DBBA@@@BB@@CFBB@B@@@D@BABBB@@@ADC@@FB@ADBB@D@@@@D@@@H@@@B@@@D@A@B@@CB@BCB@@@@@@CD@@AD@@@D@@ABABG@@J@DB@CDA@@FAD@NDLB@BFDFB\\NTBNAP@DFBFBBAFMZAZEXKP@DBDBBDBBF@HCBCAABBBBD@BAHBBD@F@@@BA@CDADBDJ@DBB@BBBDF@@BB@BFFBBBB@BDBBBBBBBBB@@BB@BBB@BDDBDBBDDFDBBBBBB@BJFHDBBB@BBFBBBB@B@BBHCPCHABA@@@@BEFKBGBIJCBCD@H@FABCACA@I@KCCC_ICE@EBAF@B@@EICACDEDKHGFIDCDE@ECOAM@ED@FC@@B@DADABAFACEAACAEACA@AAAB]AAA@iICAACACCEAGAC@AAAC@AAAAAC@AACCAC@C@EAAAAAAEA@A@@K@@H@@@B@@@@A@C@@@@B@@CB@@DB@@CH@ADJ@@@@CF@@EDB@EB@@@B@@@@@@C@@F@@A@@@@B@BBBB@@BA@@@@DB@@LBADH@@FB@B@@@@DD@@@@@@CF@@@BCJB@AD@B@LB@EC@A@@@AA@E@@@E@CF@@CDB@CB@BEF@@AB@@@D@@C@@CB@CI@C@AAA@W@@CMJQ@@PK@@MwDEB@FKF@@A@ABAB@ACBCBI@IDC@EAIAEA]GKA@CeG@EB@@@BG@AA@A@@ABEA@G@KA"],"encodeOffsets":[[115898,35956]]}},{"type":"Feature","id":"410821","properties":{"name":"修武县","cp":[113.447465,35.229923],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@HEDEDE@GBI@IBCDCHCDCFEHADAJGDADCRGNITOHGJQLSDIDI@MBEBCHIDCFADEJI@AB@BKEGECMBEA@IDCDGGEPOFA@@@@FC@EAMAC@CBCBEHCBA@CBK@GBW@ADAD@DBF@NBP@B@B@BGDCB@F@BK@@@@@K@GDIBIHEDC@@@@BAFGDG@@@@@AHIFS@EAECCIGKCMQ@G@M@OBGFKBCCACCEACAGGCCCCAAAEAAA@@AA@EAE@A@A@C@C@EACAEAEAE@CAC@AAC@AAC@AAC@A@AA@@A@AAAAAACACAAAA@@@A@A@A@C@AJOREBAA@GDUDEBG@CAAC@CD@DEH@PEHCBA@AACMGEC@@CA@@ACCC@EBC@GCGAECGICEC@A@AAC@ODIACD@@@B@@@RB@BB@FD@@DADE@@D@@A@_C@I@ABK@@E@@AA@@C@@CB@C@IA@@CC@QAC@@@A@@BE@AFA@@DCA@DE@@D@F@@@FBB@@B@D@@FKAA@C@@BIAAD@@E@@D@@@@C@@C@@A@A@@EG@BCKA@@CA@@@@AB@@AAAAA@@@@@@BE@@@@D@@@@A@@@A@@FCA@FE@@D@@I@BCG@@DA@@CA@@DA@@@@@@D@B@@A@@@G@@@@LB@B@BFBBBBFBD@D@DBBD@BBDBBBBD@BB@BBDBHDFBDBDDBjJB@BBA^BB@BDBFBDBBBDFB@DBB@BABBB@DAB@BBD@BBB@BBB@BBB@DB@@DB@BBD@B@@@B@B@B@@BF@@DB@B@D@BAB@B@B@BB@FBB@B@F@D@F@B@H@D@B@B@B@BBB@@B@@@B@D@B@B@B@H@@BBBB@BDDBBBBB@BBDD@@DD@BBB@BBB@DDHBBBBB@H@D@DBBBB@BBB@B@@BDBB@DFBB@B@B@B@BAB@@BD@BB@BDDD@DBBB@@BBBBBFDBBFBB@BBB@B@DDFB@@BD@BAD@B@B@BABBB@B@B@HBDDFDDDBBBAB@@@B@F@@@BENG@QAMBmBIFWLIBC@A@AA@@CAAC@@AA@A@AAA@A@A@AAAGSGCSCIIE@IJEPA@ABABCBA@ABC@AAA@@AAAAACAA@CCAAAC@@CCAACA@AAA@ACAAAAAA@CCCAEAACA@@@AAA@A@AAEAAAA@AAGCIE@AAAAAAAECCCAAACCC@AAA@AAA@@AAAAAAAACA@AAAAAEE@AAA@@CEAA@AAA@CCICACB@DABABIDABGDELMPK\\ITDHBHCLADADAB@B@@AD@@CD@BABCF@@AB@BMNKHC@C@AAA@C@C@AAG@@AC@GAC@C@G@C@A@@@I@A@CBC@@BA@ABAF@B@B@B@B@BBB@B@B@B@@ABA@@@@B@BB@@BB@@B@B@B@@B@B@B@@@B@@AB@@@@@B@@B@@@B@@@B@@@@@BB@AB@@@B@B@@@B@@@@@BB@@@@BA@@@@B@@@@@B@@@@B@B@@@@@@@@A@A@@B@@@@@@AB@@@@A@@@@B@@BB@@B@@BB@@AB@@@@A@@@@B@@@@@B@@BB@@@@@@@BB@B@@@BB@@B@@BB@@@@@B@@@@@@A@@B@@@B@@@@@@@B@@@BB@@@@@@@BA@@@@@A@@B@@@@BB@@B@@@B@@BB@BB@B@@@B@@@@BB@@B@@@B@@@@@BB@B@@@B@@@@A@@@A@@@A@@@@BB@@@BB@@A@@B@@A@@A@@A@@AAA@A@@@AA@@@@BA@@@AB@@@@AB@BA@@@AB@@@@B@@@B@@@B@@B@@@@@@@BA@@@@@@BB@@@@B@@A@@@@B@@@@@@@@@@@@@B@@ABA@@@@BA@@@A@@@@@A@B@@BB@B@@B@@@@@B@@A@@B@@AB@@BB@@@B@@B@BABAB@@@@A@@@A@@@A@@@@BBB@BBBBBBB@@@B@BAB@BAB@B@@@@@BA@@B@@@@A@@BA@@@@@@@@B@@@@A@@@@BB@@BB@@BB@@@B@@@@@BA@@@@@@@A@@BB@@@BBB@@@@B@@A@@BC@A@@@@@AB@@@@@B@B@@@BBB@@@@@BA@@@@B@@@@@@@@B@@@@@@@@@B@FAB@@@BB@@@@ABCD@D@@DBBHALBJ@DC@ABB@BBR@H@LCHBLDHDPDHAD@DEB@D@B@B@DAFGFC@@BABABAD@JBB@B@BABA@@@C@ABADAB@D@HBJ@B@FAFANELEHAB@BBBB@B@BADCDEFCB@B@JDLHDFH@JFBFGFKF@LD@HCHYJMBO@@DBDXPJDNCJODCH@ZAL@BBB@@BB@@BBBBDB@@B@@BD@@BBB@BB@BB@H@B@BA@@D@B@B@DB@@BBB@@BBB@B@@B@@DB@@@BDB@BBBBBDFF"],"encodeOffsets":[[116105,36347]]}},{"type":"Feature","id":"410822","properties":{"name":"博爱县","cp":[113.069313,35.170351],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@@@A@A@EA@DA@@A@@ABCA@@A@@BCDE@AFC@EA@@@BA@@@@@IECMC@@@EAEKOC@C@G@A@EAIA@@@A@@C@AAAAA@@AI@@G@@EG@C@IG@@AI@I@@@@@C@A@GLADABAD@NBB@P@J@F@NAHGH@@@T@BCD@@EE@BA@KCB@@CA@@@EH@JGJ@D@VBAL@DD@@BB@AJJ@AC@C@C@A@A@A@A@CAEAI@EAEBA@A@@@A@@CGAGCG@A@C@A@C@C@AAAAACA@@GBC@AACAA@AAAA@A@C@C@@@ABEBADC[EMEICC@C@KBaHKBO@C@KAoEIAO@G@KBMFIFYZ]\\QPOHOHABADCJEFCDGDABAB@B@B@B@BDFBFBF@F@DADABA@E@CB@@CB@DAFALABELAF@B@B@BBB@BDBJDFBB@@BB@DLBB@BFDFFRNNL@@@@@@@@DFBFFLDD@@DDFDLHBBBBBB@BBD@DAD@DADADADCD@BA@A@A@@@ACACAA@C@C@@CAAAC@AAACA@AAA@AB@@ABA@@BABB@BJ@DBFAD@B@B@@@BBBDDFFBB@B@BAB@DCDAB@B@B@@@@BB@@@@@B@B@@ADC@A@A@@@E@A@A@A@CF@B@B@@BBBDFFDBFBD@BABAB@B@B@BB@DBB@@@BB@BB@B@BB@AD@B@BBF@BBDFDFFDHBHB@AB@BABA@I@CBA@@B@B@BBBFB@BB@@BA@@DCB@@CBG@GDG@@BAB@B@@A@@AAB@@@@@@A@@@@B@@@@@@BB@B@B@D@B@B@B@B@H@J@J@DADBB@@BBHFFDBB@B@@ADABCJ@B@@BBFBBB@@@B@B@@BB@@@@BBB@BAB@B@B@@AB@BAB@BA@@@@BAB@@@B@@@B@@@@@B@B@HAFAB@B@FBB@DBBB@@B@D@B@BBB@B@DBD@BAJALCHCHABABAB@B@B@BBBBD@@@FEBAB@DADCFEFEFAHAHAD@@@BAB@B@D@BBFDDBFAB@DALEHC@ADA@@D@B@B@FBBG@ABABA@A@@AAA@@@A@A@@@AAAACAA@@AA@A@@AAA@A@@B@@A@@@AAA@@@C@@@AA@A@A@A@@@@AA@@@@AAAACAA@A@@AAAA@@AA@AA@@@@C@@B@@@@@@AA@B@BAB@D@B@@@AA@@CA@@@A@@A@@@A@A@@A@@AB@@AA@@@@@@@@A@@@@ABA@A@ABA@@@@@AB@@@AA@@@@F@@@@@AA@AA@@AB@AA@A@@B@B@@@@A@@@@@@@A@@@@@@@@B@@A@@B@B@@ABABA@A@C@@@@@@@@@@A@@AB@@@C@@@@AAA@@A@@@AA@@A@A@@@@A@@A@@@@@A@@@@@AAB@AACA@@AA@@AA@@@@@@@A@@AAA@@@A@@@@A@A@@@AAA@@@C@AAK@@@@DAF@HADB@@BABABCBC@CBCBE@E@A@A@A@@AC@A@@BA@@@C@AAA@@@A@A@@@A@A@A@A@@BADCBADA@A@ABA@EBCB@@ABABABABA@@DADAB@B@H@@AB@B@B@DA@@FCDABADAB@B@D@@@B@BABAB@FE"],"encodeOffsets":[[115875,36029]]}},{"type":"Feature","id":"410825","properties":{"name":"温县","cp":[113.079118,34.941233],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@H@BADELY@W@E@A@@AC@@@@@GDUAG@@@@@@@A@@CIBMHMJGDA@@@@DC@@@@HCNKFI@@@@BCHUFQD@DADADEDGFKBGBCRaEKAEAAAE@CAEAC@AIIWKIGECQISGQQOIIAE@KP@BSNQHI@MAGMOEcCA@WAKAAAUCWBQHMLONQLWFIBE@GACGCGEEGCKEMGGAUKGCOGI@EDEDEr@@@@@N@L@NANDBB@F@FBABMR@BAJ@NAD@BCFCDCDGDEBEDEDABCDABAD@BAD@F@F@@@@@@BF@FAB@DABA@ABEAE@A@ABOHAB@@@BBF@D@B@@ABM@@@AB@B@LAJ@BABABEBCBCBCDGHJ@DBDBDBDFBFBBB@BB@@@B@@ADAD@B@BBDBBB@B@DADAD@B@B@BB@B@FBDDBFDH@DAF@BABCBA@CBADEBCBCBC@AAG@ABC@ANCF@FAD@BADCDADAD@BBD@DBDHB@@B@@B@FBJFFDFFH\\DDBBD@DBBBB@BA@@B@@@BBBHBF@BBFDDBBB@BBDAB@D@BAB@B@HAHALCNALAH@LCJ@JADAD@HAFAD@BBBBBB@FBHAL@B@@@@AFH@P@JBpFLBD@P@LAbGLAD@D@JDNF\\F"],"encodeOffsets":[[115878,35888]]}},{"type":"Feature","id":"410823","properties":{"name":"武陟县","cp":[113.408334,35.09885],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@RBD@@DB@@J@DDA@@@DB@@BF@@@AL@B@J`DB@@@@CF@BC@CC@@EAAA@@Q@@@A@@DCJBPCD@BBB@D@DFHJFDHBHDD@FAD@DD@BB@@DD@HFDNBBB@DAFG@OFG@CDCD@BB@DAHCFCV@HBBFAPQBID@B@B@B@@@B@BBDBDBBBBBBBB@@@BBB@D@BBD@BBD@BBD@DBF@FBFBDBFBD@D@B@B@F@FBB@@BB@BBBFBBDDDDHHDBFBDDDBDODEDEBE@C@EBGBGDCBA@@@@BAHEHEJAF@LAFABABA@A@AAE@A@CBCB@FAD@HBRHD@JBB@B@DAFIFKHQFYHOFIBCBC@@@@BIHQJMBCBEBABAFABABABCDEJGFE@C@E@I@C@ABA@CBA@CAAACAAG@MAE@AA@A@ABCFEBAJCH@BA@@@ACCACMEA@IAICEAECCAAAACEEEECCCEAEEECGCEAE@CAE@C@G@G@ICOGFIJQRULWRQFW@QAOAgMeCC@SB_DiH@L@NCNOHWDYEKCOEKCGCQOGIMMECKKSKICOAK@IDKDCBYLSBKBO@KAMCSKGKE]@[COCGAAAEQbADAHELCHCFCBCBC@ERGVAD@@@@EJMLGD@@@@CD@@@@CBIHGNANDJ@@@B@@@@@@BHCV@H@@@@BD@@@B@F@XKZCFABG@CDABAF@B@@@D@D@BBBBBB@DBBBD@HA@@DBBBBB@B@D@D@B@D@BDHBHDH@@@B@@@BABBF@FBJBF@D@B@B@B@B@D@DBDLBH@B@AF@BB@B@@BAH@@A@@FfH@DLB^HFBJBFBD@JCJ@DADA@BBABAB@@@LE@EFAxC@NL@@OR@NI@DX@B@BBD@J@@DDA@@@D"],"encodeOffsets":[[116060,35969]]}},{"type":"Feature","id":"410882","properties":{"name":"沁阳市","cp":[112.934538,35.08901],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@H@HCH@DA@@DA@CB@@AA@@AEAAA@A@A@AB@DAJ@B@BA@ABAA@AGCGEEECAC@AAE@A@ABCA@@A@AAAA@@A@@AA@CAAA@A@A@ABABC@EACAEEACAA@@@A@ADEB@B@B@F@@@B@B@D@BC@@@A@A@@@@AA@@@@@A@ABADC@CBA@A@AAAEECCAA@A@@@A@ABCAE@CAIA@BA@AB@BA@@BAB@BBB@BDBBD@BBDB@@@D@DBBBDBD@@B@B@B@@ADCBCBCBC@CBC@CAC@AAAAAAAKGECCC@@CCEKAECE@@@@@@@@MKQMEEEC@AAACKA@@AA@EAICCA@AAA@A@A@ABEFKBABKBE@CDA@@DAF@B@BABC@C@EAEAECE@A@A@A@ABABAHCDCFEDIBCBAPGPGRO^[ZYJENELABE@@@@@ABKAG@EAAAAAAC@EBGBC@CBIBI@KDG@KBMBKDGBGBA@A@ABC@A@CBAAA@AACCAE@AAEAGAA@@A@@@ABA@AACAC@AACCG[EEECIEEAA@@@@AA@CGCAC@AAC@CBCBCDABC@EBE@MD@BAD@BBH@BADADADCFAB@DABADABE@CBG@ECCAAC@E@AAAA@A@C@CBCBA@A@AAAC@A@ABCBC@@@A@@AAA@AAAECECACACAI@GJABABA@A@C@A@CAA@KCC@@@@@A@A@EAAACAG@EBIBC@E@@BC@@@CHGFCBGDKB@BAB@F@B@BABEDCBAB@BA@A@ABCBEJMJIHKFABEBEBABI@E@GBEBGDBV@H@DDBDBHFDFDLBJBDHJ@B@R@FBBLFFDFFBF@FAJAJAJBLBHABABA@@B@JBL@F@DCB@B@HDR@@@@@FDPBDAJADADCDCDCBAB@D@FBDDAF@F@B@DDHDFHFHBHBDFBBBBDBB@D@@ABAD@D@D@@FDDBBBB@D@D@D@B@BB@@BB@@FDDF@@B@DBDB@BB@DD@@@B@BBDBD@@BB@@BBD@B@D@JALADA@@B@D@B@@@B@D@D@DADADAB@B@B@BB@BB@BA@@BC@A@C@AB@DADAD@BAB@D@BAB@J@H@J@D@@BBBBBB@JBDBB@B@B@DAFAD@FAD@FBFBJFFBDBB@@B@BB@BBDDDDDDBDBD@D@B@BB@@DBB@B@BABAB@BAB@@@HBDBBD@D@D@HBD@HDDBDBJDDBDBD@D@DADADCB@B@DAD@B@BAB@@@B@B@@@BB@@D@@BB@BDBDBB@D@B@D@FADADAD"],"encodeOffsets":[[115701,36156]]}},{"type":"Feature","id":"410883","properties":{"name":"孟州市","cp":[112.78708,34.90963],"childNum":1},"geometry":{"type":"Polygon","coordinates":["@@HGDCDADAFABABA@ABI@K@ABA@@N@BA@@@A@CAE@A@@BAPGBAB@F@FBBAB@BA@CBA@EAE@@@@@@@E@EBC@ABCBADCBAFCFCFAHCDCDCDE@ABC@MBI@ANQBAEAE@A@CABM@M@K@M@@@@FqOJSNIDOFcBEACCCKGWMEMUEIEEK@SBUNCFEHGBGBCBE@A@AAEAUCE@A@CDEBCBEAG@EAMIMEWC_HYFcZgFQJeL[HG@ANAHAP@HBH@D@@HFBB@@BD@D@H@D@@ABE@@@@B@R@P@F@D@@@@@BA@Y@@@@@AAIBKBQBWFMBEDCDAFAN@HADA@CBABCB@@@B@H@FAB@BC@LNFJDDD@F@PAH@HBLBDD@@@@FFDDB@D@JAHA\\BH@F@JFDD@FBDDBB@HABA@@@@H@D@HDLHDFFPFLBDDDBDVNNFLFJDLBJFPRHCFAHAF@J@BAFAFABALEJGNIFIDABAB@B@@ABADAFCBA@A@A@EBA@ALAHCDAHEDG@@D@@AF@D@JAFAH@DBBBFBB@B@@@@@D@LDB@DBB@D@B@B@BABAHI"],"encodeOffsets":[[115569,35830]]}}],"UTF8Encoding":true});}));
