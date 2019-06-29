--Reset Xform of selected objects
macroScript dmi3iy_ResetXform
ButtonText:"RtXF"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - RstXFrm" 
(

	/*
	Change log

	08.01.2018
		-minor bug fix
	
	20.12.2017
		-add parent check
	
	*/

	
	
	
	fn fn_resetXForm obj = 
	(
		undo on
		(		
			arrayChildrens = #()
			allObjects = $*
			
			for tmpObj in allObjects do
			(
				if tmpObj.parent == obj then
				(
					append arrayChildrens tmpObj
				)
			)

			objParent = undefined
			if obj.parent != undefined then objParent = obj.parent  			

			try (convertTopoly obj) catch ()	
			ResetXForm obj 
			maxOps.CollapseNodeTo obj 1 true 

			for arrValue in arrayChildrens do
			(
				arrValue.parent = obj 
			)
			
			if objParent != undefined then obj.parent = objParent 
		)
	)
	
	undo on
	(
		for i=1 to selection.count do 
		(	
			if classOf selection[i] != Dummy	then fn_resetXForm selection[i]
		)
	)

)
