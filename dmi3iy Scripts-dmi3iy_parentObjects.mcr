--Parenting selected objects to last selected object.
macroScript dmi3iy_parentObjects
ButtonText:"Prnt"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - parentObjects" 
(
	undo on 
	(
		try
		(
			obj1 = selection[selection.count]
			for i=1 to selection.count-1 do
			(
				if (obj1.parent == selection[i]) then
					(
						obj1.parent = undefined
					)
				selection[i].parent = obj1
			)
		)			
		catch true
	)
)