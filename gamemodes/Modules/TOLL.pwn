new TollBarriers[4];
new TollLocked[4];

CreateTolls()
{
	TollLocked[0] = 0;
	TollLocked[1] = 0;
	TollLocked[2] = 0;
	TollLocked[3] = 0;
	//Anti label bug
	Create3DTextLabel("Anti label bug!!!", 0xFF8000FF, 0,0,0, 0.0, 0, 0);
	//
    Create3DTextLabel("Type /paytoll to open the toll barrier!", 0xFF8000FF, 1752.2086,520.3835,27.5502, 13.0, 0, 0);
	Create3DTextLabel("Type /paytoll to open the toll barrier!", 0xFF8000FF, 1743.7057,523.5931,27.5270, 13.0, 0, 0);
	Create3DTextLabel("Type /paytoll to open the toll barrier!", 0xFF8000FF, 1735.5123,527.2330,27.4850, 13.0, 0, 0);
	Create3DTextLabel("Type /paytoll to open the toll barrier!", 0xFF8000FF, 1726.7883,530.5012,27.4653, 13.0, 0, 0);

    TollBarriers[0] = CreateObject(968, 1759.01074, 528.30090, 27.02510,   0.00000, 270.00000, 342.57901);
    TollBarriers[1] = CreateObject(968, 1750.42993, 531.05920, 27.00510,   0.00000, 270.00000, 342.57901);
    TollBarriers[2] = CreateObject(968, 1736.03772, 516.81238, 28.14320,   0.00000, 270.00000, 341.41080);
    TollBarriers[3] = CreateObject(968, 1727.48022, 519.80322, 28.14320,   0.00000, 270.00000, 341.41080);

	CreateObject(9623, 1748.20435, 521.95001, 29.37770,   -3.00000, 0.00000, 341.41080);
	CreateObject(9623, 1731.05945, 527.73907, 29.37770,   -3.00000, 0.00000, 341.41080);
	CreateObject(966, 1758.81592, 528.34552, 26.15890,   0.00000, 0.00000, 342.57901);
	CreateObject(966, 1727.28992, 519.86353, 27.29340,   0.00000, 0.00000, 341.41080);
	CreateObject(966, 1735.84070, 516.87518, 27.29340,   0.00000, 0.00000, 341.41080);
	CreateObject(966, 1750.22205, 531.10889, 26.13890,   0.00000, 0.00000, 342.57901);
}

CMD:paytoll(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 1.5, 1752.2086,520.3835,27.5502))
	{
        if(TollLocked[0] == 0)
        {
    		Info(playerid,"Toll barrier opened!");
	    	Info(playerid,"The barrier will be closed after 6 seconds!");
	    	SetTimer("MoveGate1",5400,false);
	    	MovingObject(TollBarriers[0], 0.00000, 0.00000, 342.57901, 1.00000);
	    	if (pData[playerid][pTollCard] > 0) {
	    		pData[playerid][pTollCard] -= 2;
	    		Info(playerid, "Your toll card is reduced by 2 to pay the toll, the rest of your toll card: %d.", pData[playerid][pTollCard]);
	    	} else {
	    		GivePlayerMoneyEx(playerid, -25);
	    		Info(playerid,"You pay the toll with a money of $25.");
	    	}
		} else Error(playerid, "The toll is locked!");
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1743.7057,523.5931,27.5270))
	{
	    if(TollLocked[1] == 0)
        {
		    Info(playerid,"Toll barrier opened!");
	    	Info(playerid,"The barrier will be closed after 6 seconds!");
	    	SetTimer("MoveGate2",5400,false);
	    	MovingObject(TollBarriers[1], 0.00000, 0.00000, 342.57901, 1.00000);
	    	if (pData[playerid][pTollCard] > 0) {
	    		pData[playerid][pTollCard] -= 2;
	    		Info(playerid, "Your toll card is reduced by 2 to pay the toll, the rest of your toll card: %d.", pData[playerid][pTollCard]);
	    	} else {
	    		GivePlayerMoneyEx(playerid, -25);
	    		Info(playerid,"You pay the toll with a money of $25.");
	    	}
		} else Error(playerid, "The toll is locked!");
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1735.5123,527.2330,27.4850))
	{
	    if(TollLocked[2] == 0)
        {
		    Info(playerid,"Toll barrier opened!");
	    	Info(playerid,"The barrier will be closed after 6 seconds!");
	    	SetTimer("MoveGate3",5400,false);
	    	MovingObject(TollBarriers[2], 0.00000, 0.00000, 341.41080, 1.00000);
	    	if (pData[playerid][pTollCard] > 0) {
	    		pData[playerid][pTollCard] -= 2;
	    		Info(playerid, "Your toll card is reduced by 2 to pay the toll, the rest of your toll card: %d.", pData[playerid][pTollCard]);
	    	} else {
	    		GivePlayerMoneyEx(playerid, -25);
	    		Info(playerid,"You pay the toll with a money of $25.");
	    	}
		} else Error(playerid, "The toll is locked!");
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1726.7883,530.5012,27.4653))
	{
	    if(TollLocked[3] == 0)
        {
			Info(playerid,"Toll barrier opened!");
	    	Info(playerid,"The barrier will be closed after 6 seconds!");
	    	SetTimer("MoveGate4",5400,false);
	    	MovingObject(TollBarriers[3], 0.00000, 0.00000, 341.41080, 1.00000);
	    	if (pData[playerid][pTollCard] > 0) {
	    		pData[playerid][pTollCard] -= 2;
	    		Info(playerid, "Your toll card is reduced by 2 to pay the toll, the rest of your toll card: %d.", pData[playerid][pTollCard]);
	    	} else {
	    		GivePlayerMoneyEx(playerid, -25);
	    		Info(playerid,"You pay the toll with a money of $25.");
	    	}
		} else Error(playerid, "The toll is locked!");
	} else Error(playerid,"You need to be near to toll!");
    return 1;
}

function MoveGate1()
{
    MovingObject(TollBarriers[0], 0.00000, 270.00000, 342.57901, 1.00000);
}

function MoveGate2()
{
    MovingObject(TollBarriers[1], 0.00000, 270.00000, 342.57901, 1.00000);
}

function MoveGate3()
{
    MovingObject(TollBarriers[2], 0.00000, 270.00000, 341.41080, 1.00000);
}

function MoveGate4()
{
    MovingObject(TollBarriers[3], 0.00000, 270.00000, 341.41080, 1.00000);
}

MovingObject(objectid, Float:rotX, Float:rotY, Float:rotZ, Float:Speed)
{
	new Float:X, Float:Y, Float:Z;
	new Float:SpeedConverted = floatmul(Speed, 0.01);
	GetObjectPos(objectid, X, Y, Z);
	SetObjectPos(objectid, X, Y, floatadd(Z, 0.01));
	MoveObject(objectid, X, Y, floatsub(Z, 0.01), SpeedConverted, rotX, rotY, rotZ);
	return 1;
}