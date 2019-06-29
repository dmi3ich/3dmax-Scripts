--Add ResetXform modifier and rotate pivot of object for Unity
macroScript dmi3iy_UnityResetXform
ButtonText:"URxF"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - UnityResetXform" 
(
	
		
	fn fn_resetXForm obj = 
	(
		
		arrayChildrens = #()
		allObjects = $*
		for tmpObj in allObjects do
		(
			if tmpObj.parent == obj then
			(
				append arrayChildrens tmpObj
				tmpObj.parent = undefined
				
			)
		)

		ResetXForm obj 
		convertTopoly obj 


		tmp1 = inverse( obj.transform.rotation as quat)

		--prepare 90 degree X aixes rotation
		rotX = inverse( EulerAngles 0 -90 0 as quat)

		--change 
		in coordsys local obj.dir.z = 0

		tmp2 = inverse( obj.transform.rotation as quat)
		tmp3 = tmp2-tmp1

		obj.objectoffsetrot *= tmp3 
		obj.objectoffsetpos *= tmp3 

		coordsys local obj.rotation *= rotX
		obj.objectoffsetrot *= rotX
		obj.objectoffsetpos *= rotX

		for arrValue in arrayChildrens do
		(
			arrValue.parent = obj 
		)
	)
		
	undo on
	(
		for i=1 to selection.count do
			(	
				fn_resetXForm selection[i]
			)
	)

)