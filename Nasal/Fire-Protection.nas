
##SENSORS
# prop: -1 broken, 0 serviceable, 1 firing(by fire)

# Gr6: 1,2,3 Inner front wing, nacelle (combustor); BI-2 Sh.4, terminal 4
# Gr5: 4,5,6 Outer front wing, nacelle (combustor + compressor); BI-2 Sh.4, terminal 4
# Gr4: 7,8,9 Outmost front wing, nacelle (gear comp. + 4th comp.); BI-2 Sh.4, terminal 4

# Gr3: 10,11,12 Outmost back wing, nacelle (gear comp. + 4th comp.); BI-2 Sh.4, terminal 3
# Gr2: 13,14,15 Outer back wing, nacelle (5th + 4th comp.); BI-2 Sh.4, terminal 3
# Gr1: 16,17,18 Inner back wing, nacelle (5th comp.); BI-2 Sh.4, terminal 3

# DTB: 1,2 Left engine comp. and comb. stage
# DTB: 3,4 Right engine comp. and comb. stage

##RELAIS
# Rel4237: Opens contact to left valves/extinguishers (disables their triggering)
# Rel2822: Opens contact to right valves/extinguishers (disables their triggering)

# Rel1191: Signaling fire in left wing
# Rel864: Signaling fire in left nacelle
# Rel867: Signaling fire in right wing
# Rel1189: Signaling fire in right nacelle

# Rel2822: Release ALL Pyros in engines (by EmergPower)

# Rel2708: Release Pyro left engine
# Rel2709: Release Pyro left engine
# Rel4239: Release Pyro right engine
# Rel4243: Release Pyro right engine

# Rel2816: Release Pyros left wing/nacelle
# Rel909: Release Pyros right wing/nacelle

##############################
# SSP Sensors and Valves Test
##############################
var groupselector = 0 ;
var SensorsValvesTest = func (groupselector) {
	var TestPowerL = getprop("an24/Fire-Protection/power-left");
	var TestPowerR = getprop("an24/Fire-Protection/power-right");
	if ( TestPowerL == -1 ) {

		Relais(4237,1);
		if ( groupselector == 0 ) {
		Bi7engines(0,0,0,0);
		var Lnacelle = 0 ;
		var Lwing = 0 ;
		var Rnacelle = 0 ;
		var Rwing = 0 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,0,0,0,0,0);
		}
#		if ( groupselector == 1 ) {# Valves
#		Valves(1,0,0,0);	
#		}
		if ( groupselector == 2 ) {# DTB Nr.1
		Bi7engines(TestPowerR,0,0,0);	
		}
		if ( groupselector == 3 ) {# DTB Nr.2
		Bi7engines(0,TestPowerR,0,0);	
		}
		if ( groupselector == 4 ) {# DTB Nr.3
		Bi7engines(0,0,TestPowerR,0);	
		}
		if ( groupselector == 5 ) {# DTB Nr.4
		Bi7engines(0,0,0,TestPowerR);	
		}
		if ( groupselector == 6 ) {# Gr.6
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,0,0,0,0,1);
		}
		if ( groupselector == 7 ) {# Gr.5
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,0,0,0,1,0);
		}
		if ( groupselector == 8 ) {# Gr.4
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,0,0,1,0,0);
		}
		if ( groupselector == 9 ) {# Gr.3
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,0,1,0,0,0);
		}
		if ( groupselector == 10 ) {# Gr.2
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,0,1,0,0,0,0);
		}
		if ( groupselector == 11 ) {# Gr.1
		var Lnacelle = 1 ;
		var Lwing = 1 ;
		var Rnacelle = 1 ;
		var Rwing = 1 ;
		Bi2(Lnacelle,Lwing,Rnacelle,Rwing,1,0,0,0,0,0);
		}
	}
}
# setlistener("an24/Fire-Protection/power-left", func { call( fire.SensorsValvesTest,[groupselector] ) }, 0, 0);

