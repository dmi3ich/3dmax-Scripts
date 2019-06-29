macroScript dmi3iy_spec

	ButtonText:"spc"
	Category:"dmi3iy Scripts" 
	internalCategory:"dmi3iy Scripts" 
	Tooltip:"dmi3iy - spec" 
(
	
fn copyProcess workMat = 
(
	
	if (workMat.diffuseMap != undefined) then
							(
		
								tmp_mat = copy workMat
								changeVal = false
								
								
								try(
									
								checkSpecLevelMap = workMat.specularLevelMap
								
								if (checkSpecLevelMap == undefined)  then
									--or (checkSpecLevelMap.MonoOutput != 1) or (d_map.RGBOutput != 1) or (d_map.coords.blur != 0) then
								(
									changeVal = true
								)
								
								
								)
								catch (print "Error in SpecLevelMap")
							
								
					
								if (tmp_mat.glossiness != 0) then 
								(
									tmp_mat.glossiness = 0
									changeVal = true
								)
								
								if (tmp_mat.specularLevel !=0) then 
								(
									tmp_mat.specularLevel = 0
									changeVal = true
								)
								if (tmp_mat.soften !=0) then 
								(
									tmp_mat.soften = 0
									changeVal = true
								)
								
								if (tmp_mat.specularLevelMapAmount !=100) then 
								(
									tmp_mat.specularLevelMapAmount =100	
									changeVal = true
								)
								
								
								
									
								
								if (changeVal) then 
								(
									d_map = tmp_mat.diffuseMap
									d_map.MonoOutput  = 1
									d_map.RGBOutput = 1
									d_map.coords.blur = 0
									
									workMat.specularLevelMap  = d_map
								)	
							)
							
							
							if (workMat.specularMap != undefined) then
							(workMat.specularMap = undefined)
	
							
							
							
	if (workMat.bumpMap != undefined) then
							(
								
								tmp_mat2 = copy workMat
							
								
									
								if (tmp_mat2.bumpMap.FileName !=undefined) then
								(
									b_map = tmp_mat2.bumpMap
									tmp_mat2.bumpMap = Normal_Bump()
									tmp_mat2.bumpMap.normal_map = b_map 
									workMat.bumpMap = tmp_mat2.bumpMap
								)
							)
		
	
	
	
	
	
)
	
undo on 
	(
		
		try(
			countVal = 1
			
			do 
			(
				/*
	viewNode = sme.GetView (sme.activeView)
	smeSelMats = #()
	for n = 1 to trackViewNodes[#sme][(sme.activeView)].numSubs do 
	(
		m = trackViewNodes[#sme][(sme.activeView)][n].reference 
		b = viewNode.GetNodeByRef m
		if b.selected and superclassof m == material do append smeSelMats m
	)
	
	print smeSelMats
				*/
				
				d = selection[countVal].material
		
				if (classof d == MultiMaterial ) then
				(
					
					for j=1 to d.count do
							(						
								copyProcess d[j]
							
							)
					
				)
				else
				(
					copyProcess d
				)
				
				
				
				
				countVal +=1	
			)
			
			while (countVal <= selection.count )
		) 
			
		catch true

	)
	
	
)
