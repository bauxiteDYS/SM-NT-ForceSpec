#include <sourcemod>
#include <sdktools>

public Plugin myinfo =
{	
	name = "NT Force to Spectator",
	description = "Use !forcespec to move all players to Spectator team",
	author = "bauxite",
	version = "1.0",
	url = "https://discord.gg/afhZuFB9A5",
}

public OnPluginStart()
{
	LoadTranslations("common.phrases");
	RegAdminCmd("sm_forcespec", Command_Force, ADMFLAG_GENERIC);	
}

public Action Command_Force(client, args)
{
	for(int i = 1; i <= MaxClients; i++)
	
		{	
		ForceSpec(i)
		}			
}

void ForceSpec(i)
{
	if(IsClientConnected(i) && IsClientInGame(i) && ! IsClientSourceTV(i))

	{	
		FakeClientCommand(i, "kill"); 
		FakeClientCommand(i, "jointeam 1");
	}
}