##############################
# RELAIS
##############################
var switchto = 0 ;
var Relais = func (item,switchto) {
	var powerL = getprop("an24/Fire-Protection/power-left");
	var powerR = getprop("an24/Fire-Protection/power-right");
	var powerEmerg = getprop("an24/Fire-Protection/power-emerg");

	if (item == 4237) {
		if ( powerL == -1.0 ) {
		var relpower = switchto ;
		}
		else {
		var relpower = 0 ;
		}
	}
	if (item == 1191 or item == 864) {
	var relpower = abs(powerL) * switchto;
	}
	if (item == 1189 or item == 867) {
	var relpower = abs(powerR) * switchto;
	}
	if (item == 4239) {
		if ( abs(powerL) == 1.0 ) {
		var relpower = switchto ;
		}
		else {
		var relpower = 0 ;
		}
	}
	if (item == 4243) {
		if ( abs(powerR) == 1.0 ) {
		var relpower = switchto ;
		}
		else {
		var relpower = 0 ;
		}
	}
	if (item == 2822) {
		if ( powerEmerg == 1.0 ) {
		var relpower = switchto ;
		}
		else {
		var relpower = 0 ;
		}
	}
	setprop("an24/Fire-Protection/Rel" ~ item ~ "", relpower );
}
 setlistener("an24/Fire-Protection/power-left", func {
	call( fire.Relais,[4237,switchto] );
	call( fire.Relais,[1191,switchto] );
	call( fire.Relais,[864,switchto] );
	call( fire.Relais,[4239,switchto] );
 }, 0, 0);

 setlistener("an24/Fire-Protection/power-right", func {
	call( fire.Relais,[1189,switchto] );
	call( fire.Relais,[867,switchto] );
	call( fire.Relais,[4243,switchto] );
 }, 0, 0);

 setlistener("an24/Fire-Protection/power-emerg", func {
	call( fire.Relais,[2822,switchto] );
 }, 0, 0);


##############################
# Belly landing switches
##############################
var BellySwitches = func {
	var BellySwitchFront = getprop("gear/gear[5]/compression-ft");
	var BellySwitchTail = getprop("gear/gear[7]/compression-ft");
	if ( BellySwitchFront > 0.4 or BellySwitchTail > 0.4 ) {
		setprop("an24/Fire-Protection/belly-switches", 1);
		Relais(2822,1);
	}
}
 setlistener("gear/gear[5]/compression-ft", BellySwitches, 0, 0);
 setlistener("gear/gear[7]/compression-ft", BellySwitches, 0, 0);

##############################
# BI-2/BI-7 SENSORS
##############################
 var Lnacelle = 0 ;
 var Lwing = 0 ;
 var Rnacelle = 0 ;
 var Rwing = 0 ;
 var Gr1 = 0 ;
 var Gr2 = 0 ;
 var Gr3 = 0 ;
 var Gr4 = 0 ;
 var Gr5 = 0 ;
 var Gr6 = 0 ;
