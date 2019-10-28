@echo off  
Set second_folder=F:\Test1
Set third_folder=F:\Test2

for /f "tokens=*" %%A in ('dir /b /a:d %second_folder%') do (

	for /f "tokens=*" %%B in ('dir /b /a:d %second_folder%\%%A') do (
	
		for /f "tokens=*" %%C in ('dir /b /a:d %second_folder%\%%A\%%B') do (
		
			for /f %%D IN ('dir %second_folder%\%%A\%%B\%%C /b') do (
			
				for /f "delims=\ tokens=3-5" %%f in ("%second_folder%\%%A\%%B\%%C\%%D") do (
				
					IF EXIST %second_folder%\%%A\%%B\%%C\%%D (
					
						IF EXIST %third_folder%\%%f-%%g-%%h (
						
							move %second_folder%\%%A\%%B\%%C\%%D %third_folder%\%%f-%%g-%%h\%%D
							
						)
						 
					) 				
				)
			)
		)  
	) 
)

@echo on

echo "image files have been translated successfully!"