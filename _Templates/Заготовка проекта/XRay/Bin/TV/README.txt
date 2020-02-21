TeamViewer Portable
===================

CAVEAT: Using TeamViewer 4 Portable requires a TeamViewer Enterprise
	Concurrent or Premium license.

This is a complete TeamViewer supporter module that can be directly started
without installation (e.g. from an USB stick). Settings are not saved to
registry.

Please edit the file TeamViewer.ini file and replace the dummy license code in
the 'License' section with your Premium / Enterprise Concurrent license.

By setting writeconnectionlog=1 in the TeamViewer.ini file you can force TeamViewer 
to write a log file with detailed information about your connections. 
This log file is used by the TV Manager. 

By setting importsettings=1 you activate the automatic settings import. TeamViewer will 
import the settings from a file called tv.ini which has to be situated in the same 
directory as your TeamViewer.exe. You can create the tv.ini by exporting your settings 
in the advanced options of TeamViewer.

If you want to use TeamViewer Portable on Windows 98 you have to add the file
unicows.dll, which can be downloaded from http://www.teamviewer.com/download/unicows.dll, to the
same directory as your TeamViewer.exe.