{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 1,
			"revision": 5,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			565.0,
			85.0,
			920.0,
			912.0
		],
		"openrect": [
			0.0,
			0.0,
			0.0,
			169.0
		],
		"openrectmode": 0,
		"default_fontsize": 10.0,
		"default_fontname": "Arial Bold",
		"gridsize": [
			8.0,
			8.0
		],
		"boxanimatetime": 500,
		"boxes": [
			{
				"box": {
					"id": "title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						15.0,
						900.0,
						18.0
					],
					"text": "TALKO 2 | Pitch + Velocity | stereo CV"
				}
			},
			{
				"box": {
					"id": "info",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						50.0,
						880.0,
						18.0
					],
					"text": "Max signal = target volts / 10. Track fader at 0 dB (unity); Push pedal jacks output 0-10 V, so the output matches the target volts."
				}
			},
			{
				"box": {
					"id": "note",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"int",
						"int"
					],
					"patching_rect": [
						30.0,
						104.0,
						95.0,
						20.0
					],
					"text": "notein"
				}
			},
			{
				"box": {
					"id": "strip",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"int",
						"int"
					],
					"patching_rect": [
						210.0,
						150.0,
						100.0,
						20.0
					],
					"text": "stripnote"
				}
			},
			{
				"box": {
					"id": "rl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						205.0,
						510.0,
						18.0
					],
					"text": "LEFT: PITCH - note 60...96 -> 0...3.3 V; holds on note-off"
				}
			},
			{
				"box": {
					"id": "vl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						480.0,
						205.0,
						495.0,
						18.0
					],
					"text": "RIGHT: VELOCITY - note-on 0...127 -> 0...3.3 V; holds on note-off"
				}
			},
			{
				"box": {
					"id": "velclip",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						480.0,
						240.0,
						100.0,
						20.0
					],
					"text": "clip 0 127"
				}
			},
			{
				"box": {
					"id": "velvolt",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						480.0,
						280.0,
						230.0,
						20.0
					],
					"text": "expr 3.3 * $i1 / 127."
				}
			},
			{
				"box": {
					"format": 6,
					"id": "velmon",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						730.0,
						280.0,
						85.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "velconvert",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						480.0,
						320.0,
						67.0,
						20.0
					],
					"text": "expr $f1 / 10."
				}
			},
			{
				"box": {
					"id": "velsig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						480.0,
						360.0,
						110.0,
						20.0
					],
					"text": "sig~ -0.5"
				}
			},
			{
				"box": {
					"id": "pitchclip",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30.0,
						240.0,
						110.0,
						20.0
					],
					"text": "clip 60 96"
				}
			},
			{
				"box": {
					"id": "pitchvolt",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30.0,
						280.0,
						285.0,
						20.0
					],
					"text": "expr 3.3 * ($i1 - 60) / 36."
				}
			},
			{
				"box": {
					"format": 6,
					"id": "pitchmon",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						330.0,
						280.0,
						85.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "pitchconvert",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30.0,
						320.0,
						67.0,
						20.0
					],
					"text": "expr $f1 / 10."
				}
			},
			{
				"box": {
					"id": "pitchsig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						30.0,
						360.0,
						110.0,
						20.0
					],
					"text": "sig~ -0.5"
				}
			},
			{
				"box": {
					"id": "out",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"patching_rect": [
						320.0,
						470.0,
						112.0,
						20.0
					],
					"text": "plugout~"
				}
			},
			{
				"box": {
					"id": "init",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						200.0,
						415.0,
						90.0,
						20.0
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "reset",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						200.0,
						445.0,
						65.0,
						20.0
					],
					"text": "-0.5"
				}
			},
			{
				"box": {
					"id": "warning",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						535.0,
						940.0,
						18.0
					],
					"text": "Audio To: stereo Ext. Out 7/8. Left/right are independent DC CV, not audio. Keep fader 0 dB, no effects."
				}
			},
			{
				"box": {
					"id": "safety",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						570.0,
						950.0,
						18.0
					],
					"text": "VERIFY with multimeter before connecting: calibration from original patch. Gate HIGH = 5 V (assumed); all note values are clamped."
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"reset",
						0
					],
					"source": [
						"init",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"strip",
						1
					],
					"source": [
						"note",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"strip",
						0
					],
					"source": [
						"note",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchvolt",
						0
					],
					"source": [
						"pitchclip",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchsig",
						0
					],
					"source": [
						"pitchconvert",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"out",
						0
					],
					"source": [
						"pitchsig",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchconvert",
						0
					],
					"order": 1,
					"source": [
						"pitchvolt",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchmon",
						0
					],
					"order": 0,
					"source": [
						"pitchvolt",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchsig",
						0
					],
					"order": 1,
					"source": [
						"reset",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velsig",
						0
					],
					"order": 0,
					"source": [
						"reset",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pitchclip",
						0
					],
					"source": [
						"strip",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velclip",
						0
					],
					"source": [
						"strip",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velvolt",
						0
					],
					"source": [
						"velclip",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velsig",
						0
					],
					"source": [
						"velconvert",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"out",
						1
					],
					"source": [
						"velsig",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velconvert",
						0
					],
					"order": 1,
					"source": [
						"velvolt",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"velmon",
						0
					],
					"order": 0,
					"source": [
						"velvolt",
						0
					]
				}
			}
		],
		"latency": 0,
		"is_mpe": 0,
		"external_mpe_tuning_enabled": 0,
		"minimum_live_version": "",
		"minimum_max_version": "",
		"platform_compatibility": 0,
		"project": {
			"version": 1,
			"creationdate": 3590052838,
			"modificationdate": 3590052838,
			"viewrect": [
				25.0,
				107.0,
				300.0,
				500.0
			],
			"autoorganize": 1,
			"hideprojectwindow": 1,
			"showdependencies": 1,
			"autolocalize": 0,
			"contents": {
				"patchers": {}
			},
			"layout": {},
			"searchpath": {},
			"detailsvisible": 0,
			"amxdtype": 1768515945,
			"readonly": 0,
			"devpathtype": 0,
			"devpath": ".",
			"sortmode": 0,
			"viewmode": 0,
			"includepackages": 0
		},
		"autosave": 0,
		"saved_attribute_attributes": {
			"default_plcolor": {
				"expression": ""
			}
		},
		"oscreceiveudpport": 0
	}
}
