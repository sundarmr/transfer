This project will read through the tibco project
=================================================

1. Create xsl's for all activities in a directory named after the activity
2. create params for globalvariables in the xsl and also substitite the global params with the new param name
3. create a global cfg file with all the parameters available in the tibco project.

TO-DO 
==========
1. Replace tibco specific functions to normal xsl 
2. Generate a transition template ( skeleton outline in camel )
3. Generate xsd's for each of the activity input bindings based on the config

Care should be taken while using the project , it is not by anymeans a fool-proof work , but can help
to get the xsl's in more useable format and save you with copy paste and variable search troubles.


HOW - TO 
==========
Download the tibco project to your localdirectory


arg[0]=Path to the defaultVars Directory ( in the tibco project )
arg[1]=path to the cfg file that you want (path to the cfg file that you want to create )
arg[2]=path to the process files directory (in the tibco project )
arg[3]=path to the parent directory where you want the xsl directories ( xsl files that you want )


Sample converted documented under main/sample
=============================================

java ReadProcessFiles /Users/smunirat/Downloads/TMS_File_EU/defaultVars /Users/smunirat/Downloads/tmscamel/etc/  /Users/smunirat/Downloads/TMS_File_EU/Main /Users/smunirat/Downloads/tmscamel/
			