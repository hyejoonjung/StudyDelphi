//------------------------
//  2006.07.23
//  시세 Packet
//------------------------

(*
  A0011  // 코스피 종목정보
  A4011  // 코스피 기준가결정
  A3011  // 코스피 체결(시세)
  A6011  // 코스피 종목마감(시세)
  A7011  // 코스피 장운영(시세)
  B6011  // 코스피 호가잔량-ELW, ETF 제외(시세)
  B7011  // ETF 호가잔량
  B8011  // 코스피 장개시전 호가잔량(시세)
  D0011  // 코스피 지수
  D1011  // 코스피 예상지수
  D2011  // 코스피 200지수
  D3011  // 코스피 200예상지수

  A0012  // 코스닥 종목정보
  A4012  // 코스닥 기준가결정
  A3012  // 코스닥 체결(시세)
  A6012  // 코스닥 종목마감(시세)
  A7012  // 코스닥 장운영(시세)
  B6012  // 코스닥 호가잔량(시세)
  B8012  // 코스닥 장개시전 호가잔량(시세)
  D0012  // 코스닥 지수
  D1012  // 코스닥 예상지수

  A1011  // ELW 종목정보
  A4011  // ELW 기준가결정
  A3021  // ELW 체결(시세)          
  A6021  // ELW 종목마감(시세)
  A7021  // ELW 장운영(시세)
  B7021  // ELW / ETF 호가잔량(시세)          
  B8011  // ELW 장개시전 호가잔량(시세)
  C6021  // ELW 투자지표(시세)          
  C7021  // ELW 투자지표 민감도(시세)
  M4011  // 공개장운영(시세)
  M4012  // 공개장운영(시세)
  M5011  // 조기종료ELW 평가기간 중 기초자산고저가
  M6011  // 조기종료ELW_종목배치
  M8011  // ETF운영사정보
  M9011  // 회원사정보

  A0034  // 옵션 종목정보
  B6034  // 옵션 우선호가(시세)
  A3034  // 옵션 체결(시세)
  G7034  // 옵션 체결+우선호가(시세)
  A6034  // 옵션 종목마감(시세)
  A7034  // 옵션 장운용(시세)
  G9034  // 옵션 SPACE(시세)
  H0034  // 옵션 I/F마감(시세)
  H1034  // 옵션 투자자별 매매현황
  H2034  // 옵션 미결제약정
  H3034  // 옵션 매매증거금기준가
  B2034  // 옵션 시세Recovery
  I2034  // 옵션 Polling

  A0014  // 선물 종목정보
  B6014  // 선물 우선호가(시세)
  A3014  // 선물 체결(시세)
  G7014  // 선물 체결+우선호가(시세)
  A6014  // 선물 종목마감(시세)
  A7014  // 선물 장운용(시세)
  G9014  // 선물 SPACE(시세)
  H0014  // 선물 I/F마감(시세)
  H1014  // 선물 투자자별 매매현황
  H2014  // 선물 미결제약정
  H3014  // 선물 매매증거금기준가
  B2014  // 선물 시세Recovery
  I2014  // 선물 Polling

  A0015  // 주식 선물 종목정보
  B6015  // 주식 선물 우선호가(시세)
  A3015  // 주식 선물 체결(시세)
  G7015  // 주식 선물 체결+우선호가(시세)
  A6015  // 주식 선물 종목마감(시세)
  A7015  // 주식 선물 장운용(시세)
  G9015  // 주식 선물 SPACE(시세)
  H0015  // 주식 선물 I/F마감(시세)
  H1015  // 주식 선물 투자자별 매매현황
  H2015  // 주식 선물 미결제약정
  H3015  // 주식 선물 매매증거금기준가
  B2015  // 주식 선물 시세Recovery
  I2015  // 주식 선물 Polling

  D2011  // 업종지수(KOSPI200)

  A0016  // 상품 선물 종목마스터
  A3016  // 상품 선물 체결
  A6016  // 상품 선물 종목마감
  A6017  // 상품 선물 장운영
  B6016  // 상품 선물 호가
  G7016  // 상품 선물 체결+우선호가

  A0026  // 상품 옵션 종목마스터
  A3026  // 상품 옵션 체결
  A6026  // 상품 옵션 종목마감
  A7026  // 상품 옵션 장운영
  B6026  // 상품 옵션 호가
  G7026  // 상품 옵션 체결+우선호가

  F7011  // ETF NAV
  I3011  // ETF 예상 NAV
  M8011  // ETF 운영사정보
*)

unit ELWPacket;

interface

type
  TPushEntry_Packet = record
    iP              : Char;                      // P 고정
    iType           : Char;                      // 1,2:등록,삭제
    iAddPkgb        : Char;                      // 1.All PKGB& 종목코드 없는 PK  2.개별 PKGB
    iPkgb           : Array [1..5] of Char;      // TrCode
    iCode           : Array [1..8] of Char;      // Data(종목코드)
  end;

type
  // A3011  // 코스피 체결(시세)  
  PKOSCOM_K_A3      = ^TKOSCOM_K_A3;
  TKOSCOM_K_A3      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "A3" 체결
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권, 2:코스닥

    expcode         : Array [1..12] of Char;      // 종목코드
    janggb          : Char;                       // 장구분
                                                  // 1:정규장
                                                  // 2:장개시전시간외
                                                  // 3:장종료후시간외종가
                                                  // 4:장종료후시간외단일가
    sign            : Char;                       // 전일대비구분
                                                  // 0:판단불가 1:상한 2:상승
                                                  // 3:보합 4:하한 5:하락
    change          : Array [1.. 9] of Char;      // 전일대비 (단위:원)
                                                  // 신주인수권 증서/증권의 신규 상장 당일 : 0
    cheprice        : Array [1.. 9] of Char;      // 체결가   (단위: 원)
    cheqty          : Array [1..10] of Char;      // 체결수량 (단위: 주)
    chegb           : Array [1.. 2] of Char;      // 체결유형코드
                                                  // 10:시가단일가 11:시가단일가연장
                                                  // 20:장중단일가 21:장중단일가연장
                                                  // 30:종가단일가 40:접속 50:장개시전시간외종가
                                                  // 60:장종료후시간외종가개시 65:장종료후시간외종가
                                                  // 70:시간외단일가 80:단위매매체결
    open            : Array [1.. 9] of Char;      // 시가     (단위: 원) 정규장인 경우에만
    high            : Array [1.. 9] of Char;      // 고가     (단위: 원) 정규장, 시간외단일가인 경우에만(각 장별 값)
    low             : Array [1.. 9] of Char;      // 저가     (단위: 원) 정규장, 시간외단일가인 경우에만(각 장별 값)
    volume          : Array [1..12] of Char;      // 누적거래량(주) ※정규시간외구분코드별로 누적됨
    value           : Array [1..18] of Char;      // 누적거래대금(단위:원) ※정규시간외구분코드별로 누적됨
    lastmmgb        : Char;                       // 최종매도매수구분코드(1:매도,2:매수)
    isprchoga       : Char;                       // 체결가와1호가일치여부(0:판단불가,1:일치,2:불일치)
    chetime         : Array [1.. 6] of Char;      // 체결시각 (HHMMSS)
    lp_volume       : Array [1..15] of Char;      // LP호가 집계후 LP보유수량
    offerho         : Array [1.. 9] of Char;      // 매도1호가
    bidho           : Array [1.. 9] of Char;      // 매수1호가
    filler          : Array [1.. 2] of Char;      // filler
    etx             : Char                        // End of Text
  end;

  // A3012  // 코스닥 체결(시세)
  PKOSCOM_Q_A3      = ^TKOSCOM_Q_A3;
  TKOSCOM_Q_A3      = TKOSCOM_K_A3;
  
  // A3021  // ELW 체결(시세)
  PKOSCOM_E_A3      = ^TKOSCOM_E_A3;
  TKOSCOM_E_A3      = TKOSCOM_K_A3;

  // B6011  // 코스피 호가잔량-ELW제외(시세)
  TB6_Hoga          = record
    offerho         : Array [1.. 9] of Char;      // 매도호가            (원)
    bidho           : Array [1.. 9] of Char;      // 매수호가            (원)
    offerjan        : Array [1..12] of Char;      // 매도호가수량        (주)
    bidjan          : Array [1..12] of Char;      // 매수호가수량        (주)
  end;
  PKOSCOM_K_B6      = ^TKOSCOM_K_B6;
  TKOSCOM_K_B6      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "B6" 호가잔량(ELW 제외)
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권, 2:코스닥

    expcode         : Array [1..12] of Char;      // 종목코드
    volume          : Array [1..12] of Char;      // 체결수량　
    hoga            : Array [1..10] of TB6_Hoga;
    totofferjan     : Array [1..12] of Char;      // 매도호가총수량      (주)
    totbidjan       : Array [1..12] of Char;      // 매수호가총수량      (주)

    filler1         : Array [1..12] of Char;      // Filler 1
    filler2         : Array [1..12] of Char;      // Filler 2

    clo_mkt_totofferjan: Array [1..12] of Char;   // 장종료후시간외 매도총호가잔량
    clo_mkt_totbidjan  : Array [1..12] of Char;   // 장종료후시간외 매수총호가잔량

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // 00:초기(장개시전) 10:시가단일가 11:시가단일가연장
                                                  // 20:장중단일가 21:장중단일가연장 30:종가단일가 40:접속
                                                  // 50:장개시전시간외 60:장종료후시간외접수
                                                  // 65:장종료후시간외 70:시간외단일가 80:단위매매체결
                                                  // 90:거래정지 99:장마감
    out_jang_gb     : Char;                       // 정규시간외구분코드
                                                  // 1:정규장 2:장개시전시간외종가 3:장종료후시간외종가
                                                  // 4:장종료후시간외단일가
    ycga            : Array [1.. 9] of Char;      // 예상체결 가격
    ycvl            : Array [1..12] of Char;      // 예상체결 수량
    filler          : Array [1.. 2] of Char;      // Space
    etx             : Char                        // End of Text
  end;
  
  // B6012  // 코스닥 호가잔량(시세)
  PKOSCOM_Q_B6      = ^TKOSCOM_Q_B6;
  TKOSCOM_Q_B6      = TKOSCOM_K_B6;

  // B7011 / B7021  // ELW / ETF 호가잔량(시세)
  TB7_Hoga          = record
    offerho         : Array [1.. 9] of Char;      // 매도호가            (원)
    bidho           : Array [1.. 9] of Char;      // 매수호가            (원)
    offerjan        : Array [1..12] of Char;      // 매도호가수량        (주)
    bidjan          : Array [1..12] of Char;      // 매수호가수량        (주)
    lpofferjan      : Array [1..12] of Char;      // LP 매도호가수량     (주)
    lpbidjan        : Array [1..12] of Char;      // LP 매수호가수량     (주)
  end;
  PKOSCOM_E_B7      = ^TKOSCOM_E_B7;
  TKOSCOM_E_B7      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "B7" ETF / ELW호가잔량
    pkgb            : Array [1.. 2] of Char;      // 정보구분- 01 : ETF, O2:주식(ELW)
    mkgb            : Char;                       // 시장구분- 1:유가증권

    expcode         : Array [1..12] of Char;      // 종목코드
    volume          : Array [1..12] of Char;      // 체결수량　
    hoga            : Array [1..10] of TB7_Hoga;
    totofferjan     : Array [1..12] of Char;      // 매도호가총수량      (주)
    totbidjan       : Array [1..12] of Char;      // 매수호가총수량      (주)
