/******** newscript xapp gadgets ********/

struct GadgetRecord NewScript_GR[] =
{
  0,   0, 640,  60, 0, NULL, 0,												DIMENSIONS, NULL,	
  0,	 0,	639,  59, 0, NULL, 0,												DBL_BORDER_REGION, NULL,
 60,   3, 633,  16, 1, NULL, 0,												BUTTON_GADGET, NULL,
450,  42, 532,  55, 0, NULL, Msg_OK,									BUTTON_GADGET, NULL,
551,  42, 633,  55, 0, NULL, Msg_Cancel,							BUTTON_GADGET, NULL,
0,0,0,0,0,NULL,0,PREV_GR,(struct GadgetRecord *)NULL,	// 'last one'
-1
};

/******** E O F ********/
