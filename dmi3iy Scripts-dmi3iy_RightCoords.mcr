--Set "right ones" coordinats for selected vertex in object
macroScript dmi3iy_RightCoords
ButtonText:"RiCo"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - RightCoords" 
(
	
	widthForm =120
	heightForm =220

	rollout ExportRollout "Export Tools for Unity"
	(

		edittext xCoord "X" width:55 offset:[0,0]
		edittext yCoord "Y" width:55 offset:[0,0]
		edittext zCoord "Z" width:55 offset:[0,0]
		
		button doIt "Change" width:60 offset:[0, 16]
	

	
		
	fn ChangeCoords obj = (
		if (xCoord.text !="")	then obj.pos.x=xCoord.text as float
		if (yCoord.text !="") then obj.pos.y=yCoord.text as float
		if (zCoord.text !="")	 then obj.pos.z=zCoord.text as float
	)


	on doIt pressed do
		(
			print xCoord.text
			
			for vert in $.selectedVerts do 
			(
				ChangeCoords vert
			)
		)
		
		on ExportRollout open do
		(
			xCoord.text =""
			yCoord.text =""
			zCoord.text ="0"
		
		)
	
	
		)
			
		CreateDialog ExportRollout widthForm heightForm
		
)
