--Add UnWrap modifier to selected object, open UVWEdit and select polygon mode
macroScript dmi3iy_UnM
ButtonText:"UnM"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - UnM" 
(
	undo on 
	(

		try
		(
			obj1 = selection[1]
			UnwrapModCount=0
			
			if (obj1.modifiers.count >0) then
			(
			
				for i = 1 to obj1.modifiers.count do
				(	
					if (obj1.modifiers[i].name=="Unwrap UVW") then
					(
						UnwrapModCount +=1
					)
				)	
			)
			
			if UnwrapModCount==0 then
			(addModifier obj1 (Unwrap_UVW ()	))

			gco = modPanel.getCurrentObject()		
					
			gco.edit()
			gco.unwrap.move()
			gco.unwrap2.setFreeFormMode on	
			subobjectlevel=3
			try
			(
				gco.unwrap.setCurrentMap 2 
			)
			catch true
			
			
		)catch (print "Select something..")
	)
)
