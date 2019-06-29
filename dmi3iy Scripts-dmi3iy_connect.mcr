--Add connect edge between 2 selected edges
macroScript dmi3iy_connect
ButtonText:"cnt"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - cnt" 
(
	undo on 
	(
		obj1 = selection[1]
		
		try
		(
		obj1.ButtonOp #ConnectEdges
		obj1.ButtonOp #ConnectVertices
		)			
		catch true
	)
)