var Bi2 = func (Lnacelle,Lwing,Rnacelle,Rwing,Gr1,Gr2,Gr3,Gr4,Gr5,Gr6) {
	if ( Lwing == 1 ) {
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr1") + Gr1 >= 1 ) {
		Relais(1191,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr2") + Gr2 >= 1 ) {
		Relais(1191,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr3") + Gr3 >= 1 ) {
		Relais(1191,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr4") + Gr4 >= 1 ) {
		Relais(864,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr5") + Gr5 >= 1 ) {
		Relais(864,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lwing_Gr6") + Gr6 >= 1 ) {
		Relais(864,1);
		}
	}
	else {
	Relais(864,0);
	Relais(1191,0);
	}
	if ( Lnacelle == 1 ) {
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr1") + Gr1 >= 1 ) {
		Relais(864,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr2") + Gr2 >= 1 ) {
		Relais(864,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr3") + Gr3 >= 1 ) {
		Relais(864,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr4") + Gr4 >= 1 ) {
		Relais(1191,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr5") + Gr5 >= 1 ) {
		Relais(1191,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Lnacelle_Gr6") + Gr6 >= 1 ) {
		Relais(1191,1);
		}
	}
	else {
	Relais(864,0);
	Relais(1191,0);
	}
	if ( Rwing == 1 ) {
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr1") + Gr1 >= 1 ) {
		Relais(867,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr2") + Gr2 >= 1 ) {
		Relais(867,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr3") + Gr3 >= 1 ) {
		Relais(867,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr4") + Gr4 >= 1 ) {
		Relais(1189,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr5") + Gr5 >= 1 ) {
		Relais(1189,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rwing_Gr6") + Gr6 >= 1 ) {
		Relais(1189,1);
		}
	}
	else {
	Relais(867,0);
	Relais(1189,0);
	}
	if ( Rnacelle == 1 ) {
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr1") + Gr1 >= 1 ) {
		Relais(1189,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr2") + Gr2 >= 1 ) {
		Relais(1189,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr3") + Gr3 >= 1 ) {
		Relais(1189,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr4") + Gr4 >= 1 ) {
		Relais(867,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr5") + Gr5 >= 1 ) {
		Relais(867,1);
		}
		if ( getprop("an24/Fire-Protection/Sensors/Rnacelle_Gr6") + Gr6 >= 1 ) {
		Relais(867,1);
		}
	}
	else {
	Relais(867,0);
	Relais(1189,0);
	}
}
 setlistener("controls/lighting/sw_nosmoking", func { call( fire.Bi2,[1,Lwing,Rnacelle,Rwing,1,Gr2,Gr3,Gr4,Gr5,Gr6] ) }, 0, 0);

var DTB1 = 0 ;
var DTB2 = 0 ;
var DTB3 = 0 ;
var DTB4 = 0 ;
var Bi7engines = func (DTB1,DTB2,DTB3,DTB4) {
	var BI7_DTB1 = getprop("an24/Fire-Protection/Sensors/DTB_1") + DTB1;
	var BI7_DTB2 = getprop("an24/Fire-Protection/Sensors/DTB_2") + DTB2;
	var BI7_DTB3 = getprop("an24/Fire-Protection/Sensors/DTB_3") + DTB3;
	var BI7_DTB4 = getprop("an24/Fire-Protection/Sensors/DTB_4") + DTB4;
	if ( BI7_DTB1 >= 1 or BI7_DTB2 >= 1) {
	Relais(4239,1);
	}
	if ( BI7_DTB3 >= 1 or BI7_DTB4 >= 1) {
	Relais(4243,1);
	}
}
 setlistener("controls/lighting/sw_nosmoking", func { call( fire.Bi7engines,[DTB1,1,DTB3,DTB4] ) }, 0, 0);

##############################
# SIREN
##############################
var FireSiren = func {
	var SirenRel1191 = getprop("an24/Fire-Protection/Rel1191");
	var SirenRel864 = getprop("an24/Fire-Protection/Rel864");
	var SirenRel1189 = getprop("an24/Fire-Protection/Rel1189");
	var SirenRel867 = getprop("an24/Fire-Protection/Rel867");
	var SirenRel4237 = getprop("an24/Fire-Protection/Rel4239");
	var SirenRel4239 = getprop("an24/Fire-Protection/Rel4239");
	var SirenRel4243 = getprop("an24/Fire-Protection/Rel4243");
	if ( SirenRel1191 == 1 or SirenRel864 == 1 or SirenRel1189 == 1 or SirenRel867 == 1 or SirenRel4237 == 1 or SirenRel4239 == 1 or SirenRel4243 == 1 ) {
	setprop("an24/Siren/constant", 1 );
	}
	else {
	setprop("an24/Siren/constant", 0 );
	}
}
 setlistener("an24/Fire-Protection/Rel1191", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel864", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel1189", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel867", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel4239", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel4243", FireSiren, 0, 0);

