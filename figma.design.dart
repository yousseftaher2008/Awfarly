import 'package:flutter/material.dart';

String url = "";

class FigmaDesign extends StatelessWidget {
  const FigmaDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // K8B (101:625)
      width: double.infinity,
      height: 926,
      decoration: const BoxDecoration(
        color: Color(0xfff8f8f8),
      ),
      child: Stack(
        children: [
          Positioned(
            // autogrouphhrhzEK (VtDNYsTLYYs4QBowNHHhRh)
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 13, 14, 24),
              width: 428,
              height: 166,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1, 0),
                  end: Alignment(-1.15, -1.986),
                  colors: <Color>[
                    Color(0xff073d63),
                    Color(0xff0a436a),
                    Color(0xff0f4c76),
                    Color(0xff1b608f),
                    Color(0xff3f9dde),
                    Color(0xff3f9dde),
                    Color(0xff3f9dde)
                  ],
                  stops: <double>[0, 0.225, 0.393, 0.547, 0.785, 0.875, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // statusbarj5R (101:673)
                    margin: const EdgeInsets.fromLTRB(3.5, 0, 0, 16),
                    width: double.infinity,
                    height: 19,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // time3bu (I101:673;101:757)
                          margin: const EdgeInsets.fromLTRB(0, 0, 292.84, 0),
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.3000000119,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // righticonsK3d (I101:673;2031:3542)
                          margin: const EdgeInsets.fromLTRB(0, 3.33, 0, 4.33),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // cellularconnection3EX (I101:673;101:751)
                                margin:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 0.67),
                                width: 17,
                                height: 10.67,
                                child: Image.network(
                                  url,
                                  width: 17,
                                  height: 10.67,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                // wifiwKu (I101:673;101:747)
                                margin:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 0.33),
                                width: 15.33,
                                height: 11,
                                child: Image.network(
                                  url,
                                  width: 15.33,
                                  height: 11,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                // batteryrBy (I101:673;101:743)
                                width: 24.33,
                                height: 11.33,
                                child: Image.network(
                                  url,
                                  width: 24.33,
                                  height: 11.33,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupamgtmJw (VtDNknHA8AqgFDz6P6AmgT)
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 24),
                    width: double.infinity,
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group788gwh (101:666)
                          margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // scanbarcodeECX (101:672)
                                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                width: 24,
                                height: 24,
                                child: Image.network(
                                  url,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              Container(
                                // group575YU7 (101:667)
                                padding:
                                    const EdgeInsets.fromLTRB(12, 13, 12, 13),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // microphone23fm (101:669)
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 120.5, 0),
                                      width: 22,
                                      height: 22,
                                      child: Image.network(
                                        url,
                                        width: 22,
                                        height: 22,
                                      ),
                                    ),
                                    Container(
                                      // AEb (101:671)
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 8.5, 0),
                                      child: Text(
                                        'ابحث على ما تريد',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Almarai',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.4079999924,
                                          color: const Color(0xff7e828e),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      // searchstatusTUb (101:670)
                                      width: 22,
                                      height: 22,
                                      child: Image.network(
                                        url,
                                        width: 22,
                                        height: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group454b51 (101:655)
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          width: 40,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // frameK11 (101:657)
                                left: 6.7615356445,
                                top: 11.6684265137,
                                child: Align(
                                  child: SizedBox(
                                    width: 26.48,
                                    height: 23.33,
                                    child: Image.network(
                                      url,
                                      width: 26.48,
                                      height: 23.33,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // profilepictureofblondewomaninb (101:659)
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.network(
                                      url,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group10174Vpb (101:660)
                    margin: const EdgeInsets.fromLTRB(201, 0, 10, 0),
                    width: double.infinity,
                    height: 22,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group789dfu (101:662)
                          margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // ab9 (101:663)
                                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  '1 منتج',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xfff8f8f8),
                                  ),
                                ),
                              ),
                              Text(
                                // gPH (101:664)
                                'عربة التسوق :',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.4079999924,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // shoppingcart1gT (101:661)
                          width: 22,
                          height: 22,
                          child: Image.network(
                            url,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // autogroupiq959nf (VtDQ1L2cHrhG2pKmU1iQ95)
            left: 0,
            top: 166,
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 82),
              width: 428,
              height: 760,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // autogroup4krurh5 (VtDPSRomCbgcfjwPp64kRu)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    width: double.infinity,
                    height: 115,
                    child: Stack(
                      children: [
                        Positioned(
                          // nKq (101:627)
                          left: 301,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 95,
                              height: 22,
                              child: Text(
                                'أضف منتج جديد',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.4079999924,
                                  color: const Color(0xff46a0df),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle485UCf (101:628)
                          left: 0,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 412,
                              height: 115,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  // border:  Border.all(colorScheme.background const Color(0xffdddddd)),
                                  color: const Color(0xffffffff),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle486jPV (101:629)
                          left: 1,
                          top: 42,
                          child: Align(
                            child: SizedBox(
                              width: 5,
                              height: 39,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff9fceef),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group664vTy (101:631)
                          left: 148.5,
                          top: 16,
                          child: SizedBox(
                            width: 171,
                            height: 83,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // SBR (101:636)
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 13),
                                  width: double.infinity,
                                  child: Text(
                                    'أرز بسمتي ذهبي من الباشا...',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Almarai',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.4079999924,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // Lnb (101:637)
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 1.5, 2),
                                  child: Text(
                                    'السعر يتراوح بين',
                                    textAlign: TextAlign.right,
                                    style: SafeGoogleFont(
                                      'Almarai',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: -0.4079999924,
                                      color: const Color(0xff7e828e),
                                    ),
                                  ),
                                ),
                                Container(
                                  // group595Sqd (101:632)
                                  margin:
                                      const EdgeInsets.fromLTRB(62.5, 0, 0, 0),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // BoD (101:635)
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 2, 4.5, 0),
                                        child: Text(
                                          'ر.س',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Almarai',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.4079999924,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // uUK (101:634)
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: Text(
                                          '20.00 - 26.00',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Almarai',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.4079999924,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // frame1000001912q75 (101:638)
                          left: 24,
                          top: 20,
                          child: Align(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.network(
                                url,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group663wvo (101:640)
                          left: 24,
                          top: 69,
                          child: SizedBox(
                            width: 103,
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  // group619gtP (101:647)
                                  width: 30,
                                  height: 30,
                                  child: Image.network(
                                    url,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Container(
                                  // autogroupdkdrRb5 (VtDPoqMm8Xo49qsk4vdKdR)
                                  padding:
                                      const EdgeInsets.fromLTRB(18.5, 0, 0, 0),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // ZhH (101:642)
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 18.5, 0),
                                        child: Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Almarai',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            // height:  1.2222222222,
                                            letterSpacing: -0.4079999924,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // group618HdH (101:643)
                                        width: 30,
                                        height: 30,
                                        child: Image.network(
                                          url,
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // group662E2j (101:651)
                          left: 320,
                          top: 14,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(18, 11, 16, 11),
                            width: 83,
                            height: 87,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              // rectangle469uuZ (101:654)
                              child: SizedBox(
                                width: 49,
                                height: 65,
                                child: Image.network(
                                  url,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // 41m (101:630)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 469),
                    width: double.infinity,
                    child: Text(
                      'أضف منتج جديد',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Almarai',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.4079999924,
                        color: const Color(0xff46a0df),
                      ),
                    ),
                  ),
                  Container(
                    // group625NHM (101:665)
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xff3f9dde),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'عرض افضل فاتورة',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Almarai',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4079999924,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // frame1000001828EKZ (101:674)
            left: 0,
            top: 848,
            child: SizedBox(
              width: 428,
              height: 78,
              child: Stack(
                children: [
                  Positioned(
                    // group592ZMq (I101:674;791:5318)
                    left: 0,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 10, 25, 10),
                      width: 428,
                      height: 66,
                      decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group500anj (I101:674;791:5323)
                            margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group470uq1 (I101:674;791:5325)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 2),
                                  width: 22,
                                  height: 22,
                                  child: Image.network(
                                    url,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  // E6b (I101:674;791:5324)
                                  'المفضلة',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xff7e828e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // group499mMR (I101:674;791:5327)
                            margin: const EdgeInsets.fromLTRB(0, 0, 29, 0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // cardposJMM (I101:674;791:5329)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  width: 22,
                                  height: 22,
                                  child: Image.network(
                                    url,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  // 22T (I101:674;791:5328)
                                  'محفظتى',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xff7e828e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // group591Loq (I101:674;791:5330)
                            margin: const EdgeInsets.fromLTRB(0, 0, 36.5, 0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // shoppingcartHDH (I101:674;791:5331)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 2),
                                  width: 22,
                                  height: 22,
                                  child: Image.network(
                                    url,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  // PXD (I101:674;791:5332)
                                  'عربة التسوق',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xff3f9dde),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // group101667TD (I101:674;791:5513)
                            margin: const EdgeInsets.fromLTRB(0, 0, 25.5, 0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // shoppingbagFZR (I101:674;791:5514)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  width: 22,
                                  height: 22,
                                  child: Image.network(
                                    url,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  // aLo (I101:674;791:5516)
                                  'مشترياتى',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xff7e828e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            // group769WET (I101:674;791:5333)
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // home415 (I101:674;791:5335)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 2),
                                  width: 22,
                                  height: 22,
                                  child: Image.network(
                                    url,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  // yNw (I101:674;791:5334)
                                  'الرئيسية',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4079999924,
                                    color: const Color(0xff7e828e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // group5906yM (I101:674;791:5336)
                    left: 217,
                    top: 0,
                    child: Container(
                      width: 37,
                      height: 36,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            url,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Almarai',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.4079999924,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group593mJo (I101:674;791:5339)
                    left: 51,
                    top: 12,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xfff0bf41),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Almarai',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.4079999924,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeGoogleFont(String s,
      {required int fontSize,
      required FontWeight fontWeight,
      required double letterSpacing,
      required Color color}) {}
}
