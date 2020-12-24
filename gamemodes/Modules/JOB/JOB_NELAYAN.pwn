#define MAX_TRAWL 1000
#define MAX_TRAWL_PLAYER 3

new RentBoatCP, BuyBoatCP;

CreateJoinNelayanPoint() {
	CreateDynamicPickup(1239, 23, 154.19, -1946.61, 5.38, -1);
	CreateDynamic3DTextLabel("[NELAYAN JOB]\n{FFFFFF}/joinjob to join.", COLOR_YELLOW, 154.19, -1946.61, 5.38, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamic3DTextLabel("[BOAT DEALER]", COLOR_YELLOW, 145.15,-1819.51,3.07, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	BuyBoatCP = CreateDynamicCP(145.15,-1819.51,3.07, 1.0, -1, -1, -1, 5.0);
	// buy trawl
	// CreateDynamicPickup(1239, 23, 2351.92, -1170.46, 28.06, -1);
	// CreateDynamic3DTextLabel("[BUY TRAWL]\n{FFFFFF}Use /buy to buying trawl.", COLOR_LIME, 2351.92, -1170.46, 28.06,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	RentBoatCP = CreateDynamicCP(141.81, -1819.54, 3.07, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Rent Boat", COLOR_YELLOW, 141.81, -1819.54, 3.07, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
}

enum E_Trawl {
	trPlanted,
	trFinished,
	Float:trPos[3],
	Text3D:trLabel,
	trOwner[MAX_PLAYER_NAME],
	trObj
};
new trData[MAX_TRAWL][E_Trawl],
	Iterator:Trawls<MAX_TRAWL>;

function TrawlTimer(playerid) {
	foreach (new i : Trawls) if (trData[i][trOwner] == pData[playerid][pName]) {
		trData[i][trFinished] = 1;
		new str[128];
		format(str, sizeof(str), "Ready\n"YELLOW_E"Trawl Owner: "WHITE_E"%s", pData[playerid][pName]);
		UpdateDynamic3DTextLabelText(trData[i][trLabel], COLOR_GREEN, str);
		Info(playerid,"Ikan sudah menyangkut di jaring Anda, silahkan '/picktrawl' untuk mengangkatnya.");
		return 1;
	}
	return 1;
}

CMD:throwtrawl(playerid,params[])
{
	if (pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8) {
		if (pData[playerid][pFish] >= 50) return Error(playerid,"Kamu sudah memiliki 50 kg ikan, jual terlebih dahulu di Flint County.");
		if(!IsAtFishPlace(playerid)) return Error(playerid,"Kamu tidak berada di Laut.");
		if (pData[playerid][pJobTime] > 0) return Error(playerid,"Kamu harus menunggu %d detik.", pData[playerid][pJobTime]);
	    if(pData[playerid][pTrawl] < 5) return Error(playerid,"You don't have enough trawl!");
	    if(IsPlayerInVehicle(playerid,GetPlayerVehicleID(playerid))) return Error(playerid,"You can't do it in a Boat!");
	    if (PlayerHasTrawl[playerid] == 1) return Error(playerid,"Mohon tunggu beberapa saat.");
	    if(TotalTrawl[playerid] >= MAX_TRAWL_PLAYER) return Error(playerid,"You can't throw more of 3 trawl");
	    new id = Iter_Free(Trawls), str[128];
	    GetPlayerPos(playerid,trData[id][trPos][0],trData[id][trPos][1],trData[id][trPos][2]);
	    trData[id][trObj] = CreateDynamicObject(2068,trData[id][trPos][0],trData[id][trPos][1],trData[id][trPos][2]-1,0.0,0.0,0.0,-1,-1,-1,100.0,0.0);
	    trData[id][trOwner] = pData[playerid][pName];
	    ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_In",4.1,false,false,false,false,3000,false);
	    format(str, sizeof(str), "Fishing Nets\n"YELLOW_E"Trawl Owner: "WHITE_E"%s", pData[playerid][pName]);
	    trData[id][trLabel] = CreateDynamic3DTextLabel(str,COLOR_RED,trData[id][trPos][0],trData[id][trPos][1],trData[id][trPos][2],5.0);
	    pData[playerid][pTrawl] -= 5;
	    TotalTrawl[playerid]++;
	    PlayerHasTrawl[playerid] = 1;
	    Iter_Add(Trawls, id);
	    new rand = RandomEx(30000, 60000);
	    Info(playerid,"Kamu telah menaruh trawl ke laut, tunggu beberapa saat.");
	    SetTimerEx("TrawlTimer",rand,0,"i",playerid);
	} else Error(playerid,"Kamu bukan seorang Nelayan!");
    return 1;
}

CMD:picktrawl(playerid,params[])
{
	if (pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8) {
	    foreach (new i : Trawls)
	    {
	      if(!IsPlayerInRangeOfPoint(playerid,5.0,trData[i][trPos][0],trData[i][trPos][1],trData[i][trPos][2])) continue;
	      if(trData[i][trFinished] == 0) return Error(playerid,"Wait just a little time for pick trawl");
	      if (trData[i][trOwner] == pData[playerid][pName]) {
		      if(IsPlayerInVehicle(playerid,GetPlayerVehicleID(playerid))) return Error(playerid," You can't do it in a BOAT");
		      DestroyDynamicObject(trData[i][trObj]);
		      DestroyDynamic3DTextLabel(trData[i][trLabel]);
		      new weight = RandomEx(5,10);
		      pData[playerid][pFish] += weight;
		      Info(playerid, "Kamu mendapatkan ikan seberat %d kg.", weight);
		      TotalTrawl[playerid]--;
		      format(trData[i][trOwner], MAX_PLAYER_NAME, "-");
		      PlayerHasTrawl[playerid] = 0;
		      Iter_Remove(Trawls, i);
			} else return Error(playerid,"Trawl ini bukan milik kamu.");
	    }
	} else Error(playerid,"Kamu bukan seorang Nelayan!");
    return 1;
}