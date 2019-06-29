--Move pivots of selected objects in [0,0,0]
macroScript dmi3iy_PivotToZero
ButtonText:"PT0"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - PivotToZero" 
(
	for i=1 to selection.count do
		(	
			obj_sel=selection[i]
			obj_sel.pivot=[0,0,0]
		)
)
