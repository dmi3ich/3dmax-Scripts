macroScript dmi3iy_AttachSelected
ButtonText:"Att"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - AttachSelected" 
(
	undo off
  	(
  		while selection.count > 1 do
  		(
  			selcount = selection.count
  			for i = selcount to 2 by -2 do
  			(
  				polyop.attach selection[i] selection[i-1]
  			)
  		)
  		update selection[1]
	)
  	
)
