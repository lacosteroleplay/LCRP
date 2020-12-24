#define mowerpoint1 550.0178,-1804.9520,5.6423
#define mowerpoint2 563.8598,-1821.6653,5.6424
#define mowerpoint3 578.8467,-1820.6361,5.6424
#define mowerpoint4 597.3673,-1822.8562,5.6424
#define mowerpoint5 598.8972,-1836.1742,5.2737
#define mowerpoint6 605.7294,-1842.4641,5.1606
#define mowerpoint7 634.5803,-1840.1794,5.2625
#define mowerpoint8 674.7715,-1850.2144,5.5007
#define mowerpoint9 694.8340,-1850.8978,6.6404
#define mowerpoint10 679.1021,-1845.0132,5.6684
#define mowerpoint11 659.2654,-1837.4828,5.6425
#define mowerpoint12 579.4240,-1800.9517,5.6388

new MowerVeh[4];

CreateMowers()
{
	CreateDynamicObject(19458, 552.22388, -1768.88733, 4.45832,   0.00000, 0.00000, 357.20322);
	CreateDynamicObject(970, 549.84729, -1773.70911, 5.29680,   0.00000, 0.00000, 0.10201);
	CreateDynamicObject(970, 541.55865, -1773.67603, 5.29680,   0.00000, 0.00000, 0.10201);
	CreateDynamicObject(19458, 538.94153, -1765.17358, 4.45830,   0.00000, 0.00000, 4.14790);
	CreateDynamicObject(19458, 552.68225, -1759.29407, 4.45832,   0.00000, 0.00000, 357.20322);
	CreateDynamicObject(19386, 539.29938, -1771.59033, 6.25416,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 537.08978, -1772.36255, 5.25200,   0.00000, 0.00000, 358.66391);
	CreateDynamicObject(970, 537.09430, -1770.84924, 5.25200,   0.00000, 0.00000, 2.64780);
	CreateDynamicObject(625, 542.75354, -1775.70764, 5.67343,   356.85840, 0.00000, -2.35619);
	CreateDynamicObject(625, 543.90784, -1775.61877, 5.67343,   356.85840, 0.00000, -2.35619);
	CreateDynamicObject(625, 551.16290, -1775.55334, 5.67343,   356.85840, 0.00000, -2.35619);
	CreateDynamicObject(625, 549.97156, -1775.54834, 5.67343,   356.85840, 0.00000, -2.35619);
	CreateDynamicObject(19975, 538.14337, -1769.89795, 3.25455,   0.00000, 0.00000, 277.41666);
	CreateDynamicObject(18647, 544.58453, -1773.69910, 4.73210,   0.00000, 0.00000, 270.25665);
	CreateDynamicObject(18647, 546.78473, -1773.69592, 4.73210,   0.00000, 0.00000, 269.93500);
	CreateDynamicObject(11699, 545.67816, -1773.68225, 4.46722,   0.00000, 0.00000, 178.23978);
	
	MowerVeh[0] = AddStaticVehicleEx(572, 542.6886, -1766.1571, 5.2963, 181.5343, 1, 1, VEHICLE_RESPAWN); //Mower
	MowerVeh[1] = AddStaticVehicleEx(572, 544.5634, -1766.1215, 5.2963, 181.5343, 1, 1, VEHICLE_RESPAWN); //Mower
	MowerVeh[2] = AddStaticVehicleEx(572, 546.7435, -1766.0382, 5.2963, 181.5343, 1, 1, VEHICLE_RESPAWN); //Mower
	MowerVeh[3] = AddStaticVehicleEx(572, 548.8082, -1766.0437, 5.2963, 181.5343, 1, 1, VEHICLE_RESPAWN); //Mower
}

IsAMowerVeh(carid) {
	for (new v = 0; v < sizeof(MowerVeh); v ++) {
		if (carid == MowerVeh[v]) return 1;
	}
	return 0;
}