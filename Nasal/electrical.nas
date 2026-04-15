# On-screen displays
var enableOSD = func {
    var left  = screen.display.new(20, 10);
    var right = screen.display.new(-300, 10);

    left.add("an24/Electrics/Distributor");
    left.add("an24/Electrics/TsRUl_V");
    left.add("an24/Electrics/TsRUr_V");
    left.add("an24/Electrics/RK_CrewCab_V");
    left.add("an24/Electrics/AZSemerg_V");
    left.add("an24/Electrics/AZSmain_V");
    right.add("an24/Electrics/RK_Akku_V");
    right.add("an24/Electrics/CONN_RK_Akku-RK_CrewCab");
    right.add("an24/Electrics/CONN_RK_Akku-AZSemerg");
    right.add("an24/Electrics/CONN_AZSmain-AZSemerg");
}
enableOSD();


var random_voltage = func {
	setprop("an24/Electrics/random_stg18l", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_stg18r", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_gs24", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_go16l", rand() * 10 + 110 );
	setprop("an24/Electrics/random_go16r", rand() * 10 + 110 );
#	setprop("an24/Electrics/random_go16l", rand() * 0.1 + 0.95 );
}
 setlistener("sim/signals/fdm-initialized", random_voltage);

# Sources
setprop("an24/Electrics/DC_Batt_12SAM1_V", 24.7 );
setprop("an24/Electrics/DC_Batt_12SAM2_V", 25.2 );
setprop("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0 );
setprop("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0 );
setprop("an24/Electrics/AC_AUX_ShRA200_V", 0.0 ); #115V AC AUX
# gui
setprop("sim/gui/an24b/shrap500a", 0 );
setprop("sim/gui/an24b/shrap500b", 0 );

##############################
## Lighting
##############################
# Left Console
var lc_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/console-l_red", getprop("an24/LightsInterior/kn_console-l") );
	}
	else {
	interpolate("an24/LightsInterior/console-l_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_console-l", lc_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", lc_light, 0, 0 );

# Left Panel
var lp_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/panel-l_red", getprop("an24/LightsInterior/kn_panel-l") );
	}
	else {
	interpolate("an24/LightsInterior/panel-l_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_panel-l", lp_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", lp_light, 0, 0 );

# Middle Panel
var mp_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/panel-m_red", getprop("an24/LightsInterior/kn_panel-m") );
	}
	else {
	interpolate("an24/LightsInterior/panel-m_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_panel-m", mp_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", mp_light, 0, 0 );

# Right Panel
var rp_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/panel-r_red", getprop("an24/LightsInterior/kn_panel-r") );
	}
	else {
	interpolate("an24/LightsInterior/panel-r_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_panel-r", rp_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", rp_light, 0, 0 );

# Right Console
var rc_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/console-r_red", getprop("an24/LightsInterior/kn_console-r") );
	}
	else {
	interpolate("an24/LightsInterior/console-r_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_console-r", rc_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", rc_light, 0, 0 );

# Overhead Panel
var rc_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/console-r_red", getprop("an24/LightsInterior/kn_console-r") );
	}
	else {
	interpolate("an24/LightsInterior/console-r_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_console-r", rc_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", rc_light, 0, 0 );


# Radio Op's Panel, Electrical Panel, Fuse Panel
var rop_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/radioopstationlight", getprop("an24/LightsInterior/sw_radioopstationlight") );
	}
	else {
	interpolate("an24/LightsInterior/radioopstationlight", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/sw_radioopstationlight", rop_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", rop_light, 0, 0 );

# AZS Panel
var azs_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/azspanel", getprop("an24/LightsInterior/sw_azspanel") );
	}
	else {
	interpolate("an24/LightsInterior/azspanel", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/sw_azspanel", azs_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", azs_light, 0, 0 );

# Radio Panel Instruments
var radiopanelinstr_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/radio_panel_instr", getprop("an24/LightsInterior/kn_radio_panel_instr") );
	}
	else {
	interpolate("an24/LightsInterior/radio_panel_instr", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_radio_panel_instr", radiopanelinstr_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", radiopanelinstr_light, 0, 0 );

# Electrical Panel Instruments
var epi_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/panel-elec_red", getprop("an24/LightsInterior/kn_panel-elec") );
	}
	else {
	interpolate("an24/LightsInterior/panel-elec_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_panel-elec", epi_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", epi_light, 0, 0 );

# Navigator's Panel
var np_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/nav_panel_red", getprop("an24/LightsInterior/kn_nav_panel") );
	}
	else {
	interpolate("an24/LightsInterior/nav_panel_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_nav_panel", np_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", np_light, 0, 0 );

# Navigator's Panel Instruments
var npi_light = func {
	if ( getprop("an24/LightsInterior/lamps_have_power") == 1 ) {
	setprop("an24/LightsInterior/nav_panel_instr_red", getprop("an24/LightsInterior/kn_nav_panel_instr") );
	}
	else {
	interpolate("an24/LightsInterior/nav_panel_instr_red", 0.0, 0.2 );
	}
}
 setlistener("an24/LightsInterior/kn_nav_panel_instr", npi_light, 0, 0 );
 setlistener("an24/LightsInterior/lamps_have_power", npi_light, 0, 0 );
