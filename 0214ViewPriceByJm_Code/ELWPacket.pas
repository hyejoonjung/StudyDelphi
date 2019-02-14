//------------------------
//  2006.07.23
//  �ü� Packet
//------------------------

(*
  A0011  // �ڽ��� ��������
  A4011  // �ڽ��� ���ذ�����
  A3011  // �ڽ��� ü��(�ü�)
  A6011  // �ڽ��� ���񸶰�(�ü�)
  A7011  // �ڽ��� ��(�ü�)
  B6011  // �ڽ��� ȣ���ܷ�-ELW, ETF ����(�ü�)
  B7011  // ETF ȣ���ܷ�
  B8011  // �ڽ��� �尳���� ȣ���ܷ�(�ü�)
  D0011  // �ڽ��� ����
  D1011  // �ڽ��� ��������
  D2011  // �ڽ��� 200����
  D3011  // �ڽ��� 200��������

  A0012  // �ڽ��� ��������
  A4012  // �ڽ��� ���ذ�����
  A3012  // �ڽ��� ü��(�ü�)
  A6012  // �ڽ��� ���񸶰�(�ü�)
  A7012  // �ڽ��� ��(�ü�)
  B6012  // �ڽ��� ȣ���ܷ�(�ü�)
  B8012  // �ڽ��� �尳���� ȣ���ܷ�(�ü�)
  D0012  // �ڽ��� ����
  D1012  // �ڽ��� ��������

  A1011  // ELW ��������
  A4011  // ELW ���ذ�����
  A3021  // ELW ü��(�ü�)          
  A6021  // ELW ���񸶰�(�ü�)
  A7021  // ELW ��(�ü�)
  B7021  // ELW / ETF ȣ���ܷ�(�ü�)          
  B8011  // ELW �尳���� ȣ���ܷ�(�ü�)
  C6021  // ELW ������ǥ(�ü�)          
  C7021  // ELW ������ǥ �ΰ���(�ü�)
  M4011  // ������(�ü�)
  M4012  // ������(�ü�)
  M5011  // ��������ELW �򰡱Ⱓ �� �����ڻ������
  M6011  // ��������ELW_�����ġ
  M8011  // ETF�������
  M9011  // ȸ��������

  A0034  // �ɼ� ��������
  B6034  // �ɼ� �켱ȣ��(�ü�)
  A3034  // �ɼ� ü��(�ü�)
  G7034  // �ɼ� ü��+�켱ȣ��(�ü�)
  A6034  // �ɼ� ���񸶰�(�ü�)
  A7034  // �ɼ� ����(�ü�)
  G9034  // �ɼ� SPACE(�ü�)
  H0034  // �ɼ� I/F����(�ü�)
  H1034  // �ɼ� �����ں� �Ÿ���Ȳ
  H2034  // �ɼ� �̰�������
  H3034  // �ɼ� �Ÿ����űݱ��ذ�
  B2034  // �ɼ� �ü�Recovery
  I2034  // �ɼ� Polling

  A0014  // ���� ��������
  B6014  // ���� �켱ȣ��(�ü�)
  A3014  // ���� ü��(�ü�)
  G7014  // ���� ü��+�켱ȣ��(�ü�)
  A6014  // ���� ���񸶰�(�ü�)
  A7014  // ���� ����(�ü�)
  G9014  // ���� SPACE(�ü�)
  H0014  // ���� I/F����(�ü�)
  H1014  // ���� �����ں� �Ÿ���Ȳ
  H2014  // ���� �̰�������
  H3014  // ���� �Ÿ����űݱ��ذ�
  B2014  // ���� �ü�Recovery
  I2014  // ���� Polling

  A0015  // �ֽ� ���� ��������
  B6015  // �ֽ� ���� �켱ȣ��(�ü�)
  A3015  // �ֽ� ���� ü��(�ü�)
  G7015  // �ֽ� ���� ü��+�켱ȣ��(�ü�)
  A6015  // �ֽ� ���� ���񸶰�(�ü�)
  A7015  // �ֽ� ���� ����(�ü�)
  G9015  // �ֽ� ���� SPACE(�ü�)
  H0015  // �ֽ� ���� I/F����(�ü�)
  H1015  // �ֽ� ���� �����ں� �Ÿ���Ȳ
  H2015  // �ֽ� ���� �̰�������
  H3015  // �ֽ� ���� �Ÿ����űݱ��ذ�
  B2015  // �ֽ� ���� �ü�Recovery
  I2015  // �ֽ� ���� Polling

  D2011  // ��������(KOSPI200)

  A0016  // ��ǰ ���� ���񸶽���
  A3016  // ��ǰ ���� ü��
  A6016  // ��ǰ ���� ���񸶰�
  A6017  // ��ǰ ���� ��
  B6016  // ��ǰ ���� ȣ��
  G7016  // ��ǰ ���� ü��+�켱ȣ��

  A0026  // ��ǰ �ɼ� ���񸶽���
  A3026  // ��ǰ �ɼ� ü��
  A6026  // ��ǰ �ɼ� ���񸶰�
  A7026  // ��ǰ �ɼ� ��
  B6026  // ��ǰ �ɼ� ȣ��
  G7026  // ��ǰ �ɼ� ü��+�켱ȣ��

  F7011  // ETF NAV
  I3011  // ETF ���� NAV
  M8011  // ETF �������
*)

unit ELWPacket;

interface

type
  TPushEntry_Packet = record
    iP              : Char;                      // P ����
    iType           : Char;                      // 1,2:���,����
    iAddPkgb        : Char;                      // 1.All PKGB& �����ڵ� ���� PK  2.���� PKGB
    iPkgb           : Array [1..5] of Char;      // TrCode
    iCode           : Array [1..8] of Char;      // Data(�����ڵ�)
  end;

type
  // A3011  // �ڽ��� ü��(�ü�)  
  PKOSCOM_K_A3      = ^TKOSCOM_K_A3;
  TKOSCOM_K_A3      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "A3" ü��
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������, 2:�ڽ���

    expcode         : Array [1..12] of Char;      // �����ڵ�
    janggb          : Char;                       // �屸��
                                                  // 1:������
                                                  // 2:�尳�����ð���
                                                  // 3:�������Ľð�������
                                                  // 4:�������Ľð��ܴ��ϰ�
    sign            : Char;                       // ���ϴ�񱸺�
                                                  // 0:�ǴܺҰ� 1:���� 2:���
                                                  // 3:���� 4:���� 5:�϶�
    change          : Array [1.. 9] of Char;      // ���ϴ�� (����:��)
                                                  // �����μ��� ����/������ �ű� ���� ���� : 0
    cheprice        : Array [1.. 9] of Char;      // ü�ᰡ   (����: ��)
    cheqty          : Array [1..10] of Char;      // ü����� (����: ��)
    chegb           : Array [1.. 2] of Char;      // ü�������ڵ�
                                                  // 10:�ð����ϰ� 11:�ð����ϰ�����
                                                  // 20:���ߴ��ϰ� 21:���ߴ��ϰ�����
                                                  // 30:�������ϰ� 40:���� 50:�尳�����ð�������
                                                  // 60:�������Ľð����������� 65:�������Ľð�������
                                                  // 70:�ð��ܴ��ϰ� 80:�����Ÿ�ü��
    open            : Array [1.. 9] of Char;      // �ð�     (����: ��) �������� ��쿡��
    high            : Array [1.. 9] of Char;      // ��     (����: ��) ������, �ð��ܴ��ϰ��� ��쿡��(�� �庰 ��)
    low             : Array [1.. 9] of Char;      // ����     (����: ��) ������, �ð��ܴ��ϰ��� ��쿡��(�� �庰 ��)
    volume          : Array [1..12] of Char;      // �����ŷ���(��) �����Խð��ܱ����ڵ庰�� ������
    value           : Array [1..18] of Char;      // �����ŷ����(����:��) �����Խð��ܱ����ڵ庰�� ������
    lastmmgb        : Char;                       // �����ŵ��ż������ڵ�(1:�ŵ�,2:�ż�)
    isprchoga       : Char;                       // ü�ᰡ��1ȣ����ġ����(0:�ǴܺҰ�,1:��ġ,2:����ġ)
    chetime         : Array [1.. 6] of Char;      // ü��ð� (HHMMSS)
    lp_volume       : Array [1..15] of Char;      // LPȣ�� ������ LP��������
    offerho         : Array [1.. 9] of Char;      // �ŵ�1ȣ��
    bidho           : Array [1.. 9] of Char;      // �ż�1ȣ��
    filler          : Array [1.. 2] of Char;      // filler
    etx             : Char                        // End of Text
  end;

  // A3012  // �ڽ��� ü��(�ü�)
  PKOSCOM_Q_A3      = ^TKOSCOM_Q_A3;
  TKOSCOM_Q_A3      = TKOSCOM_K_A3;
  
  // A3021  // ELW ü��(�ü�)
  PKOSCOM_E_A3      = ^TKOSCOM_E_A3;
  TKOSCOM_E_A3      = TKOSCOM_K_A3;

  // B6011  // �ڽ��� ȣ���ܷ�-ELW����(�ü�)
  TB6_Hoga          = record
    offerho         : Array [1.. 9] of Char;      // �ŵ�ȣ��            (��)
    bidho           : Array [1.. 9] of Char;      // �ż�ȣ��            (��)
    offerjan        : Array [1..12] of Char;      // �ŵ�ȣ������        (��)
    bidjan          : Array [1..12] of Char;      // �ż�ȣ������        (��)
  end;
  PKOSCOM_K_B6      = ^TKOSCOM_K_B6;
  TKOSCOM_K_B6      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "B6" ȣ���ܷ�(ELW ����)
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������, 2:�ڽ���

    expcode         : Array [1..12] of Char;      // �����ڵ�
    volume          : Array [1..12] of Char;      // ü�������
    hoga            : Array [1..10] of TB6_Hoga;
    totofferjan     : Array [1..12] of Char;      // �ŵ�ȣ���Ѽ���      (��)
    totbidjan       : Array [1..12] of Char;      // �ż�ȣ���Ѽ���      (��)

    filler1         : Array [1..12] of Char;      // Filler 1
    filler2         : Array [1..12] of Char;      // Filler 2

    clo_mkt_totofferjan: Array [1..12] of Char;   // �������Ľð��� �ŵ���ȣ���ܷ�
    clo_mkt_totbidjan  : Array [1..12] of Char;   // �������Ľð��� �ż���ȣ���ܷ�

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // 00:�ʱ�(�尳����) 10:�ð����ϰ� 11:�ð����ϰ�����
                                                  // 20:���ߴ��ϰ� 21:���ߴ��ϰ����� 30:�������ϰ� 40:����
                                                  // 50:�尳�����ð��� 60:�������Ľð�������
                                                  // 65:�������Ľð��� 70:�ð��ܴ��ϰ� 80:�����Ÿ�ü��
                                                  // 90:�ŷ����� 99:�帶��
    out_jang_gb     : Char;                       // ���Խð��ܱ����ڵ�
                                                  // 1:������ 2:�尳�����ð������� 3:�������Ľð�������
                                                  // 4:�������Ľð��ܴ��ϰ�
    ycga            : Array [1.. 9] of Char;      // ����ü�� ����
    ycvl            : Array [1..12] of Char;      // ����ü�� ����
    filler          : Array [1.. 2] of Char;      // Space
    etx             : Char                        // End of Text
  end;
  
  // B6012  // �ڽ��� ȣ���ܷ�(�ü�)
  PKOSCOM_Q_B6      = ^TKOSCOM_Q_B6;
  TKOSCOM_Q_B6      = TKOSCOM_K_B6;

  // B7011 / B7021  // ELW / ETF ȣ���ܷ�(�ü�)
  TB7_Hoga          = record
    offerho         : Array [1.. 9] of Char;      // �ŵ�ȣ��            (��)
    bidho           : Array [1.. 9] of Char;      // �ż�ȣ��            (��)
    offerjan        : Array [1..12] of Char;      // �ŵ�ȣ������        (��)
    bidjan          : Array [1..12] of Char;      // �ż�ȣ������        (��)
    lpofferjan      : Array [1..12] of Char;      // LP �ŵ�ȣ������     (��)
    lpbidjan        : Array [1..12] of Char;      // LP �ż�ȣ������     (��)
  end;
  PKOSCOM_E_B7      = ^TKOSCOM_E_B7;
  TKOSCOM_E_B7      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "B7" ETF / ELWȣ���ܷ�
    pkgb            : Array [1.. 2] of Char;      // ��������- 01 : ETF, O2:�ֽ�(ELW)
    mkgb            : Char;                       // ���屸��- 1:��������

    expcode         : Array [1..12] of Char;      // �����ڵ�
    volume          : Array [1..12] of Char;      // ü�������
    hoga            : Array [1..10] of TB7_Hoga;
    totofferjan     : Array [1..12] of Char;      // �ŵ�ȣ���Ѽ���      (��)
    totbidjan       : Array [1..12] of Char;      // �ż�ȣ���Ѽ���      (��)
