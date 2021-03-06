//	File		:	general.h
//	Uses		:
//	Date		:	29-04-93
//	Author	:	ing. C. Lieshout
//	Desc.		:	protos for functions from general.c
//

#include "gen:wait50hz.h"

GLOBAL PROCESSINFO *ml_FindBaseAddr( int , char **);
void MakeFullPath( STRPTR Path, STRPTR Name, STRPTR Dest );
BOOL SendDialogue( PROCDIALOGUE *Msg_Dial, PROCESSINFO *PI, int Cmd);
LONG WaitJiffies(struct ScriptNodeRecord *node, MLSYSTEM *MLSystem);
//void GenObjectDateCheck(SNR *CurSNR);
