--Weld selected object's vertex
macroScript dmi3iy_weld
ButtonText:"wld"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - wld" 
(
	undo on 
	(
		obj1 = selection[1]
		ConvertToPoly obj1
		subobjectlevel = 1 
		v = polyop.getVertSelection obj1
		
		--set distance to Weld (1 unit = 1 unit in 3dmax)
		obj1.weldThreshold = 1
		polyop.weldVertsByThreshold obj1 v
	)
)
