--Add Edit_poly() modifier, Collapse stack with respect to instances (save connection with instances if any are present)
macroScript dmi3iy_edPo
ButtonText:"edP"
Category:"dmi3iy Scripts"
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - edP" 
(
undo on 
	(	
		for i=1 to selection.count do
		(
			ep = Edit_Poly()
			if( isKindOf selection[i] GeometryClass )  then		
			(
				addModifier selection[i] ep
				maxops.CollapseNodeTo selection[i] 1 off
			)				
		)
	)
)
