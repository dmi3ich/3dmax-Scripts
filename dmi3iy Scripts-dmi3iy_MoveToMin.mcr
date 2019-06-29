--Move pivot of selected objects in minimum
macroScript dmi3iy_MoveToMin
ButtonText:"MTM"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - MoveToMin" 
(
	for i=1 to selection.count do
		(	
			obj_sel=selection[i]
			CenterPivot obj_sel
			m_2=obj_sel.min			
			m=m_2[3]
			obj_sel.pivot=[obj_sel.pos[1],obj_sel.pos[2],m]
		)
)
