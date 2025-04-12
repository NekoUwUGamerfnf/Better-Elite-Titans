global function EliteTitanPlayerCount_Init

void function EliteTitanPlayerCount_Init()
{
    PlayerCheckLoop()
}

void function PlayerCheckLoop()
{
thread PlayerCheckLoop_thread()
}

void function PlayerCheckLoop_thread()
 {
  while( true )
  {
   WaitFrame()
   if ( !IsServer() )
   return
   if ( GetConVarInt( "elite_titan_player_count" ) != 0 )
   {
   if ( GetConVarInt( "elite_titan_easier" ) == 0 && GetPlayerArray().len() <= 6 )
   SetConVarInt( "elite_titan_easier", 1 )
   if ( GetConVarInt( "elite_titan_easier" ) != 0 && GetPlayerArray().len() > 6 )
   SetConVarInt( "elite_titan_easier", 0 )
   if ( GetConVarInt( "elite_titan_harder" ) == 0 && GetPlayerArray().len() >= 12 )
   SetConVarInt( "elite_titan_harder", 1 )
   if ( GetConVarInt( "elite_titan_harder" ) != 0 && GetPlayerArray().len() < 12 )
   SetConVarInt( "elite_titan_harder", 0 )
   }
  }
 }