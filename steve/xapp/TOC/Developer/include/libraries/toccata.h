
/*
**  This C include file was generated automatically
**  from an assembly include file
**  using I2H written by Henning Friedl.
*/


/* --------------------------------------------------------------------------- */
#define TOCCATA_LIB_VERSION	0	/* the current version of toccata.library */
/* --------------------------------------------------------------------------- */
/*  the public-part of toccata.library */

struct ToccataBase {
	struct	Library Library;
	APTR	tb_BoardAddress;	/* The address of the Toccata board  */
/*   (should not be used) */
	APTR	tb_HardInfo;	/* Pointer to struct HardInfo (PRIVATE) */
/*   or NULL if there is no hardware. */
/* Check this entry to see if there is a */
/*   toccata board installed or not! */

};

/*  subsequent fields in the library base are TOCCATA PRIVATE */
/* --------------------------------------------------------------------------- */
#define PAT_Min	TAG_USER+200
#define PAT_MixAux1Left	PAT_Min+2
#define PAT_MixAux1Right	PAT_Min+3
#define PAT_MixAux2Left	PAT_Min+4
#define PAT_MixAux2Right	PAT_Min+5
#define PAT_InputVolumeLeft	PAT_Min+6
#define PAT_InputVolumeRight	PAT_Min+7
#define PAT_OutputVolumeLeft	PAT_Min+8
#define PAT_OutputVolumeRight	PAT_Min+9
#define PAT_LoopbackVolume	PAT_Min+10
#define PAT_Mode	PAT_Min+11
#define PAT_Frequency	PAT_Min+12
#define PAT_Input	PAT_Min+13	/* see TINPUT_xxx below */
#define PAT_MicGain	PAT_Min+14

#define TINPUT_Line	0
#define TINPUT_Aux1	1
#define TINPUT_Mic	2
#define TINPUT_Mix	3
/* --------------------------------------------------------------------------- */
#define TT_Min	TAG_USER+300

#define TT_Window	TT_Min+0	/* Default: NULL */
#define TT_BufferPri	TT_Min+1	/* Default: 2 */
#define TT_IoPri	TT_Min+2	/* Default: 1 */
#define TT_IrqPri	TT_Min+3	/* Default: 105 */
#define TT_BufferSize	TT_Min+4	/* Default: 100 KByte */
#define TT_Frequency	TT_Min+6	/* sample frequency, defaults to global settings */
#define TT_Mode	TT_Min+7	/* mode, defaults to global settings */
#define TT_Length	TT_Min+8	/* number of bytes to capture/playback */
#define TT_FileName	TT_Min+11	/* File to load from/save to */
#define TT_Save	TT_Min+15	/* Callback function CB_Save()  (capture only) */
#define TT_Load	TT_Min+16	/* Callback function CB_Load()  (playback only) */
#define TT_Level	TT_Min+17	/* Callback function CB_Level() (level only) */
#define TT_ErrorTask	TT_Min+18	/* task to notify if an error occurs */
#define TT_ErrorMask	TT_Min+19	/* signal mask to send */
#define TT_SmartPlay	TT_Min+20	/* BOOL, do not stop playing if CB_Load() is too slow */
#define TT_RawTask	TT_Min+21	/* Task to notify if the raw buffer has to be refilled */
#define TT_RawMask	TT_Min+22	/* signal mask to send */
#define TT_RawBuffer1	TT_Min+23	/* first buffer for raw playback */
#define TT_RawBuffer2	TT_Min+24	/* second buffer for raw playback */
#define TT_RawIrqSize	TT_Min+25	/* amount of data transferred by one raw interrupt */
#define TT_RawReply	TT_Min+26	/* function to call if buffer has been refilled */
/* --------------------------------------------------------------------------- */
/* possible values for PAT_Mode */

#define TMODE_LINEAR_8	0	/*  8 bit linear */
#define TMODE_LINEAR_16	1	/* 16 bit linear */
#define TMODE_ALAW	2	/*  8 bit A-Law compressed */
#define TMODE_ULAW	3	/*  8 bit �-Law compressed */

#define TMODEB_STEREO	3
#define TMODEF_STEREO	0x00000008	/* set this bit in PAT_Mode if you want stereo */

#define TMODE_LINEAR_8_S	8	/*  8 bit linear stereo */
#define TMODE_LINEAR_16_S	9	/* 16 bit linear stereo */
#define TMODE_ALAW_S	10	/*  8 bit A-Law compressed stereo */
#define TMODE_ULAW_S	11	/*  8 bit �-Law compressed stereo */

#define TMODE_MASK	7
/* --------------------------------------------------------------------------- */
/*  flags for T_Stop(): */

#define TSB_DONTSAVECACHE	0
#define TSF_DONTSAVECACHE	0x00000001	/* stop capture immediately, do not save cached data */
/* --------------------------------------------------------------------------- */
/*  You may use this macro to call the functions in toccata.library. To avoid */
/*  conflicts with existing functions, they have a slightly unusual name (T_xxx). */

/* --------------------------------------------------------------------------- */



