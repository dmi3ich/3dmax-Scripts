macroScript dmi3iy_AddSmooth
	ButtonText:"Smo"
	Category:"dmi3iy Scripts" 
	internalCategory:"dmi3iy Scripts" 
	Tooltip:"dmi3iy - AddSmooth" 
(
	
	fn addSmoothFn  objToAdd = (		
			addModifier obj1 (Unwrap_UVW ()	)
	)
	
	if (selection.count==1) then	
	(addSmoothFn selection[1])
	else 
	(for i=1 to selection.count do addSmoothFn selection[i])
		
)