//* 20100614=== S 멀티캐스트 변경시 추가됨 S ==============  */
    filler1         : Array [1.. 12] of Char;     // Filler 1
    filler2         : Array [1.. 12] of Char;     // Filler 2

    clo_mkt_totofferjan : Array [1..12] of Char;  // 장종료후시간외 매도총호가잔량
    clo_mkt_totbidjan   : Array [1..12] of Char;  // 장종료후시간외 매수총호가잔량 
//* =========== E 멀티캐스트 변경시 추가됨 E ==============  */ 
    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // 00:초기(장개시전) 10:시가단일가 11:시가단일가연장
                                                  // 20:장중단일가 21:장중단일가연장 30:종가단일가 40:접속
                                                  // 50:장개시전시간외 60:장종료후시간외접수
                                                  // 65:장종료후시간외 70:시간외단일가 80:단위매매체결
                                                  // 90:거래정지 99:장마감
    out_jang_gb     : Char;                       // 정규시간외구분코드
                                                  // 1:정규장 2:장개시전시간외종가 3:장종료후시간외종가
                                                  // 4:장종료후시간외단일가
    ycga            : Array [1.. 9] of Char;      // 예상체결 가격
    ycvl            : Array [1..12] of Char;      // 예상체결 수량
    filler          : Array [1.. 4] of Char;      // Space
    etx             : Char                        // End of Text
  end;

  // B8011  // 코스피 장개시전 호가잔량(시세)
  PKOSCOM_K_B8      = ^TKOSCOM_K_B8;
  TKOSCOM_K_B8      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "B8" 장개시전 호가잔량
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권, 2:코스닥

    expcode         : Array [1..12] of Char;      // 종목코드
    volume          : Array [1..12] of Char;      // 체결수량　
    totofferjan     : Array [1..10] of Char;      // 매도호가총수량      (주)
    totbidjan       : Array [1..10] of Char;      // 매수호가총수량      (주)
    filler          : Array [1.. 6] of Char;      // Space
    etx             : Char                        // End of Text
  end;
  
  // B8012  // 코스닥 장개시전 호가잔량(시세)
  PKOSCOM_Q_B8      = ^TKOSCOM_Q_B8;
  TKOSCOM_Q_B8      = TKOSCOM_K_B8;
  
  // B8011  // ELW 장개시전 호가잔량(시세)
  PKOSCOM_E_B8      = ^TKOSCOM_E_B8;
  TKOSCOM_E_B8      = TKOSCOM_K_B8;

  // D0011  // 코스피 지수
  PKOSCOM_K_D0    = ^TKOSCOM_K_D0;
  TKOSCOM_K_D0    = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "D0" 코스피지수
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권, 2:코스닥

    code            : Array [1.. 3] of Char;      // 업종코드
    time            : Array [1.. 6] of Char;      // 처리시각     : (HH:MM:SS)
    jisu            : Array [1.. 8] of Char;      // 지수         : 9(6)V99
    sign            : Char;                       // 전일대비구분
                                                  // '+':상승
                                                  // '-':하락
                                                  // ' ':보합
    diff            : Array [1.. 8] of Char;      // 전일대비     : 9(6)V99
    gvol            : Array [1.. 8] of Char;      // 체결수량 (단위:천주)
    gamt            : Array [1.. 8] of Char;      // 거래대금 (단위:백만원)
    filler          : Array [1.. 2] of Char;      // Space
    etx             : Char;                       // End of Text
  end;
  
  // D1011  // 코스피 예상지수
  PKOSCOM_K_D1    = ^TKOSCOM_K_D1;
  TKOSCOM_K_D1    = TKOSCOM_K_D0;
  
  // D2011  // 코스피 200지수
  PKOSCOM_K_D2    = ^TKOSCOM_K_D2;
  TKOSCOM_K_D2    = TKOSCOM_K_D0;
  
  // D3011  // 코스피 200예상지수
  PKOSCOM_K_D3    = ^TKOSCOM_K_D3;
  TKOSCOM_K_D3    = TKOSCOM_K_D0;
  
  // D0012  // 코스닥 지수
  PKOSCOM_Q_D0    = ^TKOSCOM_Q_D0;
  TKOSCOM_Q_D0    = TKOSCOM_K_D0;
  
  // D1012  // 코스닥 예상지수
  PKOSCOM_Q_D1    = ^TKOSCOM_Q_D1;
  TKOSCOM_Q_D1    = TKOSCOM_K_D0;

  // C6021  // ELW 투자지표(시세)
  PKOSCOM_E_C6      = ^TKOSCOM_E_C6;
  TKOSCOM_E_C6      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "C6" ELW 투자지표
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권

    expcode         : Array [1..12] of Char;      // 표준 종목코드
    time            : Array [1.. 6] of Char;      // 시간(HHMMSS)
                                                  // 장중:HHMMSS(시간:분:초) 090000 ~ 장종료:JUNJJJ
    parity          : Array [1.. 8] of Char;      // 패리티                 9(6)V(2)
    gearing         : Array [1.. 8] of Char;      // 기어링                 9(6)V(2)

    breakep_sign    : Char;                       // 손익분기율 대비 부호
                                                  // "+": 상승,"-":하락," ":보합
    breakep         : Array [1.. 7] of Char;      // 손익분기율             9(5)V(2)

    capitalfp_sign  : Char;                       // 자본지지점 대비 부호
                                                  // "+": 상승,"-":하락," ":보합
    capitalfp       : Array [1.. 7] of Char;      // 자본지지점             9(5)V(2)
                                                  // 정규장 종료시 한번만 산출됨. 그 외는 "0"
                                                  // 산술식에서 값 < 0 이면 "0"으로 SET
    basket          : Array [1..11] of Char;      // 바스켓주가             9(9)V(2)
    filler          : Array [1.. 3] of Char;      // Space
    etx             : Char;                       // End of Text
  end;

  // C7021  // ELW 투자지표 민감도(시세)
  PKOSCOM_E_C7      = ^TKOSCOM_E_C7;
  TKOSCOM_E_C7      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 "C7" ELW 투자지표 민감도
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:주식
    mkgb            : Char;                       // 시장구분- 1:유가증권

    expcode         : Array [1..12] of Char;      // 표준 종목코드
    time            : Array [1.. 6] of Char;      // 시간(HHMMSS)
                                                  // 장중:HHMMSS(시간:분:초) 090000 ~ 장종료:JUNJJJ
    theory          : Array [1..10] of Char;      // 이론가             9(8)V(2)

    delta_sign      : Char;                       // 델타 부호
                                                  // "+":상승,"-":하락," ":보합
    delta           : Array [1.. 7] of Char;      // 델타               9(1)V(6)
    gamma           : Array [1.. 7] of Char;      // 감마               9(1)V(6)


    theta_sign      : Char;                       // 세타 부호
                                                  // "+":상승,"-":하락," ":보합    
    theta           : Array [1..12] of Char;      // 세타               9(6)V(6)

    vega_sign       : Char;                       // 세타 부호
                                                  // "+":상승,"-":하락," ":보합
    vega            : Array [1..12] of Char;      // 베가               9(6)V(6)

    rho_sign        : Char;                       // 로 부호
                                                  // "+":상승,"-":하락," ":보합    
    rho             : Array [1..12] of Char;      // 로                 9(6)V(6)   

    in_vola         : Array [1.. 5] of Char;      // 내재 변동성        9(3)V(2)
                                                  // 조기종료ELW의 경우 0 (2010.08.30)
    expns           : Array [1..10] of Char;      // 제반비용                 9(8)V(2)
                                                  // 표준ELW의 경우 0 (2010.08.30)       
    filler          : Array [1.. 8] of Char;      // Space
    etx             : Char;                       // End of Text
  end;

  // M4011/M4012  // 공개장운영
  PKOSCOM_E_M4      = ^TKOSCOM_E_M4;
  TKOSCOM_E_M4      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분                     'M4'
    pkgb            : Array [1.. 2] of Char;      // 정보구분                       '01'
    mktgb           : Char;                       // 시장구분        1:유가증권 2:코스닥
    expcode         : Array [1..12] of Char;      // 표준 종목코드
                                                  // 개별종목 장운영 조치시, 조기종료(KO)시 등록
    jang_gb         : Array [1.. 3] of Char;      // 장운영 구분코드           X(03)
                                                  //   110 : 시가단일가개시
                                                  //   112 : 시가단일가마감
                                                  //   121 : 종가단일가개시
                                                  //   129 : 종가단일가마감
                                                  //   162 : 전체장중단일가마감
                                                  //   164 : 시장임시정지
                                                  //   165 : 임시정지후재개
                                                  //   172 : 주식가격급변단일가마감
                                                  //   174 : 주식가격급변중단
                                                  //   175 : 주식가격급변재개
                                                  //   182 : 선물가격급변단일가마감
                                                  //   184 : 선물가격급변중단
                                                  //   185 : 선물가격급변재개
                                                  //   192 : 장중단일가마감(특정주식 단일가마감)
                                                  //   194 : 매매거래정지(특정주식 매매중단)
                                                  //   195 : 매매거래재개(특정주식 매매재개)
                                                  //   231 : 최종거래일종가개시
                                                  //   239 : 최종거래일마감
                                                  //   354 : 호가접수정지
                                                  //   355 : 호가접수재개
                                                  //   417 : 주식가격급변예고
                                                  //   419 : 주식가격급변예고해제
                                                  //   427 : 선물가격급변예고
                                                  //   429 : 선물가격급변예고해제
                                                  //   311 : 예상체결가산출개시
                                                  //   226 : 단위매매체결지시(정리매매상품 단일가마감)
                                                  //   221 : 단위매매체결종가개시(정리매매상품 단일가마감 - 마지막 정리매매 단일가마감일 경우)
                                                  //   371 : 대량거래개시
                                                  //   373 : 대량거래종료
                                                  //   911 : 장운영항목고정
                                                  //   912 : 장운영항목고정해제
                                                  //   459 : 매매체결최종마감
                                                  //   473 : 조기종료(KO)(20100830)
    jang_kind       : Char;                       // 장운영종류코드             X(01)
                                                  //   1:전체
                                                  //   2:종목
                                                  //   3:회사
                                                  //   4:파생상품(CLASS)
                                                  //   5:단위매매체결
                                                  //   6:최종거래일종목
                                                  //   *조기종료(KO)는 "2"
    jang_stat       : Array [1.. 2] of Char;      // 장상태구분코드             X(01)
                                                  //   00:초기(장개시전)
                                                  //   10:시가단일가
                                                  //   11:시가단일가연장
                                                  //   20:장중단일가
                                                  //   21:장중단일가연장
                                                  //   30:종가단일가
                                                  //   40:접속
                                                  //   50:장개시전시간외
                                                  //   60:장종료후시간외접수
                                                  //   65:장종료후시간외
                                                  //   70:시간외단일가
                                                  //   80:단위매매체결
                                                  //   90:거래정지
                                                  //   99:장마감
                                                  //   *조기종료(KO) 는 "  "
    cdate           : Array [1.. 8] of Char;      // 장운영조치일자-YYYYMMDD  X(08)
    ctime           : Array [1.. 6] of Char;      // 장운영조치시각           X(09)
                                                  //   HHMMSS(milisecond)
                                                  //   *조기종료(KO)는 조기종료 시각
    janggb          : Char;     // 정규시간외 구분코드
                                                  //   1 : 정규장
                                                  //   2 : 장개시전시간외종가
                                                  //   3 : 정종료후시간외종가
                                                  //   4 : 장종료후시간외단일가
    isin_cd         : Array [1..12] of Char;      // 상장사종목코드           X(12)
                                                  //   상장사의 보통주 ISIN코드
                                                  //   (회사단위 장운영 조치시 등록)
    stop_rsn        : Array [1.. 3] of Char;      // 거래정지사유코드         X(03)
                                                  //   *조기종료(KO) 는 "  "
    stop_res        : Char;                       // 거래정지발생유형코드     X(01)
                                                  //   1:자기종목
                                                  //   2:신주인수권증권
                                                  //   3:신주인수권증서
                                                  //   4:기초자산ELW
                                                  //   5:발행ELW
                                                  //   6:상장사
                                                  //   7:기초자산소속시장
                                                  //   *조기종료(KO)는 "1"
    filler          : Array [1.. 5] of Char;      // filler
    ff              : Char;                       // End Of Text
  end;

  // F7011 ETF NAV
  PKOSCOM_K_F7      = ^TKOSCOM_K_F7;
  TKOSCOM_K_F7      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'F7'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
                                                    // 01: 주식
    mktgb           : Char;                         // 시장구분                        '1'
                                                    // 1: 유가증권
    expcode         : Array [1.. 12] of Char;       // 종목코드
    time            : Array [1..  6] of Char;       // 시간
    pre_nav         : Array [1..  9] of Char;       // 전일 NAV
    prsnt_nav       : Array [1..  9] of Char;       // 장중/최종 NAV
    trc_rt          : Array [1.. 10] of Char;       // 추적오차율(부호포함)
    dsp_rt          : Array [1.. 10] of Char;       // 괴리율(부호포함)
    filler          : Array [1..  8] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // I3011 ETF 예상 NAV
  PKOSCOM_K_I3      = ^TKOSCOM_K_I3;
  TKOSCOM_K_I3      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'I3'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
                                                    // 01: 주식
    mktgb           : Char;                         // 시장구분                        '1'
                                                    // 1: 유가증권
    expcode         : Array [1.. 12] of Char;       // 종목코드
    time            : Array [1..  6] of Char;       // 시간
    pre_nav         : Array [1..  9] of Char;       // 전일 NAV
    prsnt_nav       : Array [1..  9] of Char;       // 장중/최종 NAV
    filler          : Array [1..  8] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // M8011 ETF 운영사정보
  PKOSCOM_K_M8      = ^TKOSCOM_K_M8;
  TKOSCOM_K_M8      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'M8'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
                                                    // 01: 주식
    mktgb           : Char;                         // 시장구분                        '1'
                                                    // 1: 유가증권
    expcode         : Array [1.. 12] of Char;       // 종목코드
    seq             : Array [1..  8] of Char;       // 일련번호
    consign_cd      : Array [1..  3] of Char;       // 사무수탁 회원번호(한국예탁원:908)
    etf_memb_cd     : Array [1..  6] of Char;       // 운영사코드
    etf_memb_nm     : Array [1.. 50] of Char;       // 운영사한글약명
    etf_memb_en     : Array [1.. 40] of Char;       // 운영사영문약명
    filler          : Array [1..  5] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // A3014  // 선물 체결(시세)
  PKOSCOM_F_A3      = ^TKOSCOM_F_A3;
  TKOSCOM_F_A3      = record
    datagb          : Array [1.. 2] of Char;      //  데이터구분 A3
    pkgb            : Array [1.. 2] of Char;      //  정보구분- O1:선물
    mkgb            : Char;                       //  시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 2] of Char;      // 종목 SEQ번호
    curr            : Array [1.. 6] of Char;      // 현재가
    cvol            : Array [1.. 6] of Char;      // 체결수량
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    cyga            : Array [1.. 5] of Char;      // 최근월물 의제약정가격
    oyga            : Array [1.. 5] of Char;      // 원월물 의제약정가격
    open            : Array [1.. 6] of Char;      // 시  가
    high            : Array [1.. 6] of Char;      // 고  가
    low             : Array [1.. 6] of Char;      // 저  가
    preprice        : Array [1.. 6] of Char;      // 직전가격
    volume          : Array [1.. 7] of Char;      // 누적 수량    (단위:계약)
    value           : Array [1..12] of Char;      // 누적 대금    (단위:천원)

    etx             : Char                        // End of Text
  end;

  // B6014  // 선물 우선호가(시세)
  PKOSCOM_F_B6      = ^TKOSCOM_F_B6;
  TKOSCOM_F_B6      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 B6
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 2] of Char;      // 종목 SEQ번호
    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                  
    mshotot         : Array [1.. 6] of Char;      // 매수총호가수량       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)
                  
    mdhotot         : Array [1.. 6] of Char;      // 매도총호가수량       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)
                    
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
                    
    hotime          : Array [1.. 8] of Char;      // 호가 접수시간
                    
    etx             : Char                        // End of Text
  end;

  // G7014  // 선물 체결+우선호가(시세)
  PKOSCOM_F_G7      = ^TKOSCOM_F_G7;
  TKOSCOM_F_G7      = record                      // 체결+호가(선물)
    datagb          : Array [1.. 2] of Char;      //  데이터구분 G7
    pkgb            : Array [1.. 2] of Char;      //  정보구분- O1:선물
    mkgb            : Char;                       //  시장구분- 4
                    
    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 2] of Char;      // 종목 SEQ번호
    curr            : Array [1.. 6] of Char;      // 현재가
    cvol            : Array [1.. 6] of Char;      // 체결수량
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    cyga            : Array [1.. 5] of Char;      // 최근월물 의제약정가격
    oyga            : Array [1.. 5] of Char;      // 원월물 의제약정가격
    open            : Array [1.. 6] of Char;      // 시  가
    high            : Array [1.. 6] of Char;      // 고  가
    low             : Array [1.. 6] of Char;      // 저  가
    preprice        : Array [1.. 6] of Char;      // 직전가격
    volume          : Array [1.. 7] of Char;      // 누적 수량    (단위:계약)
    value           : Array [1..12] of Char;      // 누적 대금    (단위:천원)

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                    
    mshotot         : Array [1.. 6] of Char;      // 매수총호가수량       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)
                    
    mdhotot         : Array [1.. 6] of Char;      // 매도총호가수량       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)
                    
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수

    etx             : Char                        // End of Text
  end;

  // A7014  // 선물 장운용(시세)
  PKOSCOM_F_A7      = ^TKOSCOM_F_A7;
  TKOSCOM_F_A7      = record                      // 장운용(선물)
    datagb          : Array [1.. 2] of Char;      // 데이터구분 A7
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4
                    
    jangtime        : Array [1.. 8] of Char;      // 장운용 조치시각
    jggb            : Array [1.. 2] of Char;      // 장운영구분코드
    underid         : Array [1..10] of Char;      // 상품ID(기초자산ID)
    jgcode          : Array [1..12] of Char;      // 종목 코드
    jgseq           : Array [1.. 2] of Char;      // 종목 SEQ번호

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료

    hogagb          : Char;                       // 호가유무(0:호가없음, 1:호가있음)

    mshotot         : Array [1.. 6] of Char;      // 매수총호가수량       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)

    mdhotot         : Array [1.. 6] of Char;      // 매도총호가수량       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)

    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수

    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수

    etx             : Char                        // End of Text
  end;

  // H2014  // 선물 미결제약정
  PKOSCOM_F_H2      = ^TKOSCOM_F_H2;
  TKOSCOM_F_H2      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 H2
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 2] of Char;      // 종목 SEQ번호

    gb              : Array [1.. 2] of Char;      // 미결제약정구분
                                                  //  전일 확정 : "M0" (07:30분경 제공)
                                                  //  당일 잠정 : "M1" (장중 특정간격으로 변동종목 송신, 10초)
                                                  //  당일 확정 : "M2" (당일 전종목 송신, 장종료 1시간후 제공)

    date            : Array [1.. 8] of Char;      // 거래일자
    mgjv            : Array [1.. 9] of Char;      // 미결제체결수량

    etx             : Char                        // End of Text
  end;

  // A3034  // 옵션 체결(시세)
  PKOSCOM_O_A3      = ^TKOSCOM_O_A3;
  TKOSCOM_O_A3      = record
    datagb          : Array [1.. 2] of Char;      //  데이터구분 A3
    pkgb            : Array [1.. 2] of Char;      //  정보구분- O3:옵션
    mkgb            : Char;                       //  시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목코드
    seq             : Array [1.. 3] of Char;      // 종목seq번호          : 9(4)
    curr            : Array [1.. 5] of Char;      // 현재가               : 9(3)V99
    cvol            : Array [1.. 7] of Char;      // 체결수량             : 9(8)
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    open            : Array [1.. 5] of Char;      // 시  가
    high            : Array [1.. 5] of Char;      // 고  가
    low             : Array [1.. 5] of Char;      // 저  가
    preprice        : Array [1.. 5] of Char;      // 직전가격
    volume          : Array [1.. 8] of Char;      // 누적 수량    (단위:계약)
    value           : Array [1..11] of Char;      // 누적 대금    (단위:천원)

    etx             : Char                        // End of Text
  end;

  // B6034  // 옵션 우선호가(시세)
  PKOSCOM_O_B6      = ^TKOSCOM_O_B6;
  TKOSCOM_O_B6      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 B6
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O3:옵션
    mkgb            : Char;                       // 시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목코드
    seq             : Array [1.. 3] of Char;      // 종목seq번호          : 9(4)

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                    
    mshotot         : Array [1.. 7] of Char;      // 매수총호가수량       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // 매수최우선호가       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // 매수최우선호가수량   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // 매수2차우선호가      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // 매수2차우선호가수량  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // 매수3차우선호가      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // 매수3차우선호가수량  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // 매수4차우선호가      : 9(3)V99
    mshoqty3        : Array [1.. 7] of Char;      // 매수4차우선호가수량  : 9(7)
    mshoga4         : Array [1.. 5] of Char;      // 매수5차우선호가      : 9(3)V99
    mshoqty4        : Array [1.. 7] of Char;      // 매수5차우선호가수량  : 9(7)
                    
    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // 매도최우선호가       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // 매도최우선호가수량   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // 매도2차우선호가      : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // 매도2차우선호가수량  : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // 매도3차우선호가      : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // 매도3차우선호가수량  : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // 매도4차우선호가      : 9(3)V99
    mdhoqty3        : Array [1.. 7] of Char;      // 매도4차우선호가수량  : 9(7)
    mdhoga4         : Array [1.. 5] of Char;      // 매도5차우선호가      : 9(3)V99
    mdhoqty4        : Array [1.. 7] of Char;      // 매도5차우선호가수량  : 9(7)
                    
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
                    
    time            : Array [1.. 8] of Char;      // 호가접수시각
                    
    etx             : Char                        // End of Text
  end;


  // G7034  // 옵션 체결+우선호가(시세)
  PKOSCOM_O_G7      = ^TKOSCOM_O_G7;
  TKOSCOM_O_G7      = record                      // 체결+호가(옵션)
    datagb          : Array [1.. 2] of Char;      // 데이터구분 G7
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O3:옵션
    mkgb            : Char;                       // 시장구분- 4
                    
    isu_cd          : Array [1..12] of Char;      // 종목코드
    seq             : Array [1.. 3] of Char;      // 종목seq번호          : 9(4)
    curr            : Array [1.. 5] of Char;      // 현재가
    cvol            : Array [1.. 7] of Char;      // 체결수량             : 9(8)
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    open            : Array [1.. 5] of Char;      // 시  가
    high            : Array [1.. 5] of Char;      // 고  가
    low             : Array [1.. 5] of Char;      // 저  가
    preprice        : Array [1.. 5] of Char;      // 직전가격
    volume          : Array [1.. 8] of Char;      // 누적 수량    (단위:계약)
    value           : Array [1..11] of Char;      // 누적 대금    (단위:천원)
                    
    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                    
    mshotot         : Array [1.. 7] of Char;      // 매수총호가수량       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // 매수최우선호가       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // 매수최우선호가수량   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // 매수2차우선호가      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // 매수2차우선호가수량  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // 매수3차우선호가      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // 매수3차우선호가수량  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // 매수4차우선호가
    mshoqty3        : Array [1.. 7] of Char;      // 매수4차우선호가수량
    mshoga4         : Array [1.. 5] of Char;      // 매수5차우선호가
    mshoqty4        : Array [1.. 7] of Char;      // 매수5차우선호가수량
                    
    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // 매도최우선호가       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // 매도최우선호가수량   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // 매도차우선호가       : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // 매도차우선호가수량   : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // 매도차차우선호가     : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // 매도차차우선호가수량 : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // 매도4차우선호가
    mdhoqty3        : Array [1.. 7] of Char;      // 매도4차우선호가수량
    mdhoga4         : Array [1.. 5] of Char;      // 매도5차우선호가
    mdhoqty4        : Array [1.. 7] of Char;      // 매도5차우선호가수량
                    
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
                    
    etx             : Char                        // End of Text
  end;

  // 장운영구분코드
  //   110 : 시가단일가개시
  //   112 : 시가단일가마감
  //   121 : 종가단일가개시
  //   129 : 종가단일가마감
  //   162 : 전체장중단일가마감
  //   164 : 시장임시정지(전체매매거래중단)
  //   165 : 임시정지후재개(전체매매거래재개)
  //   172 : 주식가격급변단일가마감
  //   174 : 주식가격급변중단
  //   175 : 주식가격급변재개
  //   182 : 선물가격급변단일가마감
  //   184 : 선물가격급변중단
  //   185 : 선물가격급변재개
  //   192 : 장중단일가마감(특정주식 단일가마감)
  //   194 : 매매거래정지(특정주식 매매중단)
  //   195 : 매매거래재개(특정주식 매매재개)
  //   231 : 최종거래일종가개시
  //   239 : 최종거래일마감
  //   354 : 호가접수정지
  //   355 : 호가접수재개
  //   417 : 주식가격급변예고
  //   419 : 주식가격급변예고해제
  //   427 : 선물가격급변예고
  //   429 : 선물가격급변예고해제
  //   311 : 예상체결가산출개시
  //   226 : 단위매매체결지시(정리매매상품 단일가마감)
  //   221 : 단위매매체결종가개시(정리매매상품 단일가마감 - 마지막 정리매매 단일가마감일 경우)
  //   371 : 대량거래개시
  //   373 : 대량거래종료
  //   911 : 장운영항목고정
  //   912 : 장운영항목고정해제
  //   459 : 매매체결최종마감

  // A7034  // 옵션 장운용(시세)
  PKOSCOM_O_A7      = ^TKOSCOM_O_A7;
  TKOSCOM_O_A7      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 A7
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O3:옵션
    mkgb            : Char;                       // 시장구분- 4

    ctime           : Array [1.. 8] of Char;      // 장운영조치시각
    jggb            : Array [1.. 2] of Char;      // 장운영구분코드
    underid         : Array [1..10] of Char;      // 상품ID(기초자산ID)
    isu_cd          : Array [1..12] of Char;      // 종목코드
    seq             : Array [1.. 3] of Char;      // 종목seq번호          : 9(4)
                    
    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                    
    hogagb          : Char;                       // 호가유무(0:호가없음, 1:호가있음)
                    
    mshotot         : Array [1.. 7] of Char;      // 매수총호가수량       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // 매수최우선호가       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // 매수최우선호가수량   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // 매수2차우선호가      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // 매수2차우선호가수량  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // 매수3차우선호가      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // 매수3차우선호가수량  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // 매수4차우선호가
    mshoqty3        : Array [1.. 7] of Char;      // 매수4차우선호가수량
    mshoga4         : Array [1.. 5] of Char;      // 매수5차우선호가
    mshoqty4        : Array [1.. 7] of Char;      // 매수5차우선호가수량
                    
    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // 매도최우선호가       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // 매도최우선호가수량   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // 매도2차우선호가      : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // 매도2차우선호가수량  : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // 매도3차우선호가      : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // 매도3차우선호가수량  : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // 매도4차우선호가
    mdhoqty3        : Array [1.. 7] of Char;      // 매도4차우선호가수량
    mdhoga4         : Array [1.. 5] of Char;      // 매도5차우선호가
    mdhoqty4        : Array [1.. 7] of Char;      // 매도5차우선호가수량
                    
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
                    
    etx             : Char                        // End of Text
  end;

  // H2034  // 옵션 미결제약정
  PKOSCOM_O_H2      = ^TKOSCOM_O_H2;
  TKOSCOM_O_H2      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 H2
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O3:옵션
    mkgb            : Char;                       // 시장구분- 4
                    
    isu_cd          : Array [1..12] of Char;      // 종목코드
    seq             : Array [1.. 3] of Char;      // 종목seq번호          : 9(4)
    mgjb            : Array [1.. 2] of Char;      // 미결제구분
                                                  //   전일 확정 : "M0" (07:30분경 제공)
                                                  //   당일 잠정 : "M1" (장중 특정간격으로 변동종목 송신, 10초)
                                                  //   당일 확정 : "M2" (당일 전종목 송신, 장종료 1시간후 제공)

    date            : Array [1.. 8] of Char;      // 거래일자
    mgjv            : Array [1.. 9] of Char;      // 미결제약정수량  :9(8)
                    
    etx             : Char                        // End of Text
  end;


  // A3015  // 주식선물 체결(시세)
  PKOSCOM_G_A3      = ^TKOSCOM_G_A3;
  TKOSCOM_G_A3      = record
    datagb          : Array [1.. 2] of Char;      //  데이터구분 A3
    pkgb            : Array [1.. 2] of Char;      //  정보구분- O1:선물
    mkgb            : Char;                       //  시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 4] of Char;      // 종목 SEQ번호
    currsign        : Char;                       // 현재가 부호
    curr            : Array [1.. 7] of Char;      // 현재가
    cvol            : Array [1.. 6] of Char;      // 체결수량
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    cyga            : Array [1.. 7] of Char;      // 최근월물 의제약정가격
    oyga            : Array [1.. 7] of Char;      // 원월물 의제약정가격
    opensign        : Array [1.. 1] of Char;      // 시가부호
    open            : Array [1.. 7] of Char;      // 시  가
    highsign        : Array [1.. 1] of Char;      // 고가부호                  X(01) 
    high            : Array [1.. 7] of Char;      // 고가                      9(07) 
    lowsign         : Array [1.. 1] of Char;      // 저가부호                  X(01) 
    low             : Array [1.. 7] of Char;      // 저가                      9(07) 
    prevsign        : Array [1.. 1] of Char;      // 직전가격부호              X(01) 
    prev            : Array [1.. 7] of Char;      // 직전가격                  9(07)

    volume          : Array [1.. 7] of Char;      // 누적체결수량 (단위:계약)  9(07) 
    value           : Array [1..15] of Char;      // 누적체결대금 (단위:천원)  9(15) 

    etx             : Char                        // End of Text
  end;

  // B6015  // 주식선물 우선호가(시세)
  PKOSCOM_G_B6      = ^TKOSCOM_G_B6;
  TKOSCOM_G_B6      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 B6
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 4] of Char;      // 종목 SEQ번호
    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                  
    mshotot         : Array [1.. 7] of Char;   // 매수총호가잔량       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // 매수우선호가 Sign
    mshoga          : Array [1.. 7] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // 매수2차우선호가 Sign
    mshoga1         : Array [1.. 7] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // 매수3차우선호가 Sign
    mshoga2         : Array [1.. 7] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // 매수4차우선호가 Sign
    mshoga3         : Array [1.. 7] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // 매수5차우선호가 Sign
    mshoga4         : Array [1.. 7] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // 매수6차우선호가 Sign
    mshoga5         : Array [1.. 7] of Char;      // 매수6차우선호가      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // 매수6차우선호가수량  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // 매수7차우선호가 Sign
    mshoga6         : Array [1.. 7] of Char;      // 매수7차우선호가      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // 매수7차우선호가수량  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // 매수8차우선호가 Sign
    mshoga7         : Array [1.. 7] of Char;      // 매수8차우선호가      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // 매수8차우선호가수량  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // 매수9차우선호가 Sign
    mshoga8         : Array [1.. 7] of Char;      // 매수9차우선호가      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // 매수9차우선호가수량  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // 매수10차우선호가 Sign
    mshoga9         : Array [1.. 7] of Char;      // 매수10차우선호가      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // 매수10차우선호가수량  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // 매도우선호가 Sign
    mdhoga          : Array [1.. 7] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // 매도2차우선호가 Sign
    mdhoga1         : Array [1.. 7] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // 매도3차우선호가 Sign
    mdhoga2         : Array [1.. 7] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // 매도4차우선호가 Sign
    mdhoga3         : Array [1.. 7] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // 매도5차우선호가 Sign
    mdhoga4         : Array [1.. 7] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // 매도6차우선호가 Sign
    mdhoga5         : Array [1.. 7] of Char;      // 매도6차우선호가      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // 매도6차우선호가수량  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // 매도7차우선호가 Sign
    mdhoga6         : Array [1.. 7] of Char;      // 매도7차우선호가      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // 매도7차우선호가수량  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // 매도8차우선호가 Sign
    mdhoga7         : Array [1.. 7] of Char;      // 매도8차우선호가      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // 매도8차우선호가수량  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // 매도9차우선호가 Sign
    mdhoga8         : Array [1.. 7] of Char;      // 매도9차우선호가      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // 매도9차우선호가수량  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // 매도10차우선호가 Sign
    mdhoga9         : Array [1.. 7] of Char;      // 매도10차우선호가      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // 매도10차우선호가수량  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
    ms6wunum        : Array [1.. 4] of Char;      // 매수 6우선 호가건수
    ms7wunum        : Array [1.. 4] of Char;      // 매수 7우선 호가건수
    ms8wunum        : Array [1.. 4] of Char;      // 매수 8우선 호가건수
    ms9wunum        : Array [1.. 4] of Char;      // 매수 9우선 호가건수
    ms10wunum       : Array [1.. 4] of Char;      // 매수 10우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
    md6wunum        : Array [1.. 4] of Char;      // 매도 6우선 호가건수
    md7wunum        : Array [1.. 4] of Char;      // 매도 7우선 호가건수
    md8wunum        : Array [1.. 4] of Char;      // 매도 8우선 호가건수
    md9wunum        : Array [1.. 4] of Char;      // 매도 9우선 호가건수
    md10wunum       : Array [1.. 4] of Char;      // 매도 10우선 호가건수
                                       
    hotime          : Array [1.. 8] of Char;      // 호가 접수시간
                    
    etx             : Char                        // End of Text
  end;

  // G7015  // 주식선물 체결+우선호가(시세)
  PKOSCOM_G_G7      = ^TKOSCOM_G_G7;
  TKOSCOM_G_G7      = record                      // 체결+호가(선물)
    datagb          : Array [1.. 2] of Char;      //  데이터구분 G7
    pkgb            : Array [1.. 2] of Char;      //  정보구분- O1:선물
    mkgb            : Char;                       //  시장구분- 4
                    
    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 4] of Char;      // 종목 SEQ번호
    currsign        : Char;                       // 현재가 부호    
    curr            : Array [1.. 7] of Char;      // 현재가
    cvol            : Array [1.. 6] of Char;      // 체결수량
    chegb           : Array [1.. 2] of Char;      // 1)일반매매
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
    ctime           : Array [1.. 8] of Char;      // 체결시각
    cyga            : Array [1.. 7] of Char;      // 최근월물 의제약정가격
    oyga            : Array [1.. 7] of Char;      // 원월물 의제약정가격
    opensign        : Array [1.. 1] of Char;      // 시가부호
    open            : Array [1.. 7] of Char;      // 시  가
    highsign        : Array [1.. 1] of Char;      // 고가부호                  X(01) 
    high            : Array [1.. 7] of Char;      // 고가                      9(07) 
    lowsign         : Array [1.. 1] of Char;      // 저가부호                  X(01) 
    low             : Array [1.. 7] of Char;      // 저가                      9(07) 
    prevsign        : Array [1.. 1] of char;      // 직전가격부호              X(01)
    preprice        : Array [1.. 7] of Char;      // 직전가격
    volume          : Array [1.. 7] of Char;      // 누적 수량    (단위:계약)
    value           : Array [1..15] of Char;      // 누적 대금    (단위:천원)

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료
                    
    mshotot         : Array [1.. 7] of Char;   // 매수총호가잔량       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // 매수우선호가 Sign
    mshoga          : Array [1.. 7] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // 매수2차우선호가 Sign
    mshoga1         : Array [1.. 7] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // 매수3차우선호가 Sign
    mshoga2         : Array [1.. 7] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // 매수4차우선호가 Sign
    mshoga3         : Array [1.. 7] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // 매수5차우선호가 Sign
    mshoga4         : Array [1.. 7] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // 매수6차우선호가 Sign
    mshoga5         : Array [1.. 7] of Char;      // 매수6차우선호가      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // 매수6차우선호가수량  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // 매수7차우선호가 Sign
    mshoga6         : Array [1.. 7] of Char;      // 매수7차우선호가      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // 매수7차우선호가수량  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // 매수8차우선호가 Sign
    mshoga7         : Array [1.. 7] of Char;      // 매수8차우선호가      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // 매수8차우선호가수량  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // 매수9차우선호가 Sign
    mshoga8         : Array [1.. 7] of Char;      // 매수9차우선호가      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // 매수9차우선호가수량  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // 매수10차우선호가 Sign
    mshoga9         : Array [1.. 7] of Char;      // 매수10차우선호가      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // 매수10차우선호가수량  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // 매도우선호가 Sign
    mdhoga          : Array [1.. 7] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // 매도2차우선호가 Sign
    mdhoga1         : Array [1.. 7] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // 매도3차우선호가 Sign
    mdhoga2         : Array [1.. 7] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // 매도4차우선호가 Sign
    mdhoga3         : Array [1.. 7] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // 매도5차우선호가 Sign
    mdhoga4         : Array [1.. 7] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // 매도6차우선호가 Sign
    mdhoga5         : Array [1.. 7] of Char;      // 매도6차우선호가      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // 매도6차우선호가수량  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // 매도7차우선호가 Sign
    mdhoga6         : Array [1.. 7] of Char;      // 매도7차우선호가      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // 매도7차우선호가수량  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // 매도8차우선호가 Sign
    mdhoga7         : Array [1.. 7] of Char;      // 매도8차우선호가      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // 매도8차우선호가수량  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // 매도9차우선호가 Sign
    mdhoga8         : Array [1.. 7] of Char;      // 매도9차우선호가      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // 매도9차우선호가수량  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // 매도10차우선호가 Sign
    mdhoga9         : Array [1.. 7] of Char;      // 매도10차우선호가      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // 매도10차우선호가수량  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
    ms6wunum        : Array [1.. 4] of Char;      // 매수 6우선 호가건수
    ms7wunum        : Array [1.. 4] of Char;      // 매수 7우선 호가건수
    ms8wunum        : Array [1.. 4] of Char;      // 매수 8우선 호가건수
    ms9wunum        : Array [1.. 4] of Char;      // 매수 9우선 호가건수
    ms10wunum       : Array [1.. 4] of Char;      // 매수 10우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
    md6wunum        : Array [1.. 4] of Char;      // 매도 6우선 호가건수
    md7wunum        : Array [1.. 4] of Char;      // 매도 7우선 호가건수
    md8wunum        : Array [1.. 4] of Char;      // 매도 8우선 호가건수
    md9wunum        : Array [1.. 4] of Char;      // 매도 9우선 호가건수
    md10wunum       : Array [1.. 4] of Char;      // 매도 10우선 호가건수

    etx             : Char                        // End of Text
  end;

  // A7015  // 주식선물 장운용(시세)
  PKOSCOM_G_A7      = ^TKOSCOM_G_A7;
  TKOSCOM_G_A7      = record                      // 장운용(선물)
    datagb          : Array [1.. 2] of Char;      // 데이터구분 A7
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4
                    
    jangtime        : Array [1.. 8] of Char;      // 장운용 조치시각
    jggb            : Array [1.. 3] of Char;      // 장운영구분코드
    underid         : Array [1..10] of Char;      // 상품ID(기초자산ID)
    jgcode          : Array [1..12] of Char;      // 종목 코드
    jgseq           : Array [1.. 4] of Char;      // 종목 SEQ번호

    janggb          : Array [1.. 2] of Char;      // 장상태구분코드
                                                  // *호가가 처리된 장상태
                                                  //   00 : 초기(장개시전)
                                                  //   10 : 시가단일가
                                                  //   11 : 시가단일가연장
                                                  //   20 : 장중단일가
                                                  //   21 : 장중단일가연장
                                                  //   30 : 종가단일가
                                                  //   40 : 접속
                                                  //   80 : 단위매매체결
                                                  //   90 : 거래정지
                                                  //   99 : 장종료

    hogagb          : Char;                       // 호가유무(0:호가없음, 1:호가있음)

    mshotot         : Array [1.. 7] of Char;   // 매수총호가잔량       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // 매수우선호가 Sign
    mshoga          : Array [1.. 7] of Char;      // 매수우선호가         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // 매수우선호가수량     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // 매수2차우선호가 Sign
    mshoga1         : Array [1.. 7] of Char;      // 매수2차우선호가      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // 매수2차우선호가수량  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // 매수3차우선호가 Sign
    mshoga2         : Array [1.. 7] of Char;      // 매수3차우선호가      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // 매수3차우선호가수량  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // 매수4차우선호가 Sign
    mshoga3         : Array [1.. 7] of Char;      // 매수4차우선호가      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // 매수4차우선호가수량  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // 매수5차우선호가 Sign
    mshoga4         : Array [1.. 7] of Char;      // 매수5차우선호가      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // 매수5차우선호가수량  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // 매수6차우선호가 Sign
    mshoga5         : Array [1.. 7] of Char;      // 매수6차우선호가      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // 매수6차우선호가수량  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // 매수7차우선호가 Sign
    mshoga6         : Array [1.. 7] of Char;      // 매수7차우선호가      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // 매수7차우선호가수량  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // 매수8차우선호가 Sign
    mshoga7         : Array [1.. 7] of Char;      // 매수8차우선호가      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // 매수8차우선호가수량  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // 매수9차우선호가 Sign
    mshoga8         : Array [1.. 7] of Char;      // 매수9차우선호가      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // 매수9차우선호가수량  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // 매수10차우선호가 Sign
    mshoga9         : Array [1.. 7] of Char;      // 매수10차우선호가      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // 매수10차우선호가수량  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // 매도총호가수량       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // 매도우선호가 Sign
    mdhoga          : Array [1.. 7] of Char;      // 매도우선호가         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // 매도우선호가수량     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // 매도2차우선호가 Sign
    mdhoga1         : Array [1.. 7] of Char;      // 매도2차우선호가      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // 매도2차우선호가수량  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // 매도3차우선호가 Sign
    mdhoga2         : Array [1.. 7] of Char;      // 매도3차우선호가      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // 매도3차우선호가수량  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // 매도4차우선호가 Sign
    mdhoga3         : Array [1.. 7] of Char;      // 매도4차우선호가      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // 매도4차우선호가수량  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // 매도5차우선호가 Sign
    mdhoga4         : Array [1.. 7] of Char;      // 매도5차우선호가      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // 매도5차우선호가수량  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // 매도6차우선호가 Sign
    mdhoga5         : Array [1.. 7] of Char;      // 매도6차우선호가      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // 매도6차우선호가수량  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // 매도7차우선호가 Sign
    mdhoga6         : Array [1.. 7] of Char;      // 매도7차우선호가      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // 매도7차우선호가수량  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // 매도8차우선호가 Sign
    mdhoga7         : Array [1.. 7] of Char;      // 매도8차우선호가      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // 매도8차우선호가수량  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // 매도9차우선호가 Sign
    mdhoga8         : Array [1.. 7] of Char;      // 매도9차우선호가      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // 매도9차우선호가수량  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // 매도10차우선호가 Sign
    mdhoga9         : Array [1.. 7] of Char;      // 매도10차우선호가      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // 매도10차우선호가수량  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // 매수 유효 호가건수
    ms1wunum        : Array [1.. 4] of Char;      // 매수 1우선 호가건수
    ms2wunum        : Array [1.. 4] of Char;      // 매수 2우선 호가건수
    ms3wunum        : Array [1.. 4] of Char;      // 매수 3우선 호가건수
    ms4wunum        : Array [1.. 4] of Char;      // 매수 4우선 호가건수
    ms5wunum        : Array [1.. 4] of Char;      // 매수 5우선 호가건수
    ms6wunum        : Array [1.. 4] of Char;      // 매수 6우선 호가건수
    ms7wunum        : Array [1.. 4] of Char;      // 매수 7우선 호가건수
    ms8wunum        : Array [1.. 4] of Char;      // 매수 8우선 호가건수
    ms9wunum        : Array [1.. 4] of Char;      // 매수 9우선 호가건수
    ms10wunum       : Array [1.. 4] of Char;      // 매수 10우선 호가건수
                    
    mdtothonum      : Array [1.. 5] of Char;      // 매도 유효 호가건수
    md1wunum        : Array [1.. 4] of Char;      // 매도 1우선 호가건수
    md2wunum        : Array [1.. 4] of Char;      // 매도 2우선 호가건수
    md3wunum        : Array [1.. 4] of Char;      // 매도 3우선 호가건수
    md4wunum        : Array [1.. 4] of Char;      // 매도 4우선 호가건수
    md5wunum        : Array [1.. 4] of Char;      // 매도 5우선 호가건수
    md6wunum        : Array [1.. 4] of Char;      // 매도 6우선 호가건수
    md7wunum        : Array [1.. 4] of Char;      // 매도 7우선 호가건수
    md8wunum        : Array [1.. 4] of Char;      // 매도 8우선 호가건수
    md9wunum        : Array [1.. 4] of Char;      // 매도 9우선 호가건수
    md10wunum       : Array [1.. 4] of Char;      // 매도 10우선 호가건수

    etx             : Char                        // End of Text
  end;

  // H2014  // 주식선물 미결제약정
  PKOSCOM_G_H2      = ^TKOSCOM_G_H2;
  TKOSCOM_G_H2      = record
    datagb          : Array [1.. 2] of Char;      // 데이터구분 H2
    pkgb            : Array [1.. 2] of Char;      // 정보구분- O1:선물
    mkgb            : Char;                       // 시장구분- 4

    isu_cd          : Array [1..12] of Char;      // 종목 코드
    seq             : Array [1.. 4] of Char;      // 종목 SEQ번호

    gb              : Array [1.. 2] of Char;      // 미결제약정구분
                                                  //  전일 확정 : "M0" (07:30분경 제공)
                                                  //  당일 잠정 : "M1" (장중 특정간격으로 변동종목 송신, 10초)
                                                  //  당일 확정 : "M2" (당일 전종목 송신, 장종료 1시간후 제공)

    date            : Array [1.. 8] of Char;      // 거래일자
    mgjv            : Array [1.. 9] of Char;      // 미결제체결수량

    etx             : Char                        // End of Text
  end;

  // A3016 상품 선물 체결
  PKOSCOM_M_A3      = ^TKOSCOM_M_A3;
  TKOSCOM_M_A3      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A3'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  9] of Char;       // 현재가                    -9(06)V99
    cvol            : Array [1..  6] of Char;       // 체결수량                      9(06)
    ctype           : Array [1..  2] of Char;       // 체결유형코드                  X(02)
                                                    // 10 : 시가단일가            
                                                    // 20 : 장중단일가            
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    ctime           : Array [1..  8] of Char;       // 체결시각                      X(08)
    cyga            : Array [1..  8] of Char;       // 최근월물의제약정가격       9(06)V99
    oyga            : Array [1..  8] of Char;       // 원월물의제약정가격         9(06)V99
    open            : Array [1..  9] of Char;       // 시가                      -9(06)V99
    high            : Array [1..  9] of Char;       // 고가                      -9(06)V99
    low             : Array [1..  9] of Char;       // 저가                      -9(06)V99
    prev            : Array [1..  9] of Char;       // 직전가격                  -9(06)V99
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP 누적체결수량              X(07)
    filler          : Char;                         //                            
  end;

  // A6016 상품 선물 종목마감
  PKOSCOM_M_A6      = ^TKOSCOM_M_A6;
  TKOSCOM_M_A6      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A6'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  9] of Char;       // 종가                      -9(06)V99
    curr_gb         : Char;                         // 종가구분코드                  X(01)
                                                    // 1 : 체결가격               
                                                    // 2 : 기세                   
                                                    // 3 : 거래무                 
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP 누적체결수량              X(07)
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

  // A6017 상품 선물 장운영
  PKOSCOM_M_A7      = ^TKOSCOM_M_A7;
  TKOSCOM_M_A7      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A7'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
    mktgb           : Char;                         // 시장구분                        '6'
    ctime           : Array [1..  8] of Char;       // 장운영조치시각('0' set)       X(08)
    jang_gb         : Array [1..  3] of Char;       // 장운영 구분코드               X(03)
    drvtv_class     : Array [1.. 10] of Char;       // 상품ID                        X(10)
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
                                                    // 90 : 거래정지              
                                                    // 99 : 장종료                
    hoga_exist      : Char;                         // 호가유무                      X(01)
                                                    // 0 : 호가없음               
                                                    // 1 : 호가있음               
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

  // B6016 상품 선물 호가
  PKOSCOM_M_B6      = ^TKOSCOM_M_B6;
  TKOSCOM_M_B6      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'B6'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    time            : Array [1..  8] of Char;       // 호가접수시각                  X(08)
    filler          : Char;                         //                            
  end;

  // G7016 상품 선물 체결+우선호가
  PKOSCOM_M_G7      = ^TKOSCOM_M_G7;
  TKOSCOM_M_G7      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'G7'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '01'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  9] of Char;       // 현재가                    -9(06)V99
    cvol            : Array [1..  6] of Char;       // 체결수량 (건별)               9(06)
    ctype           : Array [1..  2] of Char;       // 체결유형코드                  X(02)
                                                    // 10: 시가 단일가            
                                                    // 11: 시가 단일가 연장       
                                                    // 20: 장중 단일가            
                                                    // 21: 장중 단일가 연장       
                                                    // 30: 종가 단일가            
                                                    // 40: 접속                   
                                                    // 80: 단위매매체결           
    ctime           : Array [1..  8] of Char;       // 체결시각                      X(08)
    cyga            : Array [1..  8] of Char;       // 최근월물의제약정가격       9(06)V99
    oyga            : Array [1..  8] of Char;       // 원월물의제약정가격         9(06)V99
    open            : Array [1..  9] of Char;       // 시가                      -9(06)V99
    high            : Array [1..  9] of Char;       // 고가                      -9(06)V99
    low             : Array [1..  9] of Char;       // 저가                      -9(06)V99
    prev            : Array [1..  9] of Char;       // 직전가격                  -9(06)V99
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP 누적체결수량              X(07)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    svol            : Array [1..  6] of Char;       // 매수 총호가잔량               X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계 호가         
    dvol            : Array [1..  6] of Char;       // 매도 총호가잔량               X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // 호가       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계 호가         
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

  // A3026 상품 옵션 체결
  PKOSCOM_N_A3      = ^TKOSCOM_N_A3;
  TKOSCOM_N_A3      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A3'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '02'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  8] of Char;       // 현재가                     9(06)V99
    cvol            : Array [1..  6] of Char;       // 체결수량                      9(06)
    ctype           : Array [1..  2] of Char;       // 체결유형코드                  X(02)
                                                    // 10 : 시가단일가            
                                                    // 20 : 장중단일가            
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    ctime           : Array [1..  8] of Char;       // 체결시각                      X(08)
    open            : Array [1..  8] of Char;       // 시가                       9(06)V99
    high            : Array [1..  8] of Char;       // 고가                       9(06)V99
    low             : Array [1..  8] of Char;       // 저가                       9(06)V99
    prev            : Array [1..  8] of Char;       // 직전가격                   9(06)V99
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    filler          : Char;                         //                            
  end;

  // A6026 상품 옵션 종목마감
  PKOSCOM_N_A6      = ^TKOSCOM_N_A6;
  TKOSCOM_N_A6      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A6'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '02'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  8] of Char;       // 종가                       9(06)V99
    curr_gb         : Char;                         // 종가구분코드                  X(01)
                                                    // 1 : 체결가격               
                                                    // 2 : 기세                   
                                                    // 3 : 거래무                 
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

  // A7026 상품 옵션 장운영
  PKOSCOM_N_A7      = ^TKOSCOM_N_A7;
  TKOSCOM_N_A7      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'A7'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '02'
    mktgb           : Char;                         // 시장구분                        '6'
    ctime           : Array [1..  8] of Char;       // 장운영조치시각('0' set)       X(08)
    jang_gb         : Array [1..  3] of Char;       // 장운영 구분코드               X(03)
    drvtv_class     : Array [1.. 10] of Char;       // 상품ID                        X(10)
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
                                                    // 90 : 거래정지              
                                                    // 99 : 장종료                
    hoga_exist      : Char;                         // 호가유무                      X(01)
                                                    // 0 : 호가없음               
                                                    // 1 : 호가있음               
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

  // B6026 상품 옵션 호가
  PKOSCOM_N_B6      = ^TKOSCOM_N_B6;
  TKOSCOM_N_B6      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'B6'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '02'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    svol            : Array [1..  6] of Char;       // 매수총호가잔량                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계호가          
    dvol            : Array [1..  6] of Char;       // 매도총호가잔량                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계호가          
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    time            : Array [1..  8] of Char;       // 호가접수시각                  X(08)
    filler          : Char;                         //                            
  end;

  // G7026 상품 옵션 체결+우선호가
  PKOSCOM_N_G7      = ^TKOSCOM_N_G7;    
  TKOSCOM_N_G7      = record
    datagb          : Array [1..  2] of Char;       // 데이터구분                     'G7'
    pkgb            : Array [1..  2] of Char;       // 정보구분                       '02'
    mktgb           : Char;                         // 시장구분                        '6'
    isu_cd          : Array [1.. 12] of Char;       // 종목 코드                     X(12)
    seqn            : Array [1..  3] of Char;       // 종목 SEQ번호                  9(03)
    curr            : Array [1..  8] of Char;       // 현재가                     9(06)V99
    cvol            : Array [1..  6] of Char;       // 체결수량 (건별)               9(06)
    ctype           : Array [1..  2] of Char;       // 체결유형코드                  X(02)
                                                    // 10: 시가 단일가            
                                                    // 11: 시가 단일가 연장       
                                                    // 20: 장중 단일가            
                                                    // 21: 장중 단일가 연장       
                                                    // 30: 종가 단일가            
                                                    // 40: 접속                   
                                                    // 80: 단위매매체결           
    ctime           : Array [1..  8] of Char;       // 체결시각                      X(08)
    open            : Array [1..  8] of Char;       // 시가                       9(06)V99
    high            : Array [1..  8] of Char;       // 고가                       9(06)V99
    low             : Array [1..  8] of Char;       // 저가                       9(06)V99
    prev            : Array [1..  8] of Char;       // 직전가격                   9(06)V99
    volume          : Array [1..  7] of Char;       // 누적체결수량 (단위:계약)      9(07)
    value           : Array [1.. 15] of Char;       // 누적체결대금 (단위:천원)      9(15)
    concheqty       : Array [1..  7] of Char;       // 협의대량누적체결수량          X(07)
    mkt_stat        : Array [1..  2] of Char;       // 장상태구분코드                X(02)
                                                    // 00 : 초기(장개시전)        
                                                    // 01 : 시가단일가            
                                                    // 11 : 시가단일가연장        
                                                    // 20 : 장중단일가            
                                                    // 21 : 장중단일가연장        
                                                    // 30 : 종가단일가            
                                                    // 40 : 접속                  
    svol            : Array [1..  6] of Char;       // 매수 총호가잔량               X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매수 1~5 단계 호가         
    dvol            : Array [1..  6] of Char;       // 매도 총호가잔량               X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // 호가        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // 호가수량       9(06)       
                                                    // 매도 1~5 단계 호가         
    scnt            : Array [1..  5] of Char;       // 매수유효호가건수              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // 매수 1 단계 호가건수
    shoga1_cnt      : Array [1..  4] of Char;       // 매수 2 단계 호가건수
    shoga2_cnt      : Array [1..  4] of Char;       // 매수 3 단계 호가건수
    shoga3_cnt      : Array [1..  4] of Char;       // 매수 4 단계 호가건수
    shoga4_cnt      : Array [1..  4] of Char;       // 매수 5 단계 호가건수
    dcnt            : Array [1..  5] of Char;       // 매도유효호가건수              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // 매도 1 단계 호가건수
    dhoga1_cnt      : Array [1..  4] of Char;       // 매도 2 단계 호가건수
    dhoga2_cnt      : Array [1..  4] of Char;       // 매도 3 단계 호가건수
    dhoga3_cnt      : Array [1..  4] of Char;       // 매도 4 단계 호가건수
    dhoga4_cnt      : Array [1..  4] of Char;       // 매도 5 단계 호가건수
    filler          : Char;                         //
  end;

implementation

end.
