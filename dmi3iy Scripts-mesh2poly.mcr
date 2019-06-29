--Convert Mesh to Poly and Weld all verticles
macroScript mesh2poly
ButtonText:"M2P"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - mesh2poly" 
(
	undo on
	(
		for i=1 to selection.count do
		(	
			if( isKindOf selection[i] GeometryClass )  then			
			(
				convertTopoly selection[i]
				setCommandPanelTaskMode #modify;
				subObjectLevel = 1
				actionMan.executeAction 0 "40021" -- Selection: Select All
				selection[i].weldThreshold = 0.01
				selection[i].EditablePoly.buttonOp #WeldSelected
				subObjectLevel = 0
				PolyToolsModeling.Quadrify false false	
			)
		)	
	)
)