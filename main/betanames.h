/**** CBM nederland  Harold Oudshoorn ****/
UWORD chip beta_name [] = {
	0x7f00,0x0000,0x0000,0x0000,0x3800,0x0000,0x0071,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x0071,0xc000,0x0000,0xe038,0x03fc,0x0000,0xe001,0xc000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe380,0x0000,0x0000,0x0000,0x3800,0x0000,0x0079,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x0071,0xc000,0x0000,0xe038,0x070e,0x0000,0xe001,0xc000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe00f,0xc7ff,0x8fff,0x0fc3,0xf8fc,0x7e3f,0x007d,0xc7e1,0xfc7e,0x3f38,0xfc7f,0x0fe0,0x0071,0xc7e3,0xf1f8,0xe3f8,0x070e,0x738f,0xe3f9,0xfc3f,0x0fc7,0xe7f0,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x7073,0x807f,0xce73,0x9ce7,0x3838,0x0e73,0x9ce0,0x007f,0xc073,0x839c,0xe738,0x070e,0x739c,0xe701,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x707f,0x8077,0xcff3,0x9cff,0x3838,0xfe73,0x9ce0,0x0071,0xc7f3,0x839c,0xe738,0x070e,0x739c,0xe3f1,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0xe39c,0xe739,0xce73,0x9ce7,0x39ce,0x7070,0x0073,0xce03,0x9ce0,0x3839,0xce73,0x9ce0,0x0071,0xce73,0x839c,0xe738,0x070e,0x739c,0xe039,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0x7f0f,0xc739,0xce73,0x8fc3,0xf8fc,0x703f,0x0071,0xc7e1,0xfc7e,0x3838,0xfe73,0x8fe0,0x0071,0xc7f3,0x81f8,0xe3f8,0x03fc,0x3f8f,0xe7f1,0xce3f,0x0fc7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

#if 0
/**** Seppo virtanen ****/
UWORD chip beta_name [] = {	
	0xfe3f,0x87f8,0x7f1f,0xe381,0xce39,0xfe00,0xff00,0x0000,0x01e3,0xc000,0x00fc,0x0000,0x0000,0x0001,0xc738,0x00e0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe739,0xce1c,0xe39c,0x7381,0xcf39,0xc001,0xc380,0x0000,0x01f7,0xc000,0x01ce,0x0000,0x0000,0x0001,0xc700,0x00e0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe739,0xce1c,0xe39c,0x7381,0xcfb9,0xc001,0xc39c,0xe000,0x01ff,0xcfc0,0x01e0,0x3f1f,0xc7f0,0xfc01,0xc739,0xf9f8,0xfc7f,0x0fc7,0xf000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xfe3f,0x8e1c,0xff9c,0x7381,0xcff9,0xfe01,0xc39c,0xe000,0x01dd,0xce00,0x007c,0x739c,0xe739,0xce01,0xc739,0xc0e0,0x0e73,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe739,0xce1c,0xe39c,0x7381,0xcef9,0xc001,0xc39c,0xe000,0x01c1,0xce00,0x000e,0x7f9c,0xe739,0xce01,0xc739,0xc0e0,0xfe73,0x9fe7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe739,0xce1c,0xe39c,0x7381,0xce79,0xc001,0xc38f,0xe000,0x01c1,0xce0e,0x01ce,0x701f,0xc7f1,0xce01,0xce39,0xc0e1,0xce73,0x9c07,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xfe39,0xc7f8,0xe39f,0xe3f9,0xce39,0xfe00,0xff00,0xe000,0x01c1,0xce0e,0x00fc,0x3f1c,0x0700,0xfc01,0xfc39,0xc078,0xfe73,0x8fc7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x000f,0xc000,0x0000,0x0000,0x0000,0x001c,0x0700,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** CBM nederland DEMO ****/
UWORD chip beta_name [] = {
	0x7f00,0x0000,0x0000,0x0000,0x3800,0x0000,0x0071,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x007f,0x8ff3,0xc78f,0xf007,0x1cff,0x3f87,0xe38f,0xf1c7,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe380,0x0000,0x0000,0x0000,0x3800,0x0000,0x0079,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x0071,0xce03,0xef9c,0x3807,0x1ce0,0x39ce,0x739c,0x39e7,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe00f,0xc7ff,0x8fff,0x0fc3,0xf8fc,0x7e3f,0x007d,0xc7e1,0xfc7e,0x3f38,0xfc7f,0x0fe0,0x0071,0xce03,0xff9c,0x3807,0x1ce0,0x39cf,0x039c,0x39f7,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x7073,0x807f,0xce73,0x9ce7,0x3838,0x0e73,0x9ce0,0x0071,0xcff3,0xbb9c,0x3807,0x1cff,0x3f83,0xe39c,0x39ff,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x707f,0x8077,0xcff3,0x9cff,0x3838,0xfe73,0x9ce0,0x0071,0xce03,0x839c,0x3807,0x1ce0,0x39c0,0x739c,0x39df,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe39c,0xe739,0xce73,0x9ce7,0x39ce,0x7070,0x0073,0xce03,0x9ce0,0x3839,0xce73,0x9ce0,0x0071,0xce03,0x839c,0x3807,0x38e0,0x39ce,0x739c,0x39cf,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7f0f,0xc739,0xce73,0x8fc3,0xf8fc,0x703f,0x0071,0xc7e1,0xfc7e,0x3838,0xfe73,0x8fe0,0x007f,0x8ff3,0x838f,0xf007,0xf0ff,0x39c7,0xe38f,0xf1c7,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** CBM nederland  Harold Oudshoorn ****/
UWORD chip beta_name [] = {
	0x7f00,0x0000,0x0000,0x0000,0x3800,0x0000,0x0071,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x0071,0xc000,0x0000,0xe038,0x03fc,0x0000,0xe001,0xc000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe380,0x0000,0x0000,0x0000,0x3800,0x0000,0x0079,0xc000,0x1c00,0x0038,0x0000,0x00e0,0x0071,0xc000,0x0000,0xe038,0x070e,0x0000,0xe001,0xc000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe00f,0xc7ff,0x8fff,0x0fc3,0xf8fc,0x7e3f,0x007d,0xc7e1,0xfc7e,0x3f38,0xfc7f,0x0fe0,0x0071,0xc7e3,0xf1f8,0xe3f8,0x070e,0x738f,0xe3f9,0xfc3f,0x0fc7,0xe7f0,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x7073,0x807f,0xce73,0x9ce7,0x3838,0x0e73,0x9ce0,0x007f,0xc073,0x839c,0xe738,0x070e,0x739c,0xe701,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe739,0xce73,0x9ce7,0x39ce,0x707f,0x8077,0xcff3,0x9cff,0x3838,0xfe73,0x9ce0,0x0071,0xc7f3,0x839c,0xe738,0x070e,0x739c,0xe3f1,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0xe39c,0xe739,0xce73,0x9ce7,0x39ce,0x7070,0x0073,0xce03,0x9ce0,0x3839,0xce73,0x9ce0,0x0071,0xce73,0x839c,0xe738,0x070e,0x739c,0xe039,0xce73,0x9ce7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0x7f0f,0xc739,0xce73,0x8fc3,0xf8fc,0x703f,0x0071,0xc7e1,0xfc7e,0x3838,0xfe73,0x8fe0,0x0071,0xc7f3,0x81f8,0xe3f8,0x03fc,0x3f8f,0xe7f1,0xce3f,0x0fc7,0x0738,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Chris ****/
UWORD chip beta_name [] = {	
	0x7f1c,0x0007,0x0000,0x3f80,0x0380,0x0000,0x0000,0x0001,0xfc00,0x0000,0x0000,0x01c0,0x0000,0x038e,0x701c,0x0000,0x001f,0x8003,0x8003,0x8700,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe39c,0x0000,0x0000,0x39c0,0x0380,0x0000,0x0000,0x0003,0x8e00,0x0000,0x0000,0x01c0,0x0000,0x038e,0x001c,0x0000,0x0039,0xc003,0x8003,0x8000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe01f,0xc7e7,0x1fc0,0x39c7,0xe39f,0xfe1f,0x8fc0,0x0003,0x803f,0x1ffe,0x3f8e,0x73f1,0xf8fc,0x038e,0x71fc,0x7e1f,0x803c,0x07e3,0x9ce7,0xe71f,0x8fe1,0xfc00,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe707,0x3800,0x3f80,0x739c,0xe739,0xce00,0x0003,0x8073,0x9ce7,0x39ce,0x71c3,0x9ce0,0x038e,0x739c,0xe739,0xc00f,0x8e73,0x9ce3,0x8739,0xce73,0x8000,0x0000,0x0000,0x0000,0x0000,
	0xe01c,0xe707,0x1f80,0x3807,0xf39c,0xe73f,0xce00,0x0003,0x8073,0x9ce7,0x39ce,0x71c3,0xfce0,0x038e,0x739c,0xff39,0xc001,0xce73,0x9ce3,0x8739,0xce71,0xf800,0x0000,0x0000,0x0000,0x0000,
	0xe39c,0xe707,0x01c0,0x380e,0x739c,0xe738,0x0e00,0x0003,0x8e73,0x9ce7,0x3f8e,0x71c3,0x80e0,0x039c,0x739c,0xe039,0xc039,0xce73,0x9ce3,0x8739,0xce70,0x1c00,0x0000,0x0000,0x0000,0x0000,
	0x7f1c,0xe707,0x3f80,0x3807,0xf39c,0xe71f,0x8e00,0x0001,0xfc3f,0x1ce7,0x3807,0xf0f1,0xf8e0,0x03f8,0x71fc,0x7e1f,0x801f,0x87e3,0x8fe1,0xe71f,0x8e73,0xf800,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** JP ****/
UWORD chip beta_name [] = {	
	0x073f,0x803f,0x8000,0x0000,0x0000,0x0000,0x0001,0xfc00,0x0e1c,0x0000,0x0038,0x0038,0x0000,0x0000,0x00e1,0xc000,0x0000,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0739,0xc039,0xc000,0x0000,0x0000,0x0000,0x0003,0x8e00,0x0e00,0x0000,0x0038,0x0038,0x0000,0x0000,0x00e0,0x0000,0x0000,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0739,0xc039,0xcfc7,0xe1fc,0x7f1f,0x8fc0,0x0003,0x8e3f,0x1f9c,0xe71f,0x8039,0xfc7e,0x3f1f,0x9fc3,0xf1f9,0xc7e3,0xf87e,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0x803f,0x8e0e,0x7380,0xe039,0xce00,0x0003,0xfe73,0x8e1c,0xe701,0xc039,0xce38,0x739c,0x1ce0,0x38e1,0xce73,0x9c07,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0738,0x0039,0xce0f,0xf1f8,0x7e3f,0xce00,0x0003,0x8e70,0x0e1c,0xe71f,0xc039,0xce38,0x7f9c,0x1ce3,0xf8e1,0xce73,0x9c7f,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0039,0xce0e,0x001c,0x0738,0x0e00,0x0003,0x8e73,0x8e1c,0xe739,0xc039,0xce38,0x701c,0x1ce7,0x38e1,0xce73,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e38,0x003f,0x8e07,0xe3f8,0xfe1f,0x8e00,0x0003,0x8e3f,0x079c,0xfe1f,0xc039,0xce1e,0x3f1c,0x1ce3,0xf879,0xc7e3,0x9c7f,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** eric planquart ****/
UWORD chip beta_name [] = {	
	0xff00,0x3800,0x01fc,0x7000,0x0000,0x0000,0x0000,0x7000,0x0039,0xc001,0xc000,0x1ce0,0x0000,0x0003,0x801c,0x0003,0x8000,0x3800,0x1c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe000,0x0000,0x01ce,0x7000,0x0000,0x0000,0x0000,0x7000,0x003b,0x8001,0xc000,0x1ce0,0x0000,0x0003,0x801c,0x0003,0x8000,0x3800,0x1c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe03f,0x38fc,0x01ce,0x71f8,0xfe1f,0xce71,0xf8fc,0xfc00,0x003f,0x03f1,0xfc3f,0x1cee,0x7e3f,0x1fc7,0xe01c,0x07e3,0xb8fc,0x7e3f,0x1c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xff38,0x39ce,0x01fc,0x701c,0xe739,0xce70,0x1ce0,0x7000,0x003e,0x0039,0xce73,0x9cfc,0x7003,0x9ce3,0x801c,0x0e73,0xf00e,0x3873,0x9c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe038,0x39c0,0x01c0,0x71fc,0xe739,0xce71,0xfce0,0x7000,0x003f,0x03f9,0xce7f,0x9cf8,0x703f,0x9ce3,0x801c,0x0e73,0xe0fe,0x387f,0x9c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe038,0x39ce,0x01c0,0x739c,0xe71f,0xce73,0x9ce0,0x7000,0x003b,0x8739,0xce70,0x1cfc,0x7073,0x9ce3,0x801c,0x0e73,0xf1ce,0x3870,0x1c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xff38,0x38fc,0x01c0,0x71fc,0xe701,0xc7f1,0xfce0,0x3c00,0x0039,0xc3f9,0xfc3f,0x1cee,0x703f,0x9ce1,0xe01f,0xc7e3,0xb8fe,0x1e3f,0x1c00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0001,0xc000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-001 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x1e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x3f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-002 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x3fc0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-003 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x0f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-004 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x3fc0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-005 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x3fc0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x3f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-006 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x3800,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x3f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-007 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x3fc0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x0380,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x0380,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x0700,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x0700,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x0e00,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-008 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-009 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9ce7,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9ce7,0x1fc0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9ce7,0x01c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf87e,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

/**** Ser.#6jan93-010 ****/
UWORD chip beta_name [] = {	
	0x7e00,0x0000,0x330f,0xc038,0x0000,0x0fc3,0xf001,0xf838,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe700,0x0000,0x331c,0x0000,0x0000,0x1ce7,0x3803,0x9c78,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xf01f,0x8fc0,0x7f9c,0x0038,0xfc7f,0x1ce0,0x3803,0x9c38,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x3e39,0xce00,0x331f,0xc038,0x0e73,0x8fe1,0xf1f3,0x9c38,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x073f,0xce00,0x7f9c,0xe038,0xfe73,0x80e0,0x3803,0x9c38,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0xe738,0x0e0e,0x331c,0xe039,0xce73,0x80e7,0x3803,0x9c38,0x39c0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e1f,0x8e0e,0x330f,0xc738,0xfe73,0x8fc3,0xf001,0xf8fe,0x1f80,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x03f0,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

#endif

/******** E O F ********/