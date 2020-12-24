#define MAX_CONTACTS (20)

enum contactData {
	contactID,
	contactExists,
	contactName[32],
	contactNumber
};
new ContactData[MAX_PLAYERS][MAX_CONTACTS][contactData];
new ListedContacts[MAX_PLAYERS][MAX_CONTACTS];

function LoadContacts(playerid)
{
	new rows = cache_num_rows();
	new cName[32];
	if (rows) {
	    for (new i = 0; i < rows && i < MAX_CONTACTS; i ++) {
	    	ContactData[playerid][i][contactExists] = true;
	        cache_get_value_name_int(i,"contactID",ContactData[playerid][i][contactID]);
	        cache_get_value_name(i,"contactName",cName);
	        format(ContactData[playerid][i][contactName], 32, cName);
	        cache_get_value_name_int(i,"contactNumber",ContactData[playerid][i][contactNumber]);
	    }
	}
}

function OnContactAdd(playerid, id)
{
	ContactData[playerid][id][contactID] = cache_insert_id();
	return 1;
}

ShowContacts(playerid)
{
	new
	    string[32 * MAX_CONTACTS],
		count = 0;

	string = "Add Contact\n";

	for (new i = 0; i != MAX_CONTACTS; i ++) if (ContactData[playerid][i][contactExists]) {
	    format(string, sizeof(string), "%s%s - #%d\n", string, ContactData[playerid][i][contactName], ContactData[playerid][i][contactNumber]);

		ListedContacts[playerid][count++] = i;
	}
	ShowPlayerDialog(playerid, DIALOG_CONTACTS_LIST, DIALOG_STYLE_LIST, "My Contacts", string, "Select", "Back");
	return 1;
}
