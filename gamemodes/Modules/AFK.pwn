//AFK
new Text3D:jaja[MAX_PLAYERS] , daadetext3d[MAX_PLAYERS] , textjaja[MAX_PLAYERS][128];

CMD:afk(playerid,params[])
{
  if(isnull(params)) return Usage(playerid, "/afk [reason]");
  if(daadetext3d[playerid] == 1)
  {
	    new st[128];
	    format(st,sizeof(st),"Player Is AFK | Reason: %s",params);
	    textjaja[playerid] = st;
	    UpdateDynamic3DTextLabelText(jaja[playerid], 0x00FF40FF,st);
	    format(st,sizeof(st),"AFK: You has afk with reason: %s use /back to back",params);
	    SendClientMessage(playerid,-1,st);
	    daadetext3d[playerid] = 1;
	    TogglePlayerControllable(playerid,0);
	    new name[128];
	    GetPlayerName(playerid,name,128);
	  	SendStaffMessage(COLOR_YELLOW, "AFK: {ffffff}Player %s Is AFK",name);
	  	SendStaffMessage(COLOR_YELLOW, "Reason: %s", params);
  }
  else
  {
	  new st[128];
	  format(st,sizeof(st),"Player Is AFK\nReason: %s",params);
	  textjaja[playerid] = st;
	  jaja[playerid] = CreateDynamic3DTextLabel(st, 0x00FF40FF, 0, 0, 0.6, 50,playerid);
	  format(st,sizeof(st),"AFK: Kamu sedang AFK dengan reason: %s",params);
	  format(st,sizeof(st),"AFK: Gunakan '/back' untuk Roleplay kembali!",params);
	  SendClientMessage(playerid,-1,st);
	  daadetext3d[playerid] = 1;
	  TogglePlayerControllable(playerid,0);
	  new name[128];
	  GetPlayerName(playerid,name,128);
	  SendStaffMessage(COLOR_YELLOW, "AFK: {ffffff}Player %s Is AFK",name);
	  SendStaffMessage(COLOR_YELLOW, "Reason: %s",params);
  }
  return 1;
}
CMD:back(playerid,params[])
{
	  TogglePlayerControllable(playerid,1);
	  DestroyDynamic3DTextLabel(jaja[playerid]);
	  daadetext3d[playerid] = 0;
	  new name[128];
	  GetPlayerName(playerid,name,128);
	  SendClientMessage(playerid,-1,"AFK: You has used /back");
	  SendStaffMessage(COLOR_YELLOW, "AFK: {ffffff}%s telah kembali dari mode AFK!",name);
	  return 1;
}
