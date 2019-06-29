--Move pivot in center of selected objects
macroScript dmi3iy_CenterPivot
ButtonText:"CnP"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - CntrPvt" 
(
	for i=1 to selection.count do
		(
			CenterPivot selection[i]
		)
)
