## Before anything else change random seed.
srand();

#########################################
## AChS-1 CLOCKS
#########################################
#  Middle panel Stopwatch
var mp_stopwatch = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var sw_time = getprop("an24/AChS/mp_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/mp_stopwatch", int(sw_time));
});

# Middle panel Flighttime
var mp_flitetimer = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var fl_time = getprop("an24/AChS/mp_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/mp_flighttime", int(fl_time));
});

# Middle panel wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var mp_wtimer = maketimer(10, func(){
	var speedup = getprop("sim/speed-up");
	var windup = getprop("an24/AChS/mp_wind_up");
	if ( getprop("an24/AChS/mp_wind_up") > 0 and getprop("instrumentation/clock/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/mp_wind_up", int(windup));
	setprop("an24/AChS/mp_running", 1 );
	}
	else {
	setprop("an24/AChS/mp_running", 0 );
	mp_wtimer.stop();
	mp_stopwatch.stop();
	mp_flitetimer.stop();
	}
});
mp_wtimer.start();

#  Right console Stopwatch
var rc_stopwatch = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var sw_time = getprop("an24/AChS/rc_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/rc_stopwatch", int(sw_time));
});

# Right console Flighttime
var rc_flitetimer = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var fl_time = getprop("an24/AChS/rc_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/rc_flighttime", int(fl_time));
});

# Right console wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var rc_wtimer = maketimer(10, func(){
	var speedup = getprop("sim/speed-up");
	var windup = getprop("an24/AChS/rc_wind_up");
	if ( getprop("an24/AChS/rc_wind_up") > 0 and getprop("instrumentation/clock[1]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/rc_wind_up", int(windup));
	setprop("an24/AChS/rc_running", 1 );
	}
	else {
	setprop("an24/AChS/rc_running", 0 );
	rc_wtimer.stop();
	rc_stopwatch.stop();
	rc_flitetimer.stop();
	}
});
rc_wtimer.start();

#  Navigator's Stopwatch
var nav_stopwatch = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var sw_time = getprop("an24/AChS/nav_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/nav_stopwatch", int(sw_time));
});

# Navigator's Flighttime
var nav_flitetimer = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var fl_time = getprop("an24/AChS/nav_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/nav_flighttime", int(fl_time));
});

# Navigator's wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var nav_wtimer = maketimer(10, func(){
	var speedup = getprop("sim/speed-up");
	var windup = getprop("an24/AChS/nav_wind_up");
	if ( getprop("an24/AChS/nav_wind_up") > 0 and getprop("instrumentation/clock[2]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/nav_wind_up", int(windup));
	setprop("an24/AChS/nav_running", 1 );
	}
	else {
	setprop("an24/AChS/nav_running", 0 );
	nav_wtimer.stop();
	nav_stopwatch.stop();
	nav_flitetimer.stop();
	}
});
nav_wtimer.start();

#########################################
## ARK-11
#########################################
var panelpowernav_27v = func {
 	if (getprop("an24/ARK-11/mode-nav") != 0 and getprop("an24/ARK-11/power-1_27V") == 1) {
	setprop("an24/ARK-11/panelpowernav_27V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpowernav_27V", 0);
	}
}
 setlistener("an24/ARK-11/mode-nav", panelpowernav_27v, 0, 0);
 setlistener("an24/ARK-11/power-1_27V", panelpowernav_27v, 0, 0);

var panelpowernav_115v = func {
 	if (getprop("an24/ARK-11/mode-nav") != 0 and getprop("an24/ARK-11/power-1_115V") == 1) {
	setprop("an24/ARK-11/panelpowernav_115V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpowernav_115V", 0);
	}
}
 setlistener("an24/ARK-11/mode-nav", panelpowernav_115v, 0, 0);
 setlistener("an24/ARK-11/power-1_115V", panelpowernav_115v, 0, 0);


var panelpower2_27v = func {
 	if (getprop("an24/ARK-11/mode-2") != 0 and getprop("an24/ARK-11/power-2_27V") == 1) {
	setprop("an24/ARK-11/panelpower2_27V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpower2_27V", 0);
	}
}
 setlistener("an24/ARK-11/mode-2", panelpower2_27v, 0, 0);
 setlistener("an24/ARK-11/power-2_27V", panelpower2_27v, 0, 0);

