property theSavedValues : {"Mission Control", "Desktop", "Dashboard", "Launchpad"} -- for example

tell application "System Preferences"
	-- activate
	set current pane to pane id "com.apple.preference.expose"
	tell application "System Events"
		tell window "Mission Control" of process "System Preferences"
			click button "Активные углы…"
			tell sheet 1
				tell group 1
					set theCurrentValues to value of pop up buttons
					if theCurrentValues is {"-", "-", "-", "-"} then
						repeat with i from 1 to 4
							set thisValue to item i of theSavedValues
							tell pop up button i
								click
								click menu item thisValue of menu 1
							end tell
						end repeat
					else
						copy theCurrentValues to theSavedValues
						repeat with i from 1 to 4
							tell pop up button i
								click
								click last menu item of menu 1
							end tell
						end repeat
					end if
				end tell
				click button "ОК"
			end tell
		end tell
	end tell
	quit
end tell