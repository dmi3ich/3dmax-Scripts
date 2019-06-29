--Move selected objects in [0,0,0]
macroScript dmi3iy_MoveToZero
ButtonText:"MT0"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - MoveToZero" 
(
	
	fn moveToZeroFn  objToMove = (
		objToMove.pos=[0,0,0]
	)
	
	if (selection.count==1) then	
		(moveToZeroFn selection[1])
	else 
	(
		for i=1 to selection.count do moveToZeroFn selection[i]
	)
		
)
