#include "..\..\script_macros.hpp"
/*
	File: fn_bountyBuy.sqf
	Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 
	
	Description: Creates a GUI message when someone wants to buy the bounty hunting license.
*/

private ["_aciton","_unit","_atm"];

_unit = player;

if(playerSide != civilian) exitWith {hint "Only Civilians can buy a Bounty Hunting License!"};
if(life_cash < 100000) exitWith {hint "Sorry! You do not have $100,000 for the license"};
if(license_civ_bountyH) exitWith {hint "You're already a bounty hunter, why buy it again?"};

_action = [
    format [localize "STR_GNOTF_BountyMSG"],
    localize "STR_Bounty_License",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint parseText format["<t color='#FA4F4F'><t size='1.5'>Welcome to Bounty Hunters!</t></t><br/><br/><t size='1.2'>The Bounty Hunters are a group of civilians who wish to make Australia a better place by eliminating the ones who make it bad, they do this by the books while earning money on the side. Being a bounty hunter does NOT give you the right to RDM! Any RDM will be delt with!</t>"];
	life_cash = life_cash - 100000;
	[100] remoteExecCall ["life_fnc_removeLicenses",_unit];
} else {
	hint "So the bounty hunters is not for you? Get out of my house!";
};