var panelpower2_115v = func {
 	if (getprop("an24/ARK-11/mode-2") != 0 and getprop("an24/ARK-11/power-2_115V") == 1) {
	setprop("an24/ARK-11/panelpower2_115V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpower2_115V", 0);
	}
}
 setlistener("an24/ARK-11/mode-2", panelpower2_115v, 0, 0);
 setlistener("an24/ARK-11/power-2_115V", panelpower2_115v, 0, 0);

var panelpoweroh_27v = func {
 	if (getprop("an24/ARK-11/mode-oh") != 0 and getprop("an24/ARK-11/power-1_27V") == 1) {
	setprop("an24/ARK-11/panelpoweroh_27V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpoweroh_27V", 0);
	}
}
 setlistener("an24/ARK-11/mode-oh", panelpoweroh_27v, 0, 0);
 setlistener("an24/ARK-11/power-1_27V", panelpoweroh_27v, 0, 0);

var panelpoweroh_115v = func {
 	if (getprop("an24/ARK-11/mode-oh") != 0 and getprop("an24/ARK-11/power-1_115V") == 1) {
	setprop("an24/ARK-11/panelpoweroh_115V", 1);
	}
	else {
	setprop("an24/ARK-11/panelpoweroh_115V", 0);
	}
}
 setlistener("an24/ARK-11/mode-oh", panelpoweroh_115v, 0, 0);
 setlistener("an24/ARK-11/power-1_27V", panelpoweroh_115v, 0, 0);

###########
var addfreqs1 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-1");
 var finetune = getprop("an24/ARK-11/fine-khz-1");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-1", finalfreq);
 setprop("instrumentation/adf[0]/frequencies/selected-khz", finalfreq);
 setprop("instrumentation/adf[2]/frequencies/selected-khz", finalfreq);
}
 setlistener("an24/ARK-11/sub-band-khz-1", addfreqs1, 0, 0);
 setlistener("an24/ARK-11/fine-khz-1", addfreqs1, 0, 0);

var addfreqs2 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-2");
 var finetune = getprop("an24/ARK-11/fine-khz-2");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-2", finalfreq);
 setprop("/instrumentation/adf[1]/frequencies/selected-khz", finalfreq);
 setprop("/instrumentation/adf[3]/frequencies/selected-khz", finalfreq);
}
 setlistener("an24/ARK-11/sub-band-khz-2", addfreqs2, 0, 0);
 setlistener("an24/ARK-11/fine-khz-2", addfreqs2, 0, 0);

###########
var fixbuttons1 = func (buttonnav) {
	interpolate("an24/ARK-11/mem1/animfix" ~ buttonnav ~ "", 1.0, 0.1 );
	var pressed1 = getprop("an24/ARK-11/mem1/fixpressed");
	setprop("an24/ARK-11/mem1/animfix" ~ pressed1 ~ "", 0.0 );
	setprop("an24/ARK-11/mem1/fixpressed", buttonnav );
	if ( getprop("an24/ARK-11/mem1/fixp") == 1.0 or getprop("an24/ARK-11/panel_nav_oh") == 1 or getprop("an24/ARK-11/panelpowernav_27V") == 0) {
	settimer(func {interpolate("an24/ARK-11/mem1/animfix" ~ buttonnav ~ "", 0.0, 0.1 );},0.1);
	}

	if ( getprop("an24/ARK-11/panelpowernav_27V") == 1 and getprop("an24/ARK-11/panel_nav_oh") == 0.0 ) {
		if ( getprop("an24/ARK-11/mem1/fixp") == 1.0 ) {
		setprop("an24/ARK-11/mem1/fix" ~ buttonnav ~ "sb", getprop("an24/ARK-11/sub-band-khz-1") );
		setprop("an24/ARK-11/mem1/fix" ~ buttonnav ~ "ff", getprop("an24/ARK-11/fine-khz-1") );
		}
		else {
		interpolate("an24/ARK-11/sub-band-khz-1", getprop("an24/ARK-11/mem1/fix" ~ buttonnav ~ "sb"), 2.0 );
		interpolate("an24/ARK-11/fine-khz-1", getprop("an24/ARK-11/mem1/fix" ~ buttonnav ~ "ff"), 2.4 );
		}
	}
}

