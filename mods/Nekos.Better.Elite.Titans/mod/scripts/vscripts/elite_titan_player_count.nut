global function EliteTitanPlayerCount_Init

void function EliteTitanPlayerCount_Init()
{
    if( GameRules_GetGameMode() == FD && GetConVarInt( "elite_titan_player_count" ) != 0 )
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
  if ( GetConVarInt( "elite_titan_easier" ) == 0 && GetPlayerArray().len() <= GetConVarInt( "elite_titan_player_count_easier" ) )
  SetConVarInt( "elite_titan_easier", 1 )
  if ( GetConVarInt( "elite_titan_easier" ) != 0 && GetPlayerArray().len() > GetConVarInt( "elite_titan_player_count_easier" ) )
  SetConVarInt( "elite_titan_easier", 0 )
  if ( GetConVarInt( "elite_titan_harder" ) == 0 && GetPlayerArray().len() <= GetConVarInt( "elite_titan_player_count_harder" ) )
  SetConVarInt( "elite_titan_harder", 1 )
  if ( GetConVarInt( "elite_titan_harder" ) != 0 && GetPlayerArray().len() > GetConVarInt( "elite_titan_player_count_harder" ) )
  SetConVarInt( "elite_titan_harder", 0 )
  if ( GetConVarInt( "elite_titan_easier" ) != 0 && GetConVarInt( "elite_titan_harder" ) != 0 )
  SetConVarInt( "elite_titan_easier", 0 )
  if ( GetConVarInt( "elite_titan_harder" ) != 0 && GetConVarInt( "elite_titan_easier" ) != 0 )
  SetConVarInt( "elite_titan_harder", 0 )
  }
 }
}