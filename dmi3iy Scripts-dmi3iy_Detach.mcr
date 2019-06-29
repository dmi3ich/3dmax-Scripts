--Detach selected polygons/ elements in object to separate object
macroScript dmi3iy_Detach
ButtonText:"Det"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - Detach" 
(
	try(
		if (selection.count !=0) do
		(
			obj = selection[1]

			ele = polyop.getFaceSelection obj
			nameObj = obj.name	
			nameObj = uniquename nameObj

			polyop.detachFaces obj ele asNode:true name:nameObj
			
			deselect obj

			det_obj = getnodebyname nameObj
			if det_obj != undefined then det_obj.wirecolor = random black white
				
			print 'Deselcting of ' +nameObj+ 'done!'
			
		)
	)
	catch( print 'Something go wrong')
		
	--Select object after detach
	--select nameObj

)
