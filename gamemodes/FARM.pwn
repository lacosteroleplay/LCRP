/**
 * FARM SYSTEM
 * PROGRESS: 15%.
 * Created by: Lukman
 */

#define MAX_FARM 8
#define MAX_ZONES 10

enum E_Farms {
	farmName[32],
	farmOwner[MAX_PLAYER_NAME],
	farmZone,
	Float:farmZonePoint[],
	farmPrice,
	Float:farmX,
	Float:farmY,
	Float:farmZ,
	farmPickup,
	Text3D:farmLabel,
	farmWheat,
	farmPotato,
	farmOrange
};
new FarmData[MAX_FARM][E_Farms],
	Iterator:Farms<MAX_FARM>;

function LoadFarms() {
	new rows = cache_num_rows(), id, name[64], owner[128], str[128];
	if (rows) {
		for (new i; i < rows; i ++) {
			cache_get_value_name_int(i, "id", id);
			cache_get_value_name(i, "name", name);
			format(FarmData[id][farmName], 64, name);
			cache_get_value_name(i, "owner", owner);
			format(FarmData[id][farmOwner], 128, owner);
			FarmData[id][farmZone]
			cache_get_value_name_int(i, "price", FarmData[id][farmPrice]);
			cache_get_value_name_float(i, "posx", FarmData[id][farmX]);
			cache_get_value_name_float(i, "posy", FarmData[id][farmY]);
			cache_get_value_name_float(i, "posz", FarmData[id][farmZ]);
			FarmData[id][farmPickup] = CreateDynamicPickup(1239, 23, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ], -1, -1, -1, 3.5);
			format(str, sizeof(str), ""YELLOW_E"[Farm ID:%d]\n"GREY_E"Owner: "WHITE_E"%s", );
			FarmData[id][farmLabel] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
			cache_get_value_name_int(i, "wheat", FarmData[id][farmWheat]);
			cache_get_value_name_int(i, "potato", FarmData[id][farmPotato]);
			cache_get_value_name_int(i, "orange", FarmData[id][farmOrange]);
		}
		Iter_Add(Farms, id);
		printf("[FARMS] Number of Farms loaded: %d", rows);
	}
}

Farms_Save(id){
	new query[2048];
	mysql_format(g_SQL, query, sizeof(query), "UPDATE farms SET name='%s', owner='%s', posx='%f', posy='%f', posz='%f'", );
}


