//* 20100614=== S ��Ƽĳ��Ʈ ����� �߰��� S ==============  */
    filler1         : Array [1.. 12] of Char;     // Filler 1
    filler2         : Array [1.. 12] of Char;     // Filler 2

    clo_mkt_totofferjan : Array [1..12] of Char;  // �������Ľð��� �ŵ���ȣ���ܷ�
    clo_mkt_totbidjan   : Array [1..12] of Char;  // �������Ľð��� �ż���ȣ���ܷ� 
//* =========== E ��Ƽĳ��Ʈ ����� �߰��� E ==============  */ 
    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // 00:�ʱ�(�尳����) 10:�ð����ϰ� 11:�ð����ϰ�����
                                                  // 20:���ߴ��ϰ� 21:���ߴ��ϰ����� 30:�������ϰ� 40:����
                                                  // 50:�尳�����ð��� 60:�������Ľð�������
                                                  // 65:�������Ľð��� 70:�ð��ܴ��ϰ� 80:�����Ÿ�ü��
                                                  // 90:�ŷ����� 99:�帶��
    out_jang_gb     : Char;                       // ���Խð��ܱ����ڵ�
                                                  // 1:������ 2:�尳�����ð������� 3:�������Ľð�������
                                                  // 4:�������Ľð��ܴ��ϰ�
    ycga            : Array [1.. 9] of Char;      // ����ü�� ����
    ycvl            : Array [1..12] of Char;      // ����ü�� ����
    filler          : Array [1.. 4] of Char;      // Space
    etx             : Char                        // End of Text
  end;

  // B8011  // �ڽ��� �尳���� ȣ���ܷ�(�ü�)
  PKOSCOM_K_B8      = ^TKOSCOM_K_B8;
  TKOSCOM_K_B8      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "B8" �尳���� ȣ���ܷ�
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������, 2:�ڽ���

    expcode         : Array [1..12] of Char;      // �����ڵ�
    volume          : Array [1..12] of Char;      // ü�������
    totofferjan     : Array [1..10] of Char;      // �ŵ�ȣ���Ѽ���      (��)
    totbidjan       : Array [1..10] of Char;      // �ż�ȣ���Ѽ���      (��)
    filler          : Array [1.. 6] of Char;      // Space
    etx             : Char                        // End of Text
  end;
  
  // B8012  // �ڽ��� �尳���� ȣ���ܷ�(�ü�)
  PKOSCOM_Q_B8      = ^TKOSCOM_Q_B8;
  TKOSCOM_Q_B8      = TKOSCOM_K_B8;
  
  // B8011  // ELW �尳���� ȣ���ܷ�(�ü�)
  PKOSCOM_E_B8      = ^TKOSCOM_E_B8;
  TKOSCOM_E_B8      = TKOSCOM_K_B8;

  // D0011  // �ڽ��� ����
  PKOSCOM_K_D0    = ^TKOSCOM_K_D0;
  TKOSCOM_K_D0    = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "D0" �ڽ�������
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������, 2:�ڽ���

    code            : Array [1.. 3] of Char;      // �����ڵ�
    time            : Array [1.. 6] of Char;      // ó���ð�     : (HH:MM:SS)
    jisu            : Array [1.. 8] of Char;      // ����         : 9(6)V99
    sign            : Char;                       // ���ϴ�񱸺�
                                                  // '+':���
                                                  // '-':�϶�
                                                  // ' ':����
    diff            : Array [1.. 8] of Char;      // ���ϴ��     : 9(6)V99
    gvol            : Array [1.. 8] of Char;      // ü����� (����:õ��)
    gamt            : Array [1.. 8] of Char;      // �ŷ���� (����:�鸸��)
    filler          : Array [1.. 2] of Char;      // Space
    etx             : Char;                       // End of Text
  end;
  
  // D1011  // �ڽ��� ��������
  PKOSCOM_K_D1    = ^TKOSCOM_K_D1;
  TKOSCOM_K_D1    = TKOSCOM_K_D0;
  
  // D2011  // �ڽ��� 200����
  PKOSCOM_K_D2    = ^TKOSCOM_K_D2;
  TKOSCOM_K_D2    = TKOSCOM_K_D0;
  
  // D3011  // �ڽ��� 200��������
  PKOSCOM_K_D3    = ^TKOSCOM_K_D3;
  TKOSCOM_K_D3    = TKOSCOM_K_D0;
  
  // D0012  // �ڽ��� ����
  PKOSCOM_Q_D0    = ^TKOSCOM_Q_D0;
  TKOSCOM_Q_D0    = TKOSCOM_K_D0;
  
  // D1012  // �ڽ��� ��������
  PKOSCOM_Q_D1    = ^TKOSCOM_Q_D1;
  TKOSCOM_Q_D1    = TKOSCOM_K_D0;

  // C6021  // ELW ������ǥ(�ü�)
  PKOSCOM_E_C6      = ^TKOSCOM_E_C6;
  TKOSCOM_E_C6      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "C6" ELW ������ǥ
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������

    expcode         : Array [1..12] of Char;      // ǥ�� �����ڵ�
    time            : Array [1.. 6] of Char;      // �ð�(HHMMSS)
                                                  // ����:HHMMSS(�ð�:��:��) 090000 ~ ������:JUNJJJ
    parity          : Array [1.. 8] of Char;      // �и�Ƽ                 9(6)V(2)
    gearing         : Array [1.. 8] of Char;      // ��                 9(6)V(2)

    breakep_sign    : Char;                       // ���ͺб��� ��� ��ȣ
                                                  // "+": ���,"-":�϶�," ":����
    breakep         : Array [1.. 7] of Char;      // ���ͺб���             9(5)V(2)

    capitalfp_sign  : Char;                       // �ں������� ��� ��ȣ
                                                  // "+": ���,"-":�϶�," ":����
    capitalfp       : Array [1.. 7] of Char;      // �ں�������             9(5)V(2)
                                                  // ������ ����� �ѹ��� �����. �� �ܴ� "0"
                                                  // ����Ŀ��� �� < 0 �̸� "0"���� SET
    basket          : Array [1..11] of Char;      // �ٽ����ְ�             9(9)V(2)
    filler          : Array [1.. 3] of Char;      // Space
    etx             : Char;                       // End of Text
  end;

  // C7021  // ELW ������ǥ �ΰ���(�ü�)
  PKOSCOM_E_C7      = ^TKOSCOM_E_C7;
  TKOSCOM_E_C7      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� "C7" ELW ������ǥ �ΰ���
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:�ֽ�
    mkgb            : Char;                       // ���屸��- 1:��������

    expcode         : Array [1..12] of Char;      // ǥ�� �����ڵ�
    time            : Array [1.. 6] of Char;      // �ð�(HHMMSS)
                                                  // ����:HHMMSS(�ð�:��:��) 090000 ~ ������:JUNJJJ
    theory          : Array [1..10] of Char;      // �̷а�             9(8)V(2)

    delta_sign      : Char;                       // ��Ÿ ��ȣ
                                                  // "+":���,"-":�϶�," ":����
    delta           : Array [1.. 7] of Char;      // ��Ÿ               9(1)V(6)
    gamma           : Array [1.. 7] of Char;      // ����               9(1)V(6)


    theta_sign      : Char;                       // ��Ÿ ��ȣ
                                                  // "+":���,"-":�϶�," ":����    
    theta           : Array [1..12] of Char;      // ��Ÿ               9(6)V(6)

    vega_sign       : Char;                       // ��Ÿ ��ȣ
                                                  // "+":���,"-":�϶�," ":����
    vega            : Array [1..12] of Char;      // ����               9(6)V(6)

    rho_sign        : Char;                       // �� ��ȣ
                                                  // "+":���,"-":�϶�," ":����    
    rho             : Array [1..12] of Char;      // ��                 9(6)V(6)   

    in_vola         : Array [1.. 5] of Char;      // ���� ������        9(3)V(2)
                                                  // ��������ELW�� ��� 0 (2010.08.30)
    expns           : Array [1..10] of Char;      // ���ݺ��                 9(8)V(2)
                                                  // ǥ��ELW�� ��� 0 (2010.08.30)       
    filler          : Array [1.. 8] of Char;      // Space
    etx             : Char;                       // End of Text
  end;

  // M4011/M4012  // ������
  PKOSCOM_E_M4      = ^TKOSCOM_E_M4;
  TKOSCOM_E_M4      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ���                     'M4'
    pkgb            : Array [1.. 2] of Char;      // ��������                       '01'
    mktgb           : Char;                       // ���屸��        1:�������� 2:�ڽ���
    expcode         : Array [1..12] of Char;      // ǥ�� �����ڵ�
                                                  // �������� �� ��ġ��, ��������(KO)�� ���
    jang_gb         : Array [1.. 3] of Char;      // �� �����ڵ�           X(03)
                                                  //   110 : �ð����ϰ�����
                                                  //   112 : �ð����ϰ�����
                                                  //   121 : �������ϰ�����
                                                  //   129 : �������ϰ�����
                                                  //   162 : ��ü���ߴ��ϰ�����
                                                  //   164 : �����ӽ�����
                                                  //   165 : �ӽ��������簳
                                                  //   172 : �ֽİ��ݱ޺����ϰ�����
                                                  //   174 : �ֽİ��ݱ޺��ߴ�
                                                  //   175 : �ֽİ��ݱ޺��簳
                                                  //   182 : �������ݱ޺����ϰ�����
                                                  //   184 : �������ݱ޺��ߴ�
                                                  //   185 : �������ݱ޺��簳
                                                  //   192 : ���ߴ��ϰ�����(Ư���ֽ� ���ϰ�����)
                                                  //   194 : �ŸŰŷ�����(Ư���ֽ� �Ÿ��ߴ�)
                                                  //   195 : �ŸŰŷ��簳(Ư���ֽ� �Ÿ��簳)
                                                  //   231 : �����ŷ�����������
                                                  //   239 : �����ŷ��ϸ���
                                                  //   354 : ȣ����������
                                                  //   355 : ȣ�������簳
                                                  //   417 : �ֽİ��ݱ޺�����
                                                  //   419 : �ֽİ��ݱ޺���������
                                                  //   427 : �������ݱ޺�����
                                                  //   429 : �������ݱ޺���������
                                                  //   311 : ����ü�ᰡ���ⰳ��
                                                  //   226 : �����Ÿ�ü������(�����ŸŻ�ǰ ���ϰ�����)
                                                  //   221 : �����Ÿ�ü����������(�����ŸŻ�ǰ ���ϰ����� - ������ �����Ÿ� ���ϰ������� ���)
                                                  //   371 : �뷮�ŷ�����
                                                  //   373 : �뷮�ŷ�����
                                                  //   911 : ���׸����
                                                  //   912 : ���׸��������
                                                  //   459 : �Ÿ�ü����������
                                                  //   473 : ��������(KO)(20100830)
    jang_kind       : Char;                       // �������ڵ�             X(01)
                                                  //   1:��ü
                                                  //   2:����
                                                  //   3:ȸ��
                                                  //   4:�Ļ���ǰ(CLASS)
                                                  //   5:�����Ÿ�ü��
                                                  //   6:�����ŷ�������
                                                  //   *��������(KO)�� "2"
    jang_stat       : Array [1.. 2] of Char;      // ����±����ڵ�             X(01)
                                                  //   00:�ʱ�(�尳����)
                                                  //   10:�ð����ϰ�
                                                  //   11:�ð����ϰ�����
                                                  //   20:���ߴ��ϰ�
                                                  //   21:���ߴ��ϰ�����
                                                  //   30:�������ϰ�
                                                  //   40:����
                                                  //   50:�尳�����ð���
                                                  //   60:�������Ľð�������
                                                  //   65:�������Ľð���
                                                  //   70:�ð��ܴ��ϰ�
                                                  //   80:�����Ÿ�ü��
                                                  //   90:�ŷ�����
                                                  //   99:�帶��
                                                  //   *��������(KO) �� "  "
    cdate           : Array [1.. 8] of Char;      // ����ġ����-YYYYMMDD  X(08)
    ctime           : Array [1.. 6] of Char;      // ����ġ�ð�           X(09)
                                                  //   HHMMSS(milisecond)
                                                  //   *��������(KO)�� �������� �ð�
    janggb          : Char;     // ���Խð��� �����ڵ�
                                                  //   1 : ������
                                                  //   2 : �尳�����ð�������
                                                  //   3 : �������Ľð�������
                                                  //   4 : �������Ľð��ܴ��ϰ�
    isin_cd         : Array [1..12] of Char;      // ����������ڵ�           X(12)
                                                  //   ������� ������ ISIN�ڵ�
                                                  //   (ȸ����� �� ��ġ�� ���)
    stop_rsn        : Array [1.. 3] of Char;      // �ŷ����������ڵ�         X(03)
                                                  //   *��������(KO) �� "  "
    stop_res        : Char;                       // �ŷ������߻������ڵ�     X(01)
                                                  //   1:�ڱ�����
                                                  //   2:�����μ�������
                                                  //   3:�����μ�������
                                                  //   4:�����ڻ�ELW
                                                  //   5:����ELW
                                                  //   6:�����
                                                  //   7:�����ڻ�Ҽӽ���
                                                  //   *��������(KO)�� "1"
    filler          : Array [1.. 5] of Char;      // filler
    ff              : Char;                       // End Of Text
  end;

  // F7011 ETF NAV
  PKOSCOM_K_F7      = ^TKOSCOM_K_F7;
  TKOSCOM_K_F7      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'F7'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
                                                    // 01: �ֽ�
    mktgb           : Char;                         // ���屸��                        '1'
                                                    // 1: ��������
    expcode         : Array [1.. 12] of Char;       // �����ڵ�
    time            : Array [1..  6] of Char;       // �ð�
    pre_nav         : Array [1..  9] of Char;       // ���� NAV
    prsnt_nav       : Array [1..  9] of Char;       // ����/���� NAV
    trc_rt          : Array [1.. 10] of Char;       // ����������(��ȣ����)
    dsp_rt          : Array [1.. 10] of Char;       // ������(��ȣ����)
    filler          : Array [1..  8] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // I3011 ETF ���� NAV
  PKOSCOM_K_I3      = ^TKOSCOM_K_I3;
  TKOSCOM_K_I3      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'I3'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
                                                    // 01: �ֽ�
    mktgb           : Char;                         // ���屸��                        '1'
                                                    // 1: ��������
    expcode         : Array [1.. 12] of Char;       // �����ڵ�
    time            : Array [1..  6] of Char;       // �ð�
    pre_nav         : Array [1..  9] of Char;       // ���� NAV
    prsnt_nav       : Array [1..  9] of Char;       // ����/���� NAV
    filler          : Array [1..  8] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // M8011 ETF �������
  PKOSCOM_K_M8      = ^TKOSCOM_K_M8;
  TKOSCOM_K_M8      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'M8'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
                                                    // 01: �ֽ�
    mktgb           : Char;                         // ���屸��                        '1'
                                                    // 1: ��������
    expcode         : Array [1.. 12] of Char;       // �����ڵ�
    seq             : Array [1..  8] of Char;       // �Ϸù�ȣ
    consign_cd      : Array [1..  3] of Char;       // �繫��Ź ȸ����ȣ(�ѱ���Ź��:908)
    etf_memb_cd     : Array [1..  6] of Char;       // ����ڵ�
    etf_memb_nm     : Array [1.. 50] of Char;       // ����ѱ۾��
    etf_memb_en     : Array [1.. 40] of Char;       // ��翵�����
    filler          : Array [1..  5] of Char;       //
    ff              : Char;                         // End Of Text
  end;

  // A3014  // ���� ü��(�ü�)
  PKOSCOM_F_A3      = ^TKOSCOM_F_A3;
  TKOSCOM_F_A3      = record
    datagb          : Array [1.. 2] of Char;      //  �����ͱ��� A3
    pkgb            : Array [1.. 2] of Char;      //  ��������- O1:����
    mkgb            : Char;                       //  ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 2] of Char;      // ���� SEQ��ȣ
    curr            : Array [1.. 6] of Char;      // ���簡
    cvol            : Array [1.. 6] of Char;      // ü�����
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    cyga            : Array [1.. 5] of Char;      // �ֱٿ��� ������������
    oyga            : Array [1.. 5] of Char;      // ������ ������������
    open            : Array [1.. 6] of Char;      // ��  ��
    high            : Array [1.. 6] of Char;      // ��  ��
    low             : Array [1.. 6] of Char;      // ��  ��
    preprice        : Array [1.. 6] of Char;      // ��������
    volume          : Array [1.. 7] of Char;      // ���� ����    (����:���)
    value           : Array [1..12] of Char;      // ���� ���    (����:õ��)

    etx             : Char                        // End of Text
  end;

  // B6014  // ���� �켱ȣ��(�ü�)
  PKOSCOM_F_B6      = ^TKOSCOM_F_B6;
  TKOSCOM_F_B6      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� B6
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 2] of Char;      // ���� SEQ��ȣ
    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                  
    mshotot         : Array [1.. 6] of Char;      // �ż���ȣ������       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)
                  
    mdhotot         : Array [1.. 6] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)
                    
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
                    
    hotime          : Array [1.. 8] of Char;      // ȣ�� �����ð�
                    
    etx             : Char                        // End of Text
  end;

  // G7014  // ���� ü��+�켱ȣ��(�ü�)
  PKOSCOM_F_G7      = ^TKOSCOM_F_G7;
  TKOSCOM_F_G7      = record                      // ü��+ȣ��(����)
    datagb          : Array [1.. 2] of Char;      //  �����ͱ��� G7
    pkgb            : Array [1.. 2] of Char;      //  ��������- O1:����
    mkgb            : Char;                       //  ���屸��- 4
                    
    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 2] of Char;      // ���� SEQ��ȣ
    curr            : Array [1.. 6] of Char;      // ���簡
    cvol            : Array [1.. 6] of Char;      // ü�����
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    cyga            : Array [1.. 5] of Char;      // �ֱٿ��� ������������
    oyga            : Array [1.. 5] of Char;      // ������ ������������
    open            : Array [1.. 6] of Char;      // ��  ��
    high            : Array [1.. 6] of Char;      // ��  ��
    low             : Array [1.. 6] of Char;      // ��  ��
    preprice        : Array [1.. 6] of Char;      // ��������
    volume          : Array [1.. 7] of Char;      // ���� ����    (����:���)
    value           : Array [1..12] of Char;      // ���� ���    (����:õ��)

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                    
    mshotot         : Array [1.. 6] of Char;      // �ż���ȣ������       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)
                    
    mdhotot         : Array [1.. 6] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)
                    
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�

    etx             : Char                        // End of Text
  end;

  // A7014  // ���� ����(�ü�)
  PKOSCOM_F_A7      = ^TKOSCOM_F_A7;
  TKOSCOM_F_A7      = record                      // ����(����)
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� A7
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4
                    
    jangtime        : Array [1.. 8] of Char;      // ���� ��ġ�ð�
    jggb            : Array [1.. 2] of Char;      // �������ڵ�
    underid         : Array [1..10] of Char;      // ��ǰID(�����ڻ�ID)
    jgcode          : Array [1..12] of Char;      // ���� �ڵ�
    jgseq           : Array [1.. 2] of Char;      // ���� SEQ��ȣ

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������

    hogagb          : Char;                       // ȣ������(0:ȣ������, 1:ȣ������)

    mshotot         : Array [1.. 6] of Char;      // �ż���ȣ������       : 9(6)
    mshoga          : Array [1.. 6] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshoga1         : Array [1.. 6] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshoga2         : Array [1.. 6] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshoga3         : Array [1.. 6] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshoga4         : Array [1.. 6] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)

    mdhotot         : Array [1.. 6] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhoga          : Array [1.. 6] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhoga1         : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhoga2         : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhoga3         : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhoga4         : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)

    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�

    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�

    etx             : Char                        // End of Text
  end;

  // H2014  // ���� �̰�������
  PKOSCOM_F_H2      = ^TKOSCOM_F_H2;
  TKOSCOM_F_H2      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� H2
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 2] of Char;      // ���� SEQ��ȣ

    gb              : Array [1.. 2] of Char;      // �̰�����������
                                                  //  ���� Ȯ�� : "M0" (07:30�а� ����)
                                                  //  ���� ���� : "M1" (���� Ư���������� �������� �۽�, 10��)
                                                  //  ���� Ȯ�� : "M2" (���� ������ �۽�, ������ 1�ð��� ����)

    date            : Array [1.. 8] of Char;      // �ŷ�����
    mgjv            : Array [1.. 9] of Char;      // �̰���ü�����

    etx             : Char                        // End of Text
  end;

  // A3034  // �ɼ� ü��(�ü�)
  PKOSCOM_O_A3      = ^TKOSCOM_O_A3;
  TKOSCOM_O_A3      = record
    datagb          : Array [1.. 2] of Char;      //  �����ͱ��� A3
    pkgb            : Array [1.. 2] of Char;      //  ��������- O3:�ɼ�
    mkgb            : Char;                       //  ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // �����ڵ�
    seq             : Array [1.. 3] of Char;      // ����seq��ȣ          : 9(4)
    curr            : Array [1.. 5] of Char;      // ���簡               : 9(3)V99
    cvol            : Array [1.. 7] of Char;      // ü�����             : 9(8)
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    open            : Array [1.. 5] of Char;      // ��  ��
    high            : Array [1.. 5] of Char;      // ��  ��
    low             : Array [1.. 5] of Char;      // ��  ��
    preprice        : Array [1.. 5] of Char;      // ��������
    volume          : Array [1.. 8] of Char;      // ���� ����    (����:���)
    value           : Array [1..11] of Char;      // ���� ���    (����:õ��)

    etx             : Char                        // End of Text
  end;

  // B6034  // �ɼ� �켱ȣ��(�ü�)
  PKOSCOM_O_B6      = ^TKOSCOM_O_B6;
  TKOSCOM_O_B6      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� B6
    pkgb            : Array [1.. 2] of Char;      // ��������- O3:�ɼ�
    mkgb            : Char;                       // ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // �����ڵ�
    seq             : Array [1.. 3] of Char;      // ����seq��ȣ          : 9(4)

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                    
    mshotot         : Array [1.. 7] of Char;      // �ż���ȣ������       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // �ż��ֿ켱ȣ��       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // �ż��ֿ켱ȣ������   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // �ż�2���켱ȣ��      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // �ż�2���켱ȣ������  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // �ż�3���켱ȣ��      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // �ż�3���켱ȣ������  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // �ż�4���켱ȣ��      : 9(3)V99
    mshoqty3        : Array [1.. 7] of Char;      // �ż�4���켱ȣ������  : 9(7)
    mshoga4         : Array [1.. 5] of Char;      // �ż�5���켱ȣ��      : 9(3)V99
    mshoqty4        : Array [1.. 7] of Char;      // �ż�5���켱ȣ������  : 9(7)
                    
    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // �ŵ��ֿ켱ȣ��       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // �ŵ��ֿ켱ȣ������   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // �ŵ�2���켱ȣ��      : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // �ŵ�2���켱ȣ������  : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // �ŵ�3���켱ȣ��      : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // �ŵ�3���켱ȣ������  : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // �ŵ�4���켱ȣ��      : 9(3)V99
    mdhoqty3        : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ������  : 9(7)
    mdhoga4         : Array [1.. 5] of Char;      // �ŵ�5���켱ȣ��      : 9(3)V99
    mdhoqty4        : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ������  : 9(7)
                    
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
                    
    time            : Array [1.. 8] of Char;      // ȣ�������ð�
                    
    etx             : Char                        // End of Text
  end;


  // G7034  // �ɼ� ü��+�켱ȣ��(�ü�)
  PKOSCOM_O_G7      = ^TKOSCOM_O_G7;
  TKOSCOM_O_G7      = record                      // ü��+ȣ��(�ɼ�)
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� G7
    pkgb            : Array [1.. 2] of Char;      // ��������- O3:�ɼ�
    mkgb            : Char;                       // ���屸��- 4
                    
    isu_cd          : Array [1..12] of Char;      // �����ڵ�
    seq             : Array [1.. 3] of Char;      // ����seq��ȣ          : 9(4)
    curr            : Array [1.. 5] of Char;      // ���簡
    cvol            : Array [1.. 7] of Char;      // ü�����             : 9(8)
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    open            : Array [1.. 5] of Char;      // ��  ��
    high            : Array [1.. 5] of Char;      // ��  ��
    low             : Array [1.. 5] of Char;      // ��  ��
    preprice        : Array [1.. 5] of Char;      // ��������
    volume          : Array [1.. 8] of Char;      // ���� ����    (����:���)
    value           : Array [1..11] of Char;      // ���� ���    (����:õ��)
                    
    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                    
    mshotot         : Array [1.. 7] of Char;      // �ż���ȣ������       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // �ż��ֿ켱ȣ��       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // �ż��ֿ켱ȣ������   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // �ż�2���켱ȣ��      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // �ż�2���켱ȣ������  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // �ż�3���켱ȣ��      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // �ż�3���켱ȣ������  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // �ż�4���켱ȣ��
    mshoqty3        : Array [1.. 7] of Char;      // �ż�4���켱ȣ������
    mshoga4         : Array [1.. 5] of Char;      // �ż�5���켱ȣ��
    mshoqty4        : Array [1.. 7] of Char;      // �ż�5���켱ȣ������
                    
    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // �ŵ��ֿ켱ȣ��       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // �ŵ��ֿ켱ȣ������   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // �ŵ����켱ȣ��       : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // �ŵ����켱ȣ������   : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // �ŵ������켱ȣ��     : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // �ŵ������켱ȣ������ : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // �ŵ�4���켱ȣ��
    mdhoqty3        : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ������
    mdhoga4         : Array [1.. 5] of Char;      // �ŵ�5���켱ȣ��
    mdhoqty4        : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ������
                    
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
                    
    etx             : Char                        // End of Text
  end;

  // �������ڵ�
  //   110 : �ð����ϰ�����
  //   112 : �ð����ϰ�����
  //   121 : �������ϰ�����
  //   129 : �������ϰ�����
  //   162 : ��ü���ߴ��ϰ�����
  //   164 : �����ӽ�����(��ü�ŸŰŷ��ߴ�)
  //   165 : �ӽ��������簳(��ü�ŸŰŷ��簳)
  //   172 : �ֽİ��ݱ޺����ϰ�����
  //   174 : �ֽİ��ݱ޺��ߴ�
  //   175 : �ֽİ��ݱ޺��簳
  //   182 : �������ݱ޺����ϰ�����
  //   184 : �������ݱ޺��ߴ�
  //   185 : �������ݱ޺��簳
  //   192 : ���ߴ��ϰ�����(Ư���ֽ� ���ϰ�����)
  //   194 : �ŸŰŷ�����(Ư���ֽ� �Ÿ��ߴ�)
  //   195 : �ŸŰŷ��簳(Ư���ֽ� �Ÿ��簳)
  //   231 : �����ŷ�����������
  //   239 : �����ŷ��ϸ���
  //   354 : ȣ����������
  //   355 : ȣ�������簳
  //   417 : �ֽİ��ݱ޺�����
  //   419 : �ֽİ��ݱ޺���������
  //   427 : �������ݱ޺�����
  //   429 : �������ݱ޺���������
  //   311 : ����ü�ᰡ���ⰳ��
  //   226 : �����Ÿ�ü������(�����ŸŻ�ǰ ���ϰ�����)
  //   221 : �����Ÿ�ü����������(�����ŸŻ�ǰ ���ϰ����� - ������ �����Ÿ� ���ϰ������� ���)
  //   371 : �뷮�ŷ�����
  //   373 : �뷮�ŷ�����
  //   911 : ���׸����
  //   912 : ���׸��������
  //   459 : �Ÿ�ü����������

  // A7034  // �ɼ� ����(�ü�)
  PKOSCOM_O_A7      = ^TKOSCOM_O_A7;
  TKOSCOM_O_A7      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� A7
    pkgb            : Array [1.. 2] of Char;      // ��������- O3:�ɼ�
    mkgb            : Char;                       // ���屸��- 4

    ctime           : Array [1.. 8] of Char;      // ����ġ�ð�
    jggb            : Array [1.. 2] of Char;      // �������ڵ�
    underid         : Array [1..10] of Char;      // ��ǰID(�����ڻ�ID)
    isu_cd          : Array [1..12] of Char;      // �����ڵ�
    seq             : Array [1.. 3] of Char;      // ����seq��ȣ          : 9(4)
                    
    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                    
    hogagb          : Char;                       // ȣ������(0:ȣ������, 1:ȣ������)
                    
    mshotot         : Array [1.. 7] of Char;      // �ż���ȣ������       : 9(7)
    mshoga          : Array [1.. 5] of Char;      // �ż��ֿ켱ȣ��       : 9(3)V99
    mshoqty         : Array [1.. 7] of Char;      // �ż��ֿ켱ȣ������   : 9(7)
    mshoga1         : Array [1.. 5] of Char;      // �ż�2���켱ȣ��      : 9(3)V99
    mshoqty1        : Array [1.. 7] of Char;      // �ż�2���켱ȣ������  : 9(7)
    mshoga2         : Array [1.. 5] of Char;      // �ż�3���켱ȣ��      : 9(3)V99
    mshoqty2        : Array [1.. 7] of Char;      // �ż�3���켱ȣ������  : 9(7)
    mshoga3         : Array [1.. 5] of Char;      // �ż�4���켱ȣ��
    mshoqty3        : Array [1.. 7] of Char;      // �ż�4���켱ȣ������
    mshoga4         : Array [1.. 5] of Char;      // �ż�5���켱ȣ��
    mshoqty4        : Array [1.. 7] of Char;      // �ż�5���켱ȣ������
                    
    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(7)
    mdhoga          : Array [1.. 5] of Char;      // �ŵ��ֿ켱ȣ��       : 9(3)V99
    mdhoqty         : Array [1.. 7] of Char;      // �ŵ��ֿ켱ȣ������   : 9(7)
    mdhoga1         : Array [1.. 5] of Char;      // �ŵ�2���켱ȣ��      : 9(3)V99
    mdhoqty1        : Array [1.. 7] of Char;      // �ŵ�2���켱ȣ������  : 9(7)
    mdhoga2         : Array [1.. 5] of Char;      // �ŵ�3���켱ȣ��      : 9(3)V99
    mdhoqty2        : Array [1.. 7] of Char;      // �ŵ�3���켱ȣ������  : 9(7)
    mdhoga3         : Array [1.. 5] of Char;      // �ŵ�4���켱ȣ��
    mdhoqty3        : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ������
    mdhoga4         : Array [1.. 5] of Char;      // �ŵ�5���켱ȣ��
    mdhoqty4        : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ������
                    
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
                    
    etx             : Char                        // End of Text
  end;

  // H2034  // �ɼ� �̰�������
  PKOSCOM_O_H2      = ^TKOSCOM_O_H2;
  TKOSCOM_O_H2      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� H2
    pkgb            : Array [1.. 2] of Char;      // ��������- O3:�ɼ�
    mkgb            : Char;                       // ���屸��- 4
                    
    isu_cd          : Array [1..12] of Char;      // �����ڵ�
    seq             : Array [1.. 3] of Char;      // ����seq��ȣ          : 9(4)
    mgjb            : Array [1.. 2] of Char;      // �̰�������
                                                  //   ���� Ȯ�� : "M0" (07:30�а� ����)
                                                  //   ���� ���� : "M1" (���� Ư���������� �������� �۽�, 10��)
                                                  //   ���� Ȯ�� : "M2" (���� ������ �۽�, ������ 1�ð��� ����)

    date            : Array [1.. 8] of Char;      // �ŷ�����
    mgjv            : Array [1.. 9] of Char;      // �̰�����������  :9(8)
                    
    etx             : Char                        // End of Text
  end;


  // A3015  // �ֽļ��� ü��(�ü�)
  PKOSCOM_G_A3      = ^TKOSCOM_G_A3;
  TKOSCOM_G_A3      = record
    datagb          : Array [1.. 2] of Char;      //  �����ͱ��� A3
    pkgb            : Array [1.. 2] of Char;      //  ��������- O1:����
    mkgb            : Char;                       //  ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 4] of Char;      // ���� SEQ��ȣ
    currsign        : Char;                       // ���簡 ��ȣ
    curr            : Array [1.. 7] of Char;      // ���簡
    cvol            : Array [1.. 6] of Char;      // ü�����
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    cyga            : Array [1.. 7] of Char;      // �ֱٿ��� ������������
    oyga            : Array [1.. 7] of Char;      // ������ ������������
    opensign        : Array [1.. 1] of Char;      // �ð���ȣ
    open            : Array [1.. 7] of Char;      // ��  ��
    highsign        : Array [1.. 1] of Char;      // ����ȣ                  X(01) 
    high            : Array [1.. 7] of Char;      // ��                      9(07) 
    lowsign         : Array [1.. 1] of Char;      // ������ȣ                  X(01) 
    low             : Array [1.. 7] of Char;      // ����                      9(07) 
    prevsign        : Array [1.. 1] of Char;      // �������ݺ�ȣ              X(01) 
    prev            : Array [1.. 7] of Char;      // ��������                  9(07)

    volume          : Array [1.. 7] of Char;      // ����ü����� (����:���)  9(07) 
    value           : Array [1..15] of Char;      // ����ü���� (����:õ��)  9(15) 

    etx             : Char                        // End of Text
  end;

  // B6015  // �ֽļ��� �켱ȣ��(�ü�)
  PKOSCOM_G_B6      = ^TKOSCOM_G_B6;
  TKOSCOM_G_B6      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� B6
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 4] of Char;      // ���� SEQ��ȣ
    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                  
    mshotot         : Array [1.. 7] of Char;   // �ż���ȣ���ܷ�       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // �ż��켱ȣ�� Sign
    mshoga          : Array [1.. 7] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // �ż�2���켱ȣ�� Sign
    mshoga1         : Array [1.. 7] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // �ż�3���켱ȣ�� Sign
    mshoga2         : Array [1.. 7] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // �ż�4���켱ȣ�� Sign
    mshoga3         : Array [1.. 7] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // �ż�5���켱ȣ�� Sign
    mshoga4         : Array [1.. 7] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // �ż�6���켱ȣ�� Sign
    mshoga5         : Array [1.. 7] of Char;      // �ż�6���켱ȣ��      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // �ż�6���켱ȣ������  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // �ż�7���켱ȣ�� Sign
    mshoga6         : Array [1.. 7] of Char;      // �ż�7���켱ȣ��      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // �ż�7���켱ȣ������  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // �ż�8���켱ȣ�� Sign
    mshoga7         : Array [1.. 7] of Char;      // �ż�8���켱ȣ��      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // �ż�8���켱ȣ������  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // �ż�9���켱ȣ�� Sign
    mshoga8         : Array [1.. 7] of Char;      // �ż�9���켱ȣ��      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // �ż�9���켱ȣ������  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // �ż�10���켱ȣ�� Sign
    mshoga9         : Array [1.. 7] of Char;      // �ż�10���켱ȣ��      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // �ż�10���켱ȣ������  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // �ŵ��켱ȣ�� Sign
    mdhoga          : Array [1.. 7] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // �ŵ�2���켱ȣ�� Sign
    mdhoga1         : Array [1.. 7] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // �ŵ�3���켱ȣ�� Sign
    mdhoga2         : Array [1.. 7] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // �ŵ�4���켱ȣ�� Sign
    mdhoga3         : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // �ŵ�5���켱ȣ�� Sign
    mdhoga4         : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // �ŵ�6���켱ȣ�� Sign
    mdhoga5         : Array [1.. 7] of Char;      // �ŵ�6���켱ȣ��      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // �ŵ�6���켱ȣ������  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // �ŵ�7���켱ȣ�� Sign
    mdhoga6         : Array [1.. 7] of Char;      // �ŵ�7���켱ȣ��      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // �ŵ�7���켱ȣ������  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // �ŵ�8���켱ȣ�� Sign
    mdhoga7         : Array [1.. 7] of Char;      // �ŵ�8���켱ȣ��      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // �ŵ�8���켱ȣ������  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // �ŵ�9���켱ȣ�� Sign
    mdhoga8         : Array [1.. 7] of Char;      // �ŵ�9���켱ȣ��      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // �ŵ�9���켱ȣ������  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // �ŵ�10���켱ȣ�� Sign
    mdhoga9         : Array [1.. 7] of Char;      // �ŵ�10���켱ȣ��      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // �ŵ�10���켱ȣ������  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
    ms6wunum        : Array [1.. 4] of Char;      // �ż� 6�켱 ȣ���Ǽ�
    ms7wunum        : Array [1.. 4] of Char;      // �ż� 7�켱 ȣ���Ǽ�
    ms8wunum        : Array [1.. 4] of Char;      // �ż� 8�켱 ȣ���Ǽ�
    ms9wunum        : Array [1.. 4] of Char;      // �ż� 9�켱 ȣ���Ǽ�
    ms10wunum       : Array [1.. 4] of Char;      // �ż� 10�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
    md6wunum        : Array [1.. 4] of Char;      // �ŵ� 6�켱 ȣ���Ǽ�
    md7wunum        : Array [1.. 4] of Char;      // �ŵ� 7�켱 ȣ���Ǽ�
    md8wunum        : Array [1.. 4] of Char;      // �ŵ� 8�켱 ȣ���Ǽ�
    md9wunum        : Array [1.. 4] of Char;      // �ŵ� 9�켱 ȣ���Ǽ�
    md10wunum       : Array [1.. 4] of Char;      // �ŵ� 10�켱 ȣ���Ǽ�
                                       
    hotime          : Array [1.. 8] of Char;      // ȣ�� �����ð�
                    
    etx             : Char                        // End of Text
  end;

  // G7015  // �ֽļ��� ü��+�켱ȣ��(�ü�)
  PKOSCOM_G_G7      = ^TKOSCOM_G_G7;
  TKOSCOM_G_G7      = record                      // ü��+ȣ��(����)
    datagb          : Array [1.. 2] of Char;      //  �����ͱ��� G7
    pkgb            : Array [1.. 2] of Char;      //  ��������- O1:����
    mkgb            : Char;                       //  ���屸��- 4
                    
    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 4] of Char;      // ���� SEQ��ȣ
    currsign        : Char;                       // ���簡 ��ȣ    
    curr            : Array [1.. 7] of Char;      // ���簡
    cvol            : Array [1.. 6] of Char;      // ü�����
    chegb           : Array [1.. 2] of Char;      // 1)�ϹݸŸ�
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
    ctime           : Array [1.. 8] of Char;      // ü��ð�
    cyga            : Array [1.. 7] of Char;      // �ֱٿ��� ������������
    oyga            : Array [1.. 7] of Char;      // ������ ������������
    opensign        : Array [1.. 1] of Char;      // �ð���ȣ
    open            : Array [1.. 7] of Char;      // ��  ��
    highsign        : Array [1.. 1] of Char;      // ����ȣ                  X(01) 
    high            : Array [1.. 7] of Char;      // ��                      9(07) 
    lowsign         : Array [1.. 1] of Char;      // ������ȣ                  X(01) 
    low             : Array [1.. 7] of Char;      // ����                      9(07) 
    prevsign        : Array [1.. 1] of char;      // �������ݺ�ȣ              X(01)
    preprice        : Array [1.. 7] of Char;      // ��������
    volume          : Array [1.. 7] of Char;      // ���� ����    (����:���)
    value           : Array [1..15] of Char;      // ���� ���    (����:õ��)

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������
                    
    mshotot         : Array [1.. 7] of Char;   // �ż���ȣ���ܷ�       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // �ż��켱ȣ�� Sign
    mshoga          : Array [1.. 7] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // �ż�2���켱ȣ�� Sign
    mshoga1         : Array [1.. 7] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // �ż�3���켱ȣ�� Sign
    mshoga2         : Array [1.. 7] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // �ż�4���켱ȣ�� Sign
    mshoga3         : Array [1.. 7] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // �ż�5���켱ȣ�� Sign
    mshoga4         : Array [1.. 7] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // �ż�6���켱ȣ�� Sign
    mshoga5         : Array [1.. 7] of Char;      // �ż�6���켱ȣ��      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // �ż�6���켱ȣ������  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // �ż�7���켱ȣ�� Sign
    mshoga6         : Array [1.. 7] of Char;      // �ż�7���켱ȣ��      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // �ż�7���켱ȣ������  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // �ż�8���켱ȣ�� Sign
    mshoga7         : Array [1.. 7] of Char;      // �ż�8���켱ȣ��      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // �ż�8���켱ȣ������  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // �ż�9���켱ȣ�� Sign
    mshoga8         : Array [1.. 7] of Char;      // �ż�9���켱ȣ��      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // �ż�9���켱ȣ������  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // �ż�10���켱ȣ�� Sign
    mshoga9         : Array [1.. 7] of Char;      // �ż�10���켱ȣ��      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // �ż�10���켱ȣ������  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // �ŵ��켱ȣ�� Sign
    mdhoga          : Array [1.. 7] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // �ŵ�2���켱ȣ�� Sign
    mdhoga1         : Array [1.. 7] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // �ŵ�3���켱ȣ�� Sign
    mdhoga2         : Array [1.. 7] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // �ŵ�4���켱ȣ�� Sign
    mdhoga3         : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // �ŵ�5���켱ȣ�� Sign
    mdhoga4         : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // �ŵ�6���켱ȣ�� Sign
    mdhoga5         : Array [1.. 7] of Char;      // �ŵ�6���켱ȣ��      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // �ŵ�6���켱ȣ������  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // �ŵ�7���켱ȣ�� Sign
    mdhoga6         : Array [1.. 7] of Char;      // �ŵ�7���켱ȣ��      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // �ŵ�7���켱ȣ������  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // �ŵ�8���켱ȣ�� Sign
    mdhoga7         : Array [1.. 7] of Char;      // �ŵ�8���켱ȣ��      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // �ŵ�8���켱ȣ������  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // �ŵ�9���켱ȣ�� Sign
    mdhoga8         : Array [1.. 7] of Char;      // �ŵ�9���켱ȣ��      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // �ŵ�9���켱ȣ������  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // �ŵ�10���켱ȣ�� Sign
    mdhoga9         : Array [1.. 7] of Char;      // �ŵ�10���켱ȣ��      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // �ŵ�10���켱ȣ������  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
    ms6wunum        : Array [1.. 4] of Char;      // �ż� 6�켱 ȣ���Ǽ�
    ms7wunum        : Array [1.. 4] of Char;      // �ż� 7�켱 ȣ���Ǽ�
    ms8wunum        : Array [1.. 4] of Char;      // �ż� 8�켱 ȣ���Ǽ�
    ms9wunum        : Array [1.. 4] of Char;      // �ż� 9�켱 ȣ���Ǽ�
    ms10wunum       : Array [1.. 4] of Char;      // �ż� 10�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
    md6wunum        : Array [1.. 4] of Char;      // �ŵ� 6�켱 ȣ���Ǽ�
    md7wunum        : Array [1.. 4] of Char;      // �ŵ� 7�켱 ȣ���Ǽ�
    md8wunum        : Array [1.. 4] of Char;      // �ŵ� 8�켱 ȣ���Ǽ�
    md9wunum        : Array [1.. 4] of Char;      // �ŵ� 9�켱 ȣ���Ǽ�
    md10wunum       : Array [1.. 4] of Char;      // �ŵ� 10�켱 ȣ���Ǽ�

    etx             : Char                        // End of Text
  end;

  // A7015  // �ֽļ��� ����(�ü�)
  PKOSCOM_G_A7      = ^TKOSCOM_G_A7;
  TKOSCOM_G_A7      = record                      // ����(����)
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� A7
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4
                    
    jangtime        : Array [1.. 8] of Char;      // ���� ��ġ�ð�
    jggb            : Array [1.. 3] of Char;      // �������ڵ�
    underid         : Array [1..10] of Char;      // ��ǰID(�����ڻ�ID)
    jgcode          : Array [1..12] of Char;      // ���� �ڵ�
    jgseq           : Array [1.. 4] of Char;      // ���� SEQ��ȣ

    janggb          : Array [1.. 2] of Char;      // ����±����ڵ�
                                                  // *ȣ���� ó���� �����
                                                  //   00 : �ʱ�(�尳����)
                                                  //   10 : �ð����ϰ�
                                                  //   11 : �ð����ϰ�����
                                                  //   20 : ���ߴ��ϰ�
                                                  //   21 : ���ߴ��ϰ�����
                                                  //   30 : �������ϰ�
                                                  //   40 : ����
                                                  //   80 : �����Ÿ�ü��
                                                  //   90 : �ŷ�����
                                                  //   99 : ������

    hogagb          : Char;                       // ȣ������(0:ȣ������, 1:ȣ������)

    mshotot         : Array [1.. 7] of Char;   // �ż���ȣ���ܷ�       X(07) 
    mshogasign      : Array [1.. 1] of Char;      // �ż��켱ȣ�� Sign
    mshoga          : Array [1.. 7] of Char;      // �ż��켱ȣ��         : 9(4)V99
    mshoqty         : Array [1.. 6] of Char;      // �ż��켱ȣ������     : 9(6)
    mshogasign1     : Array [1.. 1] of Char;      // �ż�2���켱ȣ�� Sign
    mshoga1         : Array [1.. 7] of Char;      // �ż�2���켱ȣ��      : 9(4)V99
    mshoqty1        : Array [1.. 6] of Char;      // �ż�2���켱ȣ������  : 9(6)
    mshogasign2     : Array [1.. 1] of Char;      // �ż�3���켱ȣ�� Sign
    mshoga2         : Array [1.. 7] of Char;      // �ż�3���켱ȣ��      : 9(4)V99
    mshoqty2        : Array [1.. 6] of Char;      // �ż�3���켱ȣ������  : 9(6)
    mshogasign3     : Array [1.. 1] of Char;      // �ż�4���켱ȣ�� Sign
    mshoga3         : Array [1.. 7] of Char;      // �ż�4���켱ȣ��      : 9(4)V99
    mshoqty3        : Array [1.. 6] of Char;      // �ż�4���켱ȣ������  : 9(6)
    mshogasign4     : Array [1.. 1] of Char;      // �ż�5���켱ȣ�� Sign
    mshoga4         : Array [1.. 7] of Char;      // �ż�5���켱ȣ��      : 9(4)V99
    mshoqty4        : Array [1.. 6] of Char;      // �ż�5���켱ȣ������  : 9(6)
    mshogasign5     : Array [1.. 1] of Char;      // �ż�6���켱ȣ�� Sign
    mshoga5         : Array [1.. 7] of Char;      // �ż�6���켱ȣ��      : 9(4)V99
    mshoqty5        : Array [1.. 6] of Char;      // �ż�6���켱ȣ������  : 9(6)
    mshogasign6     : Array [1.. 1] of Char;      // �ż�7���켱ȣ�� Sign
    mshoga6         : Array [1.. 7] of Char;      // �ż�7���켱ȣ��      : 9(4)V99
    mshoqty6        : Array [1.. 6] of Char;      // �ż�7���켱ȣ������  : 9(6)
    mshogasign7     : Array [1.. 1] of Char;      // �ż�8���켱ȣ�� Sign
    mshoga7         : Array [1.. 7] of Char;      // �ż�8���켱ȣ��      : 9(4)V99
    mshoqty7        : Array [1.. 6] of Char;      // �ż�8���켱ȣ������  : 9(6)
    mshogasign8     : Array [1.. 1] of Char;      // �ż�9���켱ȣ�� Sign
    mshoga8         : Array [1.. 7] of Char;      // �ż�9���켱ȣ��      : 9(4)V99
    mshoqty8        : Array [1.. 6] of Char;      // �ż�9���켱ȣ������  : 9(6)
    mshogasign9     : Array [1.. 1] of Char;      // �ż�10���켱ȣ�� Sign
    mshoga9         : Array [1.. 7] of Char;      // �ż�10���켱ȣ��      : 9(4)V99
    mshoqty9        : Array [1.. 6] of Char;      // �ż�10���켱ȣ������  : 9(6)

    mdhotot         : Array [1.. 7] of Char;      // �ŵ���ȣ������       : 9(6)
    mdhogasign      : Array [1.. 1] of Char;      // �ŵ��켱ȣ�� Sign
    mdhoga          : Array [1.. 7] of Char;      // �ŵ��켱ȣ��         : 9(4)V99
    mdhoqty         : Array [1.. 6] of Char;      // �ŵ��켱ȣ������     : 9(6)
    mdhogasign1     : Array [1.. 1] of Char;      // �ŵ�2���켱ȣ�� Sign
    mdhoga1         : Array [1.. 7] of Char;      // �ŵ�2���켱ȣ��      : 9(4)V99
    mdhoqty1        : Array [1.. 6] of Char;      // �ŵ�2���켱ȣ������  : 9(6)
    mdhogasign2     : Array [1.. 1] of Char;      // �ŵ�3���켱ȣ�� Sign
    mdhoga2         : Array [1.. 7] of Char;      // �ŵ�3���켱ȣ��      : 9(4)V99
    mdhoqty2        : Array [1.. 6] of Char;      // �ŵ�3���켱ȣ������  : 9(6)
    mdhogasign3     : Array [1.. 1] of Char;      // �ŵ�4���켱ȣ�� Sign
    mdhoga3         : Array [1.. 7] of Char;      // �ŵ�4���켱ȣ��      : 9(4)V99
    mdhoqty3        : Array [1.. 6] of Char;      // �ŵ�4���켱ȣ������  : 9(6)
    mdhogasign4     : Array [1.. 1] of Char;      // �ŵ�5���켱ȣ�� Sign
    mdhoga4         : Array [1.. 7] of Char;      // �ŵ�5���켱ȣ��      : 9(4)V99
    mdhoqty4        : Array [1.. 6] of Char;      // �ŵ�5���켱ȣ������  : 9(6)
    mdhogasign5     : Array [1.. 1] of Char;      // �ŵ�6���켱ȣ�� Sign
    mdhoga5         : Array [1.. 7] of Char;      // �ŵ�6���켱ȣ��      : 9(4)V99
    mdhoqty5        : Array [1.. 6] of Char;      // �ŵ�6���켱ȣ������  : 9(6)
    mdhogasign6     : Array [1.. 1] of Char;      // �ŵ�7���켱ȣ�� Sign
    mdhoga6         : Array [1.. 7] of Char;      // �ŵ�7���켱ȣ��      : 9(4)V99
    mdhoqty6        : Array [1.. 6] of Char;      // �ŵ�7���켱ȣ������  : 9(6)
    mdhogasign7     : Array [1.. 1] of Char;      // �ŵ�8���켱ȣ�� Sign
    mdhoga7         : Array [1.. 7] of Char;      // �ŵ�8���켱ȣ��      : 9(4)V99
    mdhoqty7        : Array [1.. 6] of Char;      // �ŵ�8���켱ȣ������  : 9(6)
    mdhogasign8     : Array [1.. 1] of Char;      // �ŵ�9���켱ȣ�� Sign
    mdhoga8         : Array [1.. 7] of Char;      // �ŵ�9���켱ȣ��      : 9(4)V99
    mdhoqty8        : Array [1.. 6] of Char;      // �ŵ�9���켱ȣ������  : 9(6)
    mdhogasign9     : Array [1.. 1] of Char;      // �ŵ�10���켱ȣ�� Sign
    mdhoga9         : Array [1.. 7] of Char;      // �ŵ�10���켱ȣ��      : 9(4)V99
    mdhoqty9        : Array [1.. 6] of Char;      // �ŵ�10���켱ȣ������  : 9(6)
                                      
    mstothonum      : Array [1.. 5] of Char;      // �ż� ��ȿ ȣ���Ǽ�
    ms1wunum        : Array [1.. 4] of Char;      // �ż� 1�켱 ȣ���Ǽ�
    ms2wunum        : Array [1.. 4] of Char;      // �ż� 2�켱 ȣ���Ǽ�
    ms3wunum        : Array [1.. 4] of Char;      // �ż� 3�켱 ȣ���Ǽ�
    ms4wunum        : Array [1.. 4] of Char;      // �ż� 4�켱 ȣ���Ǽ�
    ms5wunum        : Array [1.. 4] of Char;      // �ż� 5�켱 ȣ���Ǽ�
    ms6wunum        : Array [1.. 4] of Char;      // �ż� 6�켱 ȣ���Ǽ�
    ms7wunum        : Array [1.. 4] of Char;      // �ż� 7�켱 ȣ���Ǽ�
    ms8wunum        : Array [1.. 4] of Char;      // �ż� 8�켱 ȣ���Ǽ�
    ms9wunum        : Array [1.. 4] of Char;      // �ż� 9�켱 ȣ���Ǽ�
    ms10wunum       : Array [1.. 4] of Char;      // �ż� 10�켱 ȣ���Ǽ�
                    
    mdtothonum      : Array [1.. 5] of Char;      // �ŵ� ��ȿ ȣ���Ǽ�
    md1wunum        : Array [1.. 4] of Char;      // �ŵ� 1�켱 ȣ���Ǽ�
    md2wunum        : Array [1.. 4] of Char;      // �ŵ� 2�켱 ȣ���Ǽ�
    md3wunum        : Array [1.. 4] of Char;      // �ŵ� 3�켱 ȣ���Ǽ�
    md4wunum        : Array [1.. 4] of Char;      // �ŵ� 4�켱 ȣ���Ǽ�
    md5wunum        : Array [1.. 4] of Char;      // �ŵ� 5�켱 ȣ���Ǽ�
    md6wunum        : Array [1.. 4] of Char;      // �ŵ� 6�켱 ȣ���Ǽ�
    md7wunum        : Array [1.. 4] of Char;      // �ŵ� 7�켱 ȣ���Ǽ�
    md8wunum        : Array [1.. 4] of Char;      // �ŵ� 8�켱 ȣ���Ǽ�
    md9wunum        : Array [1.. 4] of Char;      // �ŵ� 9�켱 ȣ���Ǽ�
    md10wunum       : Array [1.. 4] of Char;      // �ŵ� 10�켱 ȣ���Ǽ�

    etx             : Char                        // End of Text
  end;

  // H2014  // �ֽļ��� �̰�������
  PKOSCOM_G_H2      = ^TKOSCOM_G_H2;
  TKOSCOM_G_H2      = record
    datagb          : Array [1.. 2] of Char;      // �����ͱ��� H2
    pkgb            : Array [1.. 2] of Char;      // ��������- O1:����
    mkgb            : Char;                       // ���屸��- 4

    isu_cd          : Array [1..12] of Char;      // ���� �ڵ�
    seq             : Array [1.. 4] of Char;      // ���� SEQ��ȣ

    gb              : Array [1.. 2] of Char;      // �̰�����������
                                                  //  ���� Ȯ�� : "M0" (07:30�а� ����)
                                                  //  ���� ���� : "M1" (���� Ư���������� �������� �۽�, 10��)
                                                  //  ���� Ȯ�� : "M2" (���� ������ �۽�, ������ 1�ð��� ����)

    date            : Array [1.. 8] of Char;      // �ŷ�����
    mgjv            : Array [1.. 9] of Char;      // �̰���ü�����

    etx             : Char                        // End of Text
  end;

  // A3016 ��ǰ ���� ü��
  PKOSCOM_M_A3      = ^TKOSCOM_M_A3;
  TKOSCOM_M_A3      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A3'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  9] of Char;       // ���簡                    -9(06)V99
    cvol            : Array [1..  6] of Char;       // ü�����                      9(06)
    ctype           : Array [1..  2] of Char;       // ü�������ڵ�                  X(02)
                                                    // 10 : �ð����ϰ�            
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    ctime           : Array [1..  8] of Char;       // ü��ð�                      X(08)
    cyga            : Array [1..  8] of Char;       // �ֱٿ���������������       9(06)V99
    oyga            : Array [1..  8] of Char;       // ������������������         9(06)V99
    open            : Array [1..  9] of Char;       // �ð�                      -9(06)V99
    high            : Array [1..  9] of Char;       // ��                      -9(06)V99
    low             : Array [1..  9] of Char;       // ����                      -9(06)V99
    prev            : Array [1..  9] of Char;       // ��������                  -9(06)V99
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP ����ü�����              X(07)
    filler          : Char;                         //                            
  end;

  // A6016 ��ǰ ���� ���񸶰�
  PKOSCOM_M_A6      = ^TKOSCOM_M_A6;
  TKOSCOM_M_A6      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A6'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  9] of Char;       // ����                      -9(06)V99
    curr_gb         : Char;                         // ���������ڵ�                  X(01)
                                                    // 1 : ü�ᰡ��               
                                                    // 2 : �⼼                   
                                                    // 3 : �ŷ���                 
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP ����ü�����              X(07)
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

  // A6017 ��ǰ ���� ��
  PKOSCOM_M_A7      = ^TKOSCOM_M_A7;
  TKOSCOM_M_A7      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A7'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
    mktgb           : Char;                         // ���屸��                        '6'
    ctime           : Array [1..  8] of Char;       // ����ġ�ð�('0' set)       X(08)
    jang_gb         : Array [1..  3] of Char;       // �� �����ڵ�               X(03)
    drvtv_class     : Array [1.. 10] of Char;       // ��ǰID                        X(10)
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
                                                    // 90 : �ŷ�����              
                                                    // 99 : ������                
    hoga_exist      : Char;                         // ȣ������                      X(01)
                                                    // 0 : ȣ������               
                                                    // 1 : ȣ������               
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

  // B6016 ��ǰ ���� ȣ��
  PKOSCOM_M_B6      = ^TKOSCOM_M_B6;
  TKOSCOM_M_B6      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'B6'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    time            : Array [1..  8] of Char;       // ȣ�������ð�                  X(08)
    filler          : Char;                         //                            
  end;

  // G7016 ��ǰ ���� ü��+�켱ȣ��
  PKOSCOM_M_G7      = ^TKOSCOM_M_G7;
  TKOSCOM_M_G7      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'G7'
    pkgb            : Array [1..  2] of Char;       // ��������                       '01'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  9] of Char;       // ���簡                    -9(06)V99
    cvol            : Array [1..  6] of Char;       // ü����� (�Ǻ�)               9(06)
    ctype           : Array [1..  2] of Char;       // ü�������ڵ�                  X(02)
                                                    // 10: �ð� ���ϰ�            
                                                    // 11: �ð� ���ϰ� ����       
                                                    // 20: ���� ���ϰ�            
                                                    // 21: ���� ���ϰ� ����       
                                                    // 30: ���� ���ϰ�            
                                                    // 40: ����                   
                                                    // 80: �����Ÿ�ü��           
    ctime           : Array [1..  8] of Char;       // ü��ð�                      X(08)
    cyga            : Array [1..  8] of Char;       // �ֱٿ���������������       9(06)V99
    oyga            : Array [1..  8] of Char;       // ������������������         9(06)V99
    open            : Array [1..  9] of Char;       // �ð�                      -9(06)V99
    high            : Array [1..  9] of Char;       // ��                      -9(06)V99
    low             : Array [1..  9] of Char;       // ����                      -9(06)V99
    prev            : Array [1..  9] of Char;       // ��������                  -9(06)V99
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    efp_concheqty   : Array [1..  7] of Char;       // EFP ����ü�����              X(07)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    svol            : Array [1..  6] of Char;       // �ż� ��ȣ���ܷ�               X(06)
    shoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ� ȣ��         
    dvol            : Array [1..  6] of Char;       // �ŵ� ��ȣ���ܷ�               X(06)
    dhoga0_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  9] of Char;       // ȣ��       -9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ� ȣ��         
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

  // A3026 ��ǰ �ɼ� ü��
  PKOSCOM_N_A3      = ^TKOSCOM_N_A3;
  TKOSCOM_N_A3      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A3'
    pkgb            : Array [1..  2] of Char;       // ��������                       '02'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  8] of Char;       // ���簡                     9(06)V99
    cvol            : Array [1..  6] of Char;       // ü�����                      9(06)
    ctype           : Array [1..  2] of Char;       // ü�������ڵ�                  X(02)
                                                    // 10 : �ð����ϰ�            
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    ctime           : Array [1..  8] of Char;       // ü��ð�                      X(08)
    open            : Array [1..  8] of Char;       // �ð�                       9(06)V99
    high            : Array [1..  8] of Char;       // ��                       9(06)V99
    low             : Array [1..  8] of Char;       // ����                       9(06)V99
    prev            : Array [1..  8] of Char;       // ��������                   9(06)V99
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    filler          : Char;                         //                            
  end;

  // A6026 ��ǰ �ɼ� ���񸶰�
  PKOSCOM_N_A6      = ^TKOSCOM_N_A6;
  TKOSCOM_N_A6      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A6'
    pkgb            : Array [1..  2] of Char;       // ��������                       '02'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  8] of Char;       // ����                       9(06)V99
    curr_gb         : Char;                         // ���������ڵ�                  X(01)
                                                    // 1 : ü�ᰡ��               
                                                    // 2 : �⼼                   
                                                    // 3 : �ŷ���                 
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

  // A7026 ��ǰ �ɼ� ��
  PKOSCOM_N_A7      = ^TKOSCOM_N_A7;
  TKOSCOM_N_A7      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'A7'
    pkgb            : Array [1..  2] of Char;       // ��������                       '02'
    mktgb           : Char;                         // ���屸��                        '6'
    ctime           : Array [1..  8] of Char;       // ����ġ�ð�('0' set)       X(08)
    jang_gb         : Array [1..  3] of Char;       // �� �����ڵ�               X(03)
    drvtv_class     : Array [1.. 10] of Char;       // ��ǰID                        X(10)
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
                                                    // 90 : �ŷ�����              
                                                    // 99 : ������                
    hoga_exist      : Char;                         // ȣ������                      X(01)
                                                    // 0 : ȣ������               
                                                    // 1 : ȣ������               
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

  // B6026 ��ǰ �ɼ� ȣ��
  PKOSCOM_N_B6      = ^TKOSCOM_N_B6;
  TKOSCOM_N_B6      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'B6'
    pkgb            : Array [1..  2] of Char;       // ��������                       '02'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    svol            : Array [1..  6] of Char;       // �ż���ȣ���ܷ�                X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ�ȣ��          
    dvol            : Array [1..  6] of Char;       // �ŵ���ȣ���ܷ�                X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ�ȣ��          
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    time            : Array [1..  8] of Char;       // ȣ�������ð�                  X(08)
    filler          : Char;                         //                            
  end;

  // G7026 ��ǰ �ɼ� ü��+�켱ȣ��
  PKOSCOM_N_G7      = ^TKOSCOM_N_G7;    
  TKOSCOM_N_G7      = record
    datagb          : Array [1..  2] of Char;       // �����ͱ���                     'G7'
    pkgb            : Array [1..  2] of Char;       // ��������                       '02'
    mktgb           : Char;                         // ���屸��                        '6'
    isu_cd          : Array [1.. 12] of Char;       // ���� �ڵ�                     X(12)
    seqn            : Array [1..  3] of Char;       // ���� SEQ��ȣ                  9(03)
    curr            : Array [1..  8] of Char;       // ���簡                     9(06)V99
    cvol            : Array [1..  6] of Char;       // ü����� (�Ǻ�)               9(06)
    ctype           : Array [1..  2] of Char;       // ü�������ڵ�                  X(02)
                                                    // 10: �ð� ���ϰ�            
                                                    // 11: �ð� ���ϰ� ����       
                                                    // 20: ���� ���ϰ�            
                                                    // 21: ���� ���ϰ� ����       
                                                    // 30: ���� ���ϰ�            
                                                    // 40: ����                   
                                                    // 80: �����Ÿ�ü��           
    ctime           : Array [1..  8] of Char;       // ü��ð�                      X(08)
    open            : Array [1..  8] of Char;       // �ð�                       9(06)V99
    high            : Array [1..  8] of Char;       // ��                       9(06)V99
    low             : Array [1..  8] of Char;       // ����                       9(06)V99
    prev            : Array [1..  8] of Char;       // ��������                   9(06)V99
    volume          : Array [1..  7] of Char;       // ����ü����� (����:���)      9(07)
    value           : Array [1.. 15] of Char;       // ����ü���� (����:õ��)      9(15)
    concheqty       : Array [1..  7] of Char;       // ���Ǵ뷮����ü�����          X(07)
    mkt_stat        : Array [1..  2] of Char;       // ����±����ڵ�                X(02)
                                                    // 00 : �ʱ�(�尳����)        
                                                    // 01 : �ð����ϰ�            
                                                    // 11 : �ð����ϰ�����        
                                                    // 20 : ���ߴ��ϰ�            
                                                    // 21 : ���ߴ��ϰ�����        
                                                    // 30 : �������ϰ�            
                                                    // 40 : ����                  
    svol            : Array [1..  6] of Char;       // �ż� ��ȣ���ܷ�               X(06)
    shoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    shoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    shoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ż� 1~5 �ܰ� ȣ��         
    dvol            : Array [1..  6] of Char;       // �ŵ� ��ȣ���ܷ�               X(06)
    dhoga0_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga0_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga1_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga1_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga2_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga2_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga3_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga3_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
    dhoga4_hoga     : Array [1..  8] of Char;       // ȣ��        9(06)V99       
    dhoga4_vol      : Array [1..  6] of Char;       // ȣ������       9(06)       
                                                    // �ŵ� 1~5 �ܰ� ȣ��         
    scnt            : Array [1..  5] of Char;       // �ż���ȿȣ���Ǽ�              9(05)
    shoga0_cnt      : Array [1..  4] of Char;       // �ż� 1 �ܰ� ȣ���Ǽ�
    shoga1_cnt      : Array [1..  4] of Char;       // �ż� 2 �ܰ� ȣ���Ǽ�
    shoga2_cnt      : Array [1..  4] of Char;       // �ż� 3 �ܰ� ȣ���Ǽ�
    shoga3_cnt      : Array [1..  4] of Char;       // �ż� 4 �ܰ� ȣ���Ǽ�
    shoga4_cnt      : Array [1..  4] of Char;       // �ż� 5 �ܰ� ȣ���Ǽ�
    dcnt            : Array [1..  5] of Char;       // �ŵ���ȿȣ���Ǽ�              9(05)
    dhoga0_cnt      : Array [1..  4] of Char;       // �ŵ� 1 �ܰ� ȣ���Ǽ�
    dhoga1_cnt      : Array [1..  4] of Char;       // �ŵ� 2 �ܰ� ȣ���Ǽ�
    dhoga2_cnt      : Array [1..  4] of Char;       // �ŵ� 3 �ܰ� ȣ���Ǽ�
    dhoga3_cnt      : Array [1..  4] of Char;       // �ŵ� 4 �ܰ� ȣ���Ǽ�
    dhoga4_cnt      : Array [1..  4] of Char;       // �ŵ� 5 �ܰ� ȣ���Ǽ�
    filler          : Char;                         //
  end;

implementation

end.
