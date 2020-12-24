
//>>>>>>>NEW<<<<<<<//
new PosMilker[6] = {5, ...}, Text3D: labelMilker[8];
new Float:PozitieVaca[8][8] = {{-705.9675,922.6806,12.5630},{-699.5356,922.5532,12.5590},{-705.1910,930.1280,12.5630},{-699.4991,929.7224,12.5590},{-694.0001,921.8440,12.5590},{-693.1855,929.6555,12.5590},{-687.6802,929.2599,12.5590},{-687.5578,921.4838,12.5590}};
new VacarActor[2];

CreateMilker()
{
    //Text hambar
	CreateDynamic3DTextLabel("Racitor\nTo store milk use : {FF0000}/unloadmilk",COLOR_WHITE,-667.9572,970.2622,12.1328,5.0);
	//text info ferma
	CreateDynamic3DTextLabel("{0000FF}Selamat datang di peternakan sapi Las Venturas\n{FFFFFF}Peternakan",COLOR_LB,-712.0016,958.3662,12.3428,5.0);
	VacarActor[0] = CreateActor(128, -712.0016,958.3662,12.3428,3.1074);
    SetActorInvulnerable(VacarActor[0] , true);
    ApplyActorAnimation(VacarActor[0], "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
    VacarActor[1] = CreateActor(34, -667.9572,970.2622,12.1328,90.7164);
    SetActorInvulnerable(VacarActor[1], true);
    ApplyActorAnimation(VacarActor[1] , "PED", "SEAT_down", 4.0, 0, 1, 1, 1, -1);
	// SetTimer("UpdateVaca" , 500 * 60, true);
	
	for(new i = 0; i != sizeof(PozitieVaca); i++)
    {
    	labelMilker[i] = CreateDynamic3DTextLabel("{FFFFFF}Stable with a milking cow \nTEKAN {FFFFFF}H", 0xFFFFFF, PozitieVaca[i][0], PozitieVaca[i][1], PozitieVaca[i][2], 5.0);
    }
    return 1;
}

CMD:unloadmilk(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,5.0,-670.1496,969.9528,12.1328)) return SendClientMessage(playerid,0xFF444499,"SERVER : Silakan simpan madu di gudang!");
    if(!LapteVaca[playerid]) return SendClientMessage(playerid,-1, "SERVER : {FF00FF}Anda tidak punya susu! {00FF00}Pergi dan perah susu dari sapi.");
	GivePlayerMoneyEx(playerid, 150);
    SendClientMessage(playerid,-1, "SERVER : {FFFFFF}GoodJob Susu berhasil di perah: $150 dari peternakan");
    LapteVaca[playerid] = !LapteVaca[playerid];
    PlayerHasMilker[playerid] = 0;
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
    return 1;
}

function UpdateStup()
{
    for(new i = 0x0; i != sizeof(PozitieVaca); i++)
    {
        if(PosMilker[i] == 5) continue;
        PosMilker[i]++;
        Update3DTextLabelText(labelMilker[i], 0xFFFFFFFF, "{FFFFFF}Stable with a milking cow \nPress {FFFFFF}H");
    }
}
