@echo off

Set first_folder=F:\Test1
Set second_folder=F:\Test2
Set third_folder=F:\Test3

for /f "tokens=*" %%A in ('dir /b /a:d %first_folder%') do (

	for /f "tokens=*" %%B in ('dir /b /a:d %first_folder%\%%A') do (
	
		for /f "tokens=*" %%C in ('dir /b /a:d %first_folder%\%%A\%%B') do (
		
			setlocal EnableDelayedExpansion
			
			for /f "delims= eol=" %%D in ('dir %first_folder%\%%A\%%B\%%C /b') do (
			
				for /f "delims=\ tokens=3-5" %%f in ("%first_folder%\%%A\%%B\%%C\%%D") do (
				
					IF EXIST %second_folder%\%%~nD.jpg (
					
						IF EXIST %third_folder%\%%f-%%g-%%h (
						
							move %second_folder%\%%~nD.jpg %third_folder%\%%f-%%g-%%h\%%~nD.jpg
							
						)
						 
					) 				
				)
			)
		)  
	) 
)

@echo on

echo "image files have been translated successfully!"