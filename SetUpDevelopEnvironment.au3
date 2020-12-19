
Func setupZuluJDK()
	ShellExecute("Exefile\zulu11.41.23-ca-jdk11.0.8-win_x64.msi")

	WINWAITACTIVE("Zulu JDK 11.41 (11.0.8), 64-bit Setup","WixUI_Bmp_Dialog", 60)
	WinMove("Zulu JDK 11.41 (11.0.8), 64-bit Setup","WixUI_Bmp_Dialog", 0,0)
	Send("\n")

	WINWAITACTIVE("Zulu JDK 11.41 (11.0.8), 64-bit Setup","Destination Folder", 60)
	Send("\n")

	WINWAITACTIVE("Zulu JDK 11.41 (11.0.8), 64-bit Setup","Destination Folder", 60)
	Send("\n")

	MouseClick("LEFT", 338,358)

	WinWaitActive("Zulu JDK 11.41 (11.0.8), 64-bit Setup", "Completed the Zulu JDK 11.41 (11.0.8), 64-bit Setup Wizard", "50")
	MouseClick("LEFT", 338,358)
EndFunc

Func setupGit()
	Local $posX[22] = [1031, 1115, 1031, 1084, 1113, 1097, 1097, 1107, 1051, 1117, 1106, 1113, 1113 ,1078, 1104, 1116, 1116,1116,1098, 898, 896, 1073]
	Local $posY[22] = [ 593, 598,  593,  613,  612,  611,  611,  612,  594,  612,  611,  604,  604,  612,  618,  604,  612, 604, 593,  514, 493, 690]
	Local $texts[13];

	$texts[0] = "When you are ready to continue with Setup, click Next."
	$texts[1] = "To continue, click Next. If you would like to select a different folder, click Browse."
	$texts[2] = "Select the components you want to install; clear the components you do not want to install. Click Next when you are ready to continue."
	$texts[3] = "To continue, click Next. If you would like to select a different folder, click Browse."
	$texts[4] = "Choosing the default editor used by Git"
	$texts[5] = "Adjusting the name of the initial branch in new repositories"
	$texts[6] = "Adjusting your PATH environment"
	$texts[7] = "Choosing HTTPS transport backend"
	$texts[8] = "Configuring the line ending conversions"
	$texts[9] = "Configuring the terminal emulator to use with Git Bash"
	$texts[10] = "Choose the default behavior of `git pull`"
	$texts[11] = "Choose a credential helper"
	$texts[12] = "Configuring extra options"

	RUN("Exefile\Git-2.29.2.2-64-bit.exe")
	Sleep(1000)

	Local $hWnd = WinWait("[CLASS:#32770]", "확인", 5)

	if $hWnd <> 0 Then
		For $i=0 To 2
			MouseClick("LEFT", $posX[$i], $posY[$i])
		Next
	EndIf

	For $j = 0 To 12
		WinWaitActive("Git 2.29.2.2 Setup", $texts[$j], 60)
		Send("!n")
	Next

	MouseClick("LEFT", 1074,687)

	Local $hWnd = WinWait("[CLASS:#32770]", "확인", 50)

	For $i=3 To 21
		MouseClick("LEFT", $posX[$i], $posY[$i])
	Next


EndFunc

Func setupNetbeans()
	Run("Exefile\Apache-NetBeans-12.1-bin-windows-x64.exe")

	Sleep(10000)
	MouseClick("LEFT", 1120, 759)

	Sleep(1000)
	MouseClick("LEFT", 692, 712)
	MouseClick("LEFT", 1124, 760)

	Sleep(1000)
	MouseClick("LEFT", 1124, 760)

	Sleep(1000)
	MouseClick("LEFT", 1124, 760)
EndFunc

setupGit()

setupZuluJDK()

setupNetbeans()