var fixbuttons2 = func (button2) {
	interpolate("an24/ARK-11/mem2/animfix" ~ button2 ~ "", 1.0, 0.1 );
	var pressed2 = getprop("an24/ARK-11/mem2/fixpressed");
	setprop("an24/ARK-11/mem2/animfix" ~ pressed2 ~ "", 0.0 );
	setprop("an24/ARK-11/mem2/fixpressed", button2 );
	if ( getprop("an24/ARK-11/mem2/fixp") == 1.0 or getprop("an24/ARK-11/panelpower2_27V") == 0) {
	settimer(func {interpolate("an24/ARK-11/mem2/animfix" ~ button2 ~ "", 0.0, 0.1 );},0.1);
	}

	if ( getprop("an24/ARK-11/panelpower2_27V") == 1 ) {
		if ( getprop("an24/ARK-11/mem2/fixp") == 1.0 ) {
		setprop("an24/ARK-11/mem2/fix" ~ button2 ~ "sb", getprop("an24/ARK-11/sub-band-khz-2") );
		setprop("an24/ARK-11/mem2/fix" ~ button2 ~ "ff", getprop("an24/ARK-11/fine-khz-2") );
		}
		else {
		interpolate("an24/ARK-11/sub-band-khz-2", getprop("an24/ARK-11/mem2/fix" ~ button2 ~ "sb"), 2.0 );
		interpolate("an24/ARK-11/fine-khz-2", getprop("an24/ARK-11/mem2/fix" ~ button2 ~ "ff"), 2.4 );
		}
	}
}

var fixbuttonsoh = func (buttonoh) {
	interpolate("an24/ARK-11/mem1/animfixoh" ~ buttonoh ~ "", 1.0, 0.1 );
	var pressedoh = getprop("an24/ARK-11/mem1/fixohpressed");
	setprop("an24/ARK-11/mem1/animfixoh" ~ pressedoh ~ "", 0.0 );
	setprop("an24/ARK-11/mem1/fixohpressed", buttonoh );
	if ( getprop("an24/ARK-11/mem1/fixp") == 1.0 or getprop("an24/ARK-11/panel_nav_oh") == 0 or getprop("an24/ARK-11/panelpoweroh_27V") == 0) {
	settimer(func {interpolate("an24/ARK-11/mem1/animfixoh" ~ buttonoh ~ "", 0.0, 0.1 );},0.1);
	}

	else {
	interpolate("an24/ARK-11/sub-band-khz-1", getprop("an24/ARK-11/mem1/fix" ~ buttonoh ~ "sb"), 2.0 );
	interpolate("an24/ARK-11/fine-khz-1", getprop("an24/ARK-11/mem1/fix" ~ buttonoh ~ "ff"), 2.4 );
	}
}

###########
var arkautosave = func {
	var station1 = findNDBByFrequencyKHz( getprop("/instrumentation/adf[0]/frequencies/selected-khz") );
		if (station1 != nil) {
		stations.textid11.setText(sprintf("%.5s\n", station1.name ));
		stations.textst11.setText(sprintf("%.1f", getprop("/instrumentation/adf[0]/frequencies/selected-khz")));
		stations.textra11.setText(sprintf("%.i", station1.range_nm * 1.85 ));
		}
}
 setlistener("sim/signals/fdm-initialized", arkautosave, 0, 0 );

#########################################
## GIK-1
#########################################
# Creating random magnetic heading indication on start-up
var gik_init = func {
	var gik_delta_heading = geo.normdeg180(360*rand());
	setprop("an24/GIK-1/delta-heading", gik_delta_heading);
}
gik_init();

#########################################
## GPK-52
#########################################
props.globals.initNode("an24/GPK-52/lat-nut", int(getprop("position/latitude-deg")));

# Creating random magnetic heading indication on start-up
srand();
var hdg_stop = int(rand() * 360);
props.globals.initNode("an24/GPK-52/init-error-deg", hdg_stop);

#########################################
## KPPM
#########################################
# Creating random radial offsets on left and right KPPM
var kppm_init = func(i) {
	var kppm_start_offset = int(360*rand());
	setprop("/instrumentation/nav["~i~"]/radials/selected-deg", kppm_start_offset);
	setprop("/instrumentation/nav["~i~"]/radials/selected-deg_no_minmax", kppm_start_offset);
}
kppm_init(0);
kppm_init(1);

#########################################
## PPS-2MKV (or VMK or MVK)
## 1.9A max (lamp test)
#########################################
# Warnings (not triggered when flying with one engine):
# 3.	Gear down!: All gears up + Throttle below 25deg + Flaps 13-17deg = Siren + warning light (can't be deactivated)
# 2.	Gear and Flaps down!:	All gears up + Throttle below 25deg + Flaps not 13-17deg = Siren + warning light (can be deactivated)
# 1.	Flaps down!:	Front gear down + Throttle above 76deg + Flaps not 13-17deg = Siren + warning light (can be deactivated)
var pps_warning = func {
	var uprtl_deg = getprop("/controls/engines/engine[0]/throttle-uprt-lever-angle");
	var uprtr_deg = getprop("/controls/engines/engine[1]/throttle-uprt-lever-angle");
	var gear_posF = getprop("gear/gear[0]/position-norm");
	var gear_posL = getprop("gear/gear[1]/position-norm");
	var gear_posR = getprop("gear/gear[2]/position-norm");
	var flap_pos = getprop("surface-positions/flap-pos-norm");
	
	if ( getprop("an24/PPS/warning-power") == 1 and getprop("engines/engine[0]/running") == 1 and getprop("engines/engine[1]/running") == 1 ) {
		if ( (gear_posF + gear_posL + gear_posR == 0.0 ) and (uprtl_deg < 24 or uprtr_deg < 24) ) {
			if ( flap_pos > 0.342 and flap_pos < 0.447 ) {
			setprop("an24/PPS/warning", 3 );
			setprop("an24/Siren/constant", 3 );
			}
			else {
			setprop("an24/PPS/warning", 2 );
			setprop("an24/Siren/constant", 2 );
			}
		}
		else if ( gear_posF == 1.0 and (uprtl_deg > 76 or uprtr_deg > 76) and (flap_pos < 0.342 or flap_pos > 0.447 ) ) {
		setprop("an24/PPS/warning", 1 );
		setprop("an24/Siren/constant", 1 );
		}
		else {
		setprop("an24/PPS/warning", 0 );
		setprop("an24/Siren/constant", 0 );
		}
	}
	else {
	setprop("an24/PPS/warning", 0 );
	setprop("an24/Siren/constant", 0 );
	}	
}
 setlistener("an24/PPS/warning-power", pps_warning, 0, 0 );
 setlistener("engines/engine[0]/running", pps_warning, 0, 0 );
 setlistener("engines/engine[1]/running", pps_warning, 0, 0 );
 setlistener("/controls/engines/engine[0]/throttle-uprt-lever-angle", pps_warning, 0, 0 );
 setlistener("/controls/engines/engine[1]/throttle-uprt-lever-angle", pps_warning, 0, 0 );
 setlistener("gear/gear[0]/position-norm", pps_warning, 0, 0 );
 setlistener("gear/gear[1]/position-norm", pps_warning, 0, 0 );
 setlistener("gear/gear[2]/position-norm", pps_warning, 0, 0 );
 setlistener("surface-positions/flap-pos-norm", pps_warning, 0, 0 );

#########################################
## R-802 No.1
#########################################
var r802_1_txrx = func {
	if ( getprop("an24/R-802/power-1") == 1 ) {
		if ( getprop("an24/AC_Panel/fuse0102") == 1 ) {
		setprop("an24/R-802/output-vol-1", getprop("an24/R-802/kn_volume-1") );
		}
		else {
		setprop("an24/R-802/output-vol-1", 0.0 );
		}

		if ( getprop("an24/AC_Panel/fuse0103") == 1 ) {
		setprop("an24/R-802/transmit-power-W_1", 15 );
		}
		else {
		setprop("an24/R-802/transmit-power-W_1", 0 );
		}
	}
	else {
	setprop("an24/R-802/output-vol-1", 0.0 );
	setprop("an24/R-802/transmit-power-W_1", 0 );
	}
}
 setlistener("an24/R-802/power-1", r802_1_txrx, 0, 0 );
 setlistener("an24/AC_Panel/fuse0102", r802_1_txrx, 0, 0 );
 setlistener("an24/AC_Panel/fuse0103", r802_1_txrx, 0, 0 );
 setlistener("an24/R-802/kn_volume-1", r802_1_txrx, 0, 0 );


# Transfer freqs from memory to dial
var r802_1_freqremem = func {
	var channel = getprop("an24/R-802/channel");
	var storedfreq = getprop("an24/R-802/memory/num" ~ channel ~ "");
	interpolate("an24/R-802/dial100", sprintf("%.2s", storedfreq) * 10, 0.2 );
	interpolate("an24/R-802/dial10", int(storedfreq) - sprintf("%.2s", storedfreq) * 10, 0.4 );
	interpolate("an24/R-802/dial1", (storedfreq - int(storedfreq)) * 10, 0.6 );
	setprop("an24/R-802/finalfreq", storedfreq);
	setprop("/instrumentation/comm[1]/frequencies/selected-mhz", storedfreq);
}
 setlistener("an24/R-802/memscrew", r802_1_freqremem);

# Choose Channel
var r802_1_freqchoice = func {
var channel = getprop("an24/R-802/channel");
var storedfreq = getprop("an24/R-802/memory/num" ~ channel ~ "");
# 4s max (shortened a little bit to 2s)
interpolate("/instrumentation/comm[0]/frequencies/selected-mhz", storedfreq, 2.0 );
}
 setlistener("an24/R-802/channel", r802_1_freqchoice, 0, 0);
 setlistener("an24/R-802/memscrew", r802_1_freqchoice, 0, 0);

#########################################
## R-802 No.2
#########################################
var r802_2_txrx = func {
	if ( getprop("an24/R-802/power-2") == 1 ) {
		if ( getprop("an24/AC_Panel/fuse0104") == 1 ) {
		setprop("an24/R-802/output-vol-2", getprop("an24/R-802/kn_volume-2") );
		}
		else {
		setprop("an24/R-802/output-vol-2", 0.0 );
		}

		if ( getprop("an24/AC_Panel/fuse0105") == 1 ) {
		setprop("an24/R-802/transmit-power-W_2", 15 );
		}
		else {
		setprop("an24/R-802/transmit-power-W_2", 0 );
		}
	}
	else {
	setprop("an24/R-802/output-vol-2", 0.0 );
	setprop("an24/R-802/transmit-power-W_2", 0 );
	}
}
 setlistener("an24/R-802/power-2", r802_2_txrx, 0, 0 );
 setlistener("an24/AC_Panel/fuse0104", r802_2_txrx, 0, 0 );
 setlistener("an24/AC_Panel/fuse0105", r802_2_txrx, 0, 0 );
 setlistener("an24/R-802/kn_volume-2", r802_2_txrx, 0, 0 );


var r802_2_addfreqs = func {
	var freq100 = getprop("an24/R-802/dial100");
	var freq10 = getprop("an24/R-802/dial10");
	var freq1 = getprop("an24/R-802/dial1");
	var final802freq = freq100 + freq10 + freq1 / 10 ;
# 6s max from 100-150MHz(shortened a little bit by /10 instead of /8.3)
	var transitiontime = abs((final802freq-getprop("/instrumentation/comm[1]/frequencies/selected-mhz")) / 10);
	setprop("an24/R-802/finalfreq", final802freq);
	interpolate("/instrumentation/comm[1]/frequencies/selected-mhz", final802freq, transitiontime);
}
 setlistener("an24/R-802/dial100", r802_2_addfreqs);
 setlistener("an24/R-802/dial10", r802_2_addfreqs);
 setlistener("an24/R-802/dial1", r802_2_addfreqs);

# Store dialed freqs in memory
var r802_2_storefreqs = func {
	var channel = getprop("an24/R-802/channel");
	var curfreq = getprop("an24/R-802/finalfreq");
	setprop("an24/R-802/memory/num" ~ channel ~ "", curfreq);
	setprop("/instrumentation/comm[0]/frequencies/selected-mhz", curfreq );
}
 setlistener("an24/R-802/dialscrew", r802_2_storefreqs, 0, 0);

#########################################
## R-836
#########################################
# setprop("an24/R-836/b1_knob_A", getprop("an24/R-836/Channels/ch1knA"));
props.globals.initNode("an24/R-836/b1_knob_B", getprop("an24/R-836/Channels/ch1knB"));
props.globals.initNode("an24/R-836/b1_knob_C", getprop("an24/R-836/Channels/ch1knC"));

var r836_channelset = func {
	var r836_channelnr = getprop("an24/R-836/b3_knob_C");
	if ( getprop("an24/R-836/b3_knob_B") == 0 ) {
	setprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knA", getprop("an24/R-836/b1_knob_A") );
	setprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knB", getprop("an24/R-836/b1_knob_B") );
	setprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knC", getprop("an24/R-836/b1_knob_C") );
	}
}
 setlistener("an24/R-836/b1_knob_A", r836_channelset, 0, 0 );
 setlistener("an24/R-836/b1_knob_B", r836_channelset, 0, 0 );
 setlistener("an24/R-836/b1_knob_C", r836_channelset, 0, 0 );

var r836_channelchange = func {
	if ( getprop("an24/R-836/b3_knob_B") == 0 ) {
		var r836_channelnr = getprop("an24/R-836/b3_knob_C");
	}
	else {
		if ( getprop("an24/R-836/operator") == 0 ) {
		var r836_channelnr = getprop("an24/R-836/eng_channel");
		}
		else {
		var r836_channelnr = getprop("an24/R-836/rc_channel");
		}
	}

	var r836_settime_knA = abs( (getprop("an24/R-836/b1_knob_A") - getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knA"))/15 ) ;
	var r836_settime_knB = abs( (getprop("an24/R-836/b1_knob_B") - getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knB"))/2 ) ;
	var r836_settime_knC = abs( (getprop("an24/R-836/b1_knob_C") - getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knC"))/10 ) ;


#	if ( getprop("an24/R-836/b3_knob_B") == 1 ) {
	interpolate("an24/R-836/b1_knob_A", getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knA"), r836_settime_knA );
	interpolate("an24/R-836/b1_knob_B", getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knB"), r836_settime_knB );
	interpolate("an24/R-836/b1_knob_C", getprop("an24/R-836/Channels/ch" ~ r836_channelnr ~ "knC"), r836_settime_knC );
#	}
}
 setlistener("an24/R-836/b3_knob_B", r836_channelchange, 0, 0 );
 setlistener("an24/R-836/b3_knob_C", r836_channelchange, 0, 0 );
 setlistener("an24/R-836/eng_channel", r836_channelchange, 0, 0 );
 setlistener("an24/R-836/rc_channel", r836_channelchange, 0, 0 );
 setlistener("an24/R-836/operator", r836_channelchange, 0, 0 );

var dectobin = func {
	var decnr = getprop("an24/R-836/b1_knob_A") -1 ;# 1 is first in the list
	var binnr = [0,0,0,0,0,0] ;
	for(var i=0; decnr>0; i=i+1) {
		binnr[i] = math.fmod(decnr, 2) ;
		var decnr = int(decnr/2) ;
	}
	# for testing
	setprop("an24/R-836/capacitorgr1", binnr[0] );
	setprop("an24/R-836/capacitorgr2", binnr[1] );
	setprop("an24/R-836/capacitorgr3", binnr[2] );
	setprop("an24/R-836/capacitorgr4", binnr[3] );
	setprop("an24/R-836/capacitorgr5", binnr[4] );
	setprop("an24/R-836/capacitorgr6", binnr[5] );
# Gr.1:  10+(0.35<->2.00)
# Gr.2:  22+(0.35<->4.00)
# Gr.3:  40+(0.35<->4.00)
# Gr.4:  79+(0.35<->4.00)
# Gr.5: 163+(0.35<->4.00)
# Gr.6: 320+(0.35<->4.00)
	if (binnr[0] != 0) {
	var group1factor = 1/(binnr[0]*( 10 + getprop("an24/R-836/b1_knob_A"))) ;
	}
	else {
	var group1factor = 0 ;
	}

	if (binnr[1] != 0) {
	var group2factor = 1/(binnr[1]*( 22 + getprop("an24/R-836/b1_knob_B"))) ;
	}
	else {
	var group2factor = 0 ;
	}

	if (binnr[2] != 0) {
	var group3factor = 1/(binnr[2]*( 40 + getprop("an24/R-836/b1_knob_B"))) ;
	}
	else {
	var group3factor = 0 ;
	}

	if (binnr[3] != 0) {
	var group4factor = 1/(binnr[3]*( 79 + getprop("an24/R-836/b1_knob_B"))) ;
	}
	else {
	var group4factor = 0 ;
	}

	if (binnr[4] != 0) {
	var group5factor = 1/(binnr[4]*(163 + getprop("an24/R-836/b1_knob_B"))) ;
	}
	else {
	var group5factor = 0 ;
	}

	if (binnr[5] != 0) {
	var group6factor = 1/(binnr[5]*(320 + getprop("an24/R-836/b1_knob_C"))) ;
	}
	else {
	var group6factor = 0 ;
	}

		var cap = math.pow(group1factor+group2factor+group3factor+group4factor+group5factor+group6factor, -1);
		setprop("an24/R-836/capacity", cap );
	setprop("an24/R-836/capacitorgr1test", group1factor );
	setprop("an24/R-836/capacitorgr2test", group2factor );
	setprop("an24/R-836/capacitorgr3test", group3factor );
	setprop("an24/R-836/capacitorgr4test", group4factor );
	setprop("an24/R-836/capacitorgr5test", group5factor );
	setprop("an24/R-836/capacitorgr6test", group6factor );
}
 setlistener("an24/R-836/b1_knob_A", dectobin, 0, 0 );
 setlistener("an24/R-836/b1_knob_B", dectobin, 0, 0 );
 setlistener("an24/R-836/b1_knob_C", dectobin, 0, 0 );

#########################################
## SOM-64
#########################################
var so63_out = func() {
	var so63_opmode = getprop("/instrumentation/transponder/inputs/so-63_opmode") ;
	if (so63_opmode != 3.0) {
		var so63_digit0 = getprop("/instrumentation/transponder/inputs/digit0") ;
		var so63_digit1 = getprop("/instrumentation/transponder/inputs/digit1")*10 ;
		var so63_digit2 = getprop("/instrumentation/transponder/inputs/digit2")*100 ;
		var so63_digit3 = getprop("/instrumentation/transponder/inputs/digit3")*1000 ;

		var so63_sro2_code = so63_digit0 + so63_digit1 + so63_digit2 + so63_digit3 ;
		}
		else {
		var so63_sro2_code = getprop("/an24/SRO-2/code_nr") ;
		}
		setprop("/instrumentation/transponder/id-code", so63_sro2_code);
}
 setlistener("/instrumentation/transponder/inputs/digit0", so63_out, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/digit1", so63_out, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/digit2", so63_out, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/digit3", so63_out, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/so-63_opmode", so63_out, 0, 0 );
 setlistener("/an24/SRO-2/code_nr", so63_out, 0, 0 );

var som64_transmitted = func() {
	var so63_idcode = getprop("/instrumentation/transponder/id-code") ;
	var so63_knob_mode = getprop("/instrumentation/transponder/inputs/anim-knob-mode") ;
	var so63_knob_test = getprop("/instrumentation/transponder/inputs/anim-test-btn") ;
	var som64_power = getprop("/instrumentation/transponder/serviceable") ;

	if (som64_power == 1.0 and so63_knob_test != 1.0) {
		if (so63_knob_mode == 3.0 ) {
		var som64_squawk = so63_idcode ;
		}	
		else if (so63_knob_mode == 2.0 and so63_idcode != 7700 and so63_idcode != 7600) {
		var som64_squawk = so63_idcode ;
		}
		else {
		var som64_squawk = -9999 ;
		}
	}
	else {
	var som64_squawk = -9999 ;
	}
	setprop("/instrumentation/transponder/transmitted-id", som64_squawk);
}
 setlistener("/instrumentation/transponder/id-code", som64_transmitted, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/anim-knob-mode", som64_transmitted, 0, 0 );
 setlistener("/instrumentation/transponder/inputs/anim-test-btn", som64_transmitted, 0, 0 );
 setlistener("/instrumentation/transponder/serviceable", som64_transmitted, 0, 0 );

var so_timer_apts = maketimer(2.0, func(){
	var so_timer_apts = findAirportsWithinRange(10);
	foreach(var apt; so_timer_apts){
	setprop("/instrumentation/transponder/nr_of_airports", size(so_timer_apts));
	}
	print((int(rand()*10))/10);
});
# so_timer_apts.start();

#var so_timer = func() {
#	print((int(rand()*10))/10);
#}
# setlistener("/instrumentation/transponder/nr_of_airports", so_timer );


#var so_timer = maketimer(30.0, func(){
#	print(int(rand()*10)/10);
#});

#########################################
## SP-50
#########################################
# Creating random course needle offsets in SP-50 (and glideslope needle offsets in Kurs-MP) when Localizer and/or Glideslope are present
var sp50_offset = func() {
	var sp50_hs_offset = 0.0 ;
	var sp50_gs_offset = 0.0 ;
	if (getprop("instrumentation/nav/in-range") == 1.0 and getprop("fdm/jsbsim/fcs/realism/sp-50_offset") == 0 ) {
		if (getprop("instrumentation/nav/nav-loc") == 1.0) {
			if (getprop("instrumentation/nav/radials/selected-deg") < 180 ) {
			var sp50_hs_offset = rand() ;
			}
			else {
			var sp50_hs_offset = rand() * -1 ;
			}
		}

		if (getprop("an24/radio-equip") == "Kurs-MP" and getprop("/instrumentation/nav/has-gs") == 1.0) {
			if (abs(sp50_hs_offset) * getprop("instrumentation/nav/radials/selected-deg") < 180) {
			var sp50_gs_offset = rand() ;
			}
			else {
			var sp50_gs_offset = rand() * -1 ;
			}
	}
	interpolate("an24/SP-50/hs-needle-offset", sp50_hs_offset*0.5, 0.5);
	interpolate("an24/SP-50/gs-needle-offset", sp50_gs_offset*0.5, 0.4);
	}
	else {
	interpolate("an24/SP-50/hs-needle-offset", 0.0, 0.5 );
	interpolate("an24/SP-50/gs-needle-offset", 0.0, 0.4 );
	}
}
 setlistener("instrumentation/nav/in-range", sp50_offset, 0, 0);
 setlistener("an24/radio-equip", sp50_offset, 0, 0);

#########################################
## TP622 Signal/Lighting Rockets Panel of EKSR-46
#########################################
setprop("an24/TP622/startcolourred", 1.0 );
setprop("an24/TP622/startcolourgreen", 1.0 );
setprop("an24/TP622/startcolourblue", 1.0 );

var EKSRCassetteMain = func (cassette,btnnr) {
	var EKSRPowerMain = getprop("an24/Electrics/AZSmain_V");
	var EKSRAZSMain = getprop("an24/AZS/sw0713");
	var TP622switch = getprop("an24/TP622/sw_Cassette"~cassette~"");
	var colournr = getprop("an24/TP622/colour_rocket"~cassette~""~btnnr~"");
#	var colourname = ["white", "green", "orange", "red"];
		if ( colournr == 0 ) {
		setprop("an24/TP622/startcolourred", 1.0 );
		setprop("an24/TP622/startcolourgreen", 1.0 );
		setprop("an24/TP622/startcolourblue", 1.0 );
		}
		if ( colournr == 1 ) {
		setprop("an24/TP622/startcolourred", 0.0 );
		setprop("an24/TP622/startcolourgreen", 1.0 );
		setprop("an24/TP622/startcolourblue", 0.0 );
		}
		if ( colournr == 2 ) {
		setprop("an24/TP622/startcolourred", 1.0 );
		setprop("an24/TP622/startcolourgreen", 1.0 );
		setprop("an24/TP622/startcolourblue", 0.0 );
		}
		if ( colournr == 3 ) {
		setprop("an24/TP622/startcolourred", 1.0 );
		setprop("an24/TP622/startcolourgreen", 0.0 );
		setprop("an24/TP622/startcolourblue", 0.0 );
		}
		if ( EKSRPowerMain > 24 and EKSRAZSMain == 1.0 and TP622switch == 1.0 and getprop("an24/TP622/rocket"~cassette~""~btnnr~"_fired") != 1.0 ) {
		interpolate("an24/TP622/rocket"~cassette~""~btnnr~"_fired", 1.0, 1.0 );
		}
}

#########################################
## UAP-12(R or W) of AUASP
#########################################
var auasp_mode = func() {
	if (getprop("controls/flight/flaps") > 0.35 and getprop("gear/gear[0]/wow") == 1 ) {
	setprop("an24/UAP-12/mode", 0 ); # pre-rotate condition of mode "Start"
#	setprop("an24/UAP-12/auasp-limit", 15.0 );
	}
	if (getprop("controls/flight/flaps") > 0.35 and getprop("gear/gear[0]/wow") == 0 and getprop("an24/UAP-12/mode") == 0 ) {
	setprop("an24/UAP-12/mode", 1 ); # post-rotate condition of mode "Start"
#	setprop("an24/UAP-12/auasp-limit", 12.3 );
	}
	if (getprop("controls/flight/flaps") < 0.35 and getprop("gear/gear[0]/wow") == 0 and getprop("an24/UAP-12/mode") == 1 ) {
	setprop("an24/UAP-12/mode", 2 ); # mode "Flight"
	}
	if (getprop("controls/flight/flaps") > 0.35 and getprop("gear/gear[0]/wow") == 0 and getprop("an24/UAP-12/mode") == 2 ) {
	setprop("an24/UAP-12/mode", 3 ); # mode "Landing"
#	setprop("an24/UAP-12/auasp-limit", 12.3 );
	}
}
 setlistener("controls/flight/flaps", auasp_mode, 0, 0);
 setlistener("gear/gear[0]/wow", auasp_mode, 0, 0);

#########################################
## ZK-2
#########################################
# Creating random heading bugs
var zk_init = func {
	var zk_mp_bug = int(360*rand());
	setprop("an24/ZK-2/mp_heading-bug", zk_mp_bug);
	var zk_nav_bug = int(360*rand());
	setprop("an24/ZK-2/nav_heading-bug", zk_nav_bug);
	var zk_rp_bug = int(360*rand());
	setprop("an24/ZK-2/rp_heading-bug", zk_rp_bug);
}
 setlistener("sim/signals/fdm-initialized", zk_init, 0, 0 );
