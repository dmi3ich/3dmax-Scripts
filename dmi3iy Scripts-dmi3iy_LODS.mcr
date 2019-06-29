macroScript customAidemMedia_LODS
	ButtonText:"LOD"
	Category:"customAidemMedia" 
	internalCategory:"customAidemMedia" 
	Tooltip:"customAidemMedia - LODS" 
(
	
		try (destroyDialog :: LODS_creation) catch()
 
		d_width = 450
		d_height = 720
		
rollout LODS_creation "LODS Creation"
(
	
	local baseName =""
	local baseNameLODs =""
	local obj, obj_LOD0, obj_LOD1, obj_LOD2
	
	local obj_Name_LOD0, obj_Name_LOD1, obj_Name_LOD2
	
	local LOD1_currentTriCount, LOD2_currentTriCount
	
	local maxTriCount
	
	local maxPointsCount
	
	local triCount 
	local vertexCount 
	
	local moveMult
	
	local hideShowModeOrg=0
	local hideShowModeLODS = 0
	
	fn geomFilt objToFilt = classof objToFilt == Geometry
		
	
	
	
	

	group "Object Selection"
	(
		--pickbutton pickObject_geom "Pick Objects" width:240 --filter:geomFilt
		
	label instruction "Tip: Select Objects and press ''Pick Objects''" width:300 align:#left
		
		--edittext objName "Object Name" labelOnTop:true readonly:false width:425 offset:[0,0]

		multiListBox objToWork  items:#("[Select Objects and press ''Pick Objects'']")  hieght:20
		
		button pickObjects  "Pick Objects" width:100 across:4 align:#left
		button createPreviewLODS  "Create Preview LODS for all objects" offset:[15,0] width:190 align:#left
		button cre_sel_prevObj  "<" width:40 offset:[55,0]   align:#right
		button cre_sel_nextObj  ">" width:40 offset:[60,0]   align:#left
	)
	
		 
		
	
	group "LODS"
	(
		 radiobuttons LODs_creation_mode labels:#("Create and Update LODS", "Re-create LODS") align:#left
		
		checkbox LOD0_checkBox "LOD0" width:80  offset:[0,2] checked:true align:#left across:5
		spinner LOD0_percent "%" offset:[0,2] width:50 height:20 range:[0,100,100]  align:#left type:#integer 
		label LOD0_real_percent "100%" offset:[-18,2] width:40 height:20  align:#left
		spinner LOD0_triangles "Triangles" offset:[-35,2] width:160 height:20 range:[0,100000000,0]  align:#left type:#integer 
		label LOD0_real_triangles "" offset:[20,2] width:70 height:20  
		
	
		checkbox LOD1_checkBox  "LOD1" width:80 offset:[0,0] checked:true align:#left across:5
		spinner LOD1_percent "%" offset:[0,0] width:50 height:20 range:[0,100,50]  align:#left type:#integer
		label LOD1_real_percent "50%" offset:[-18,0] width:40 height:20  align:#left
		spinner LOD1_triangles "Triangles" offset:[-35,0] width:160 height:20 range:[0,100000000,0]  align:#left type:#integer 
		label LOD1_real_triangles "" offset:[20,0] width:70 height:20 
	
	
		checkbox LOD2_checkBox  "LOD2" width:80 offset:[0,0] checked:true align:#left across:5
		spinner LOD2_percent "%" offset:[0,0] width:50 height:20 range:[0,100,25]  align:#left type:#integer
		label LOD2_real_percent "25%" offset:[-18,0] width:40 height:20  align:#left
		spinner LOD2_triangles "Triangles" offset:[-35,0] width:160 height:20 range:[0,100000000,0]  align:#left type:#integer 
		label LOD2_real_triangles "" offset:[20,0] width:70 height:20
		)
	

	group "Preview LODs"
		(		
		checkbox ResetXFrom "Reset XFrom" width:120 offset:[0,0] checked:true align:#left across:2
		checkbox createLODSLayer "Create LODS layer" width:120 offset:[0,0] checked:true align:#left 
			
		checkbox pivotToMin "Pivot to Minimum" width:120 offset:[0,0] checked:true align:#left across:2
		checkbox createSeparateLODSLayer "Create separate layer for each LODs" width:220 offset:[0,0] checked:true align:#left 
				
			
			
		checkbox pivotToZero "Pivot to [0,0,0]" width:120 offset:[0,0] checked:true align:#left across:2
			
		spinner moveDistance "Distance between LODS % of width" offset:[0,0] width:100 height:20 range:[0,1000,200]  align:#left type:#integer 
			
		--button btn_previewLODs "Preview LODs" offset:[0,2]  width:160 height:22   --align:#left
		)
	
		


	group "Debug"
	(	
		
		checkbox debug_del_LOD0  "LOD0" width:50 offset:[0,2] checked:true align:#left across:5
		checkbox debug_del_LOD1  "LOD1" width:50 offset:[0,2] checked:true align:#left 
		checkbox debug_del_LOD2  "LOD2" width:50 offset:[0,2] checked:true align:#left 
		checkbox debug_del_LODS  "LODS" width:50 offset:[0,2] checked:true align:#left 
		
		button btn_debug_DeleteLODs "Delete LODs" offset:[0,0]  width:100 height:22  align:#right
		
		checkbox debug_del_Separate_Layers  "Delete Separate Layers" width:130 offset:[0,4] checked:true align:#left across:3
		checkbox debug_del_LODS_Layers  "Delete LODS Layer" width:120 offset:[0,4] checked:true align:#left 
		
		button btn_debug_DeleteLODSLayers "Delete Layers" offset:[0,2]  width:100 height:22  align:#right
		
		button btn_debug_hideShow_Org_Layers "Hide/Show original layer" offset:[0,2]  width:140 height:22 align:#left across:3
		
		button btn_debug_hideShow_LODs_Layers "Hide/Show LODS layer" offset:[20,2]  width:140 height:22
		
		
		button btn_undo "Undo" offset:[0,2]  width:100 height:22 align:#right
		
		
		--button btn_previewLODs "Preview LODs" offset:[0,12]  width:160 height:22  align:#left
	)	

		
		
	group "Final Creation of LODs"
	(	
		
		checkbox collapseToEditPoly "Collapse To EditPoly" width:120 offset:[0,2] checked:true align:#left across:2
		radiobuttons fin_creationMode labels:#("Create for all objects", "Create for selected objects") align:#left
		checkbox fin_excludeOpt "Exclude from list after creation" width:180 offset:[0,-18] checked:true align:#left
		button btn_createLODs "Create LODs" offset:[0,8]  width:160 height:22  align:#left across:2
		button btn_deleteLODS_Layers "Delete All LODS/ Layers" offset:[0,8]  width:160 height:22  align:#right

	)
	
	

	fn add_ProOptimize proOpt_obj proOpt_perc =
	(
	
		(
			
		select proOpt_obj
			
		ProOptimizeModCount=0
			
			if (proOpt_obj .modifiers.count >0) then
			(
			
				for i = 1 to proOpt_obj.modifiers.count do
				(	
					if (proOpt_obj.modifiers[i].name=="ProOptimizer") then
					(
						ProOptimizeModCount +=1
					)
				)	
			)
			
			
			if ProOptimizeModCount ==0 then
			(
				max modify mode
			addModifier proOpt_obj (ProOptimizer()) --ui:on
			
				
			--addModifier proOpt_obj (ProOptimizer()) ui:on
			proOpt_obj.modifiers[#ProOptimizer].OptimizationMode = 1
			proOpt_obj.modifiers[#ProOptimizer].SymmetryMode = 0
			proOpt_obj.modifiers[#ProOptimizer].KeepUV = true
			proOpt_obj.modifiers[#ProOptimizer].LockUV = true
			proOpt_obj.modifiers[#ProOptimizer].Calculate = on
			proOpt_obj.modifiers[#ProOptimizer].VertexPercent = proOpt_perc.value
			
			)
			
			else
			(
					proOpt_perc.value = proOpt_obj.modifiers[#ProOptimizer].VertexPercent  
				
			)
			
		)
		--catch( print "Error adding ProOptimizer modificator!")
	)
 
	
	fn fn_moveToLayer  fn_moveToLayer_layerName  fn_moveToLayer_obj =
	(
		undo on
		(
		
			try
			(
				
				layerName =  fn_moveToLayer_layerName
				
				targetLayer = LayerManager.getLayerFromName layerName
				
				if (targetLayer == undefined) then
				(
					targetLayer = LayerManager.newLayer()
					targetLayer.setname  fn_moveToLayer_layerName
				)
			
				targetLayer.addnode fn_moveToLayer_obj
				
			)
			catch(print "Propably, layer with same name already exists or something go wrong... :( Check it againe and try one more time :) ")
		
		)
	)
	
	fn fn_createLayer  cl_createLayer_layerName  =
	(
		undo on
		(
		
			try
			(
				
				layerName =  cl_createLayer_layerName
				
				targetLayer = LayerManager.getLayerFromName layerName
				
				if (targetLayer == undefined) then
				(
					targetLayer = LayerManager.newLayer()
					targetLayer.setname cl_createLayer_layerName
				)
			
				--targetLayer.addnode fn_createLayer_obj
				
			)
			catch(print "Propably, layer with same name already exists or something go wrong... :( Check it againe and try one more time :) ")
		
		)
	)
	
	fn setParentForLayers =
	(
		
		
		
		
		
	)
	
	fn fn_moveToMin mtm_obj =
	(
			CenterPivot mtm_obj
			m_2=mtm_obj.min			
			m=m_2[3]
			mtm_obj.pivot=[mtm_obj.pos[1],mtm_obj.pos[2],m]
		
	)
	
	fn moveObjASide objPos moa_obj =
	(
			
		
			bb_max = moa_obj.max
			bb_min = moa_obj.min
		
			ch_y = bb_max.y - bb_min.y
			ch_x = bb_max.x - bb_min.x
		
			if (ch_y<=ch_x) then moa_obj.pos.y= moa_obj.pos.y + ( (bb_max.y- bb_min.y) * moveMult )*objPos
		
			if (ch_y> ch_x) then moa_obj.pos.x= moa_obj.pos.x + ( (bb_max.x- bb_min.x) * moveMult )*objPos
		
	)
	
	
			
	fn fn_resetXForm rXF_obj = (
	
		arrayChildrens = #()
		allObjects = $*
		
		for tmpObj in allObjects do(

			if tmpObj.parent == rXF_obj then
			(
				append arrayChildrens tmpObj
				tmpObj.parent = undefined
			)
		)
	
		ResetXForm rXF_obj 
		convertTopoly rXF_obj
	
		for arrValue in arrayChildrens do(
		arrValue.parent = rXF_obj
		)
	
	)
	

	fn triangChange triCount =
	(
		LOD0_triangles.value = triCount
		LOD1_triangles.value = LOD0_triangles.value * LOD1_percent.value/ LOD0_percent.value  
		
		LOD1_real_triangles.text = LOD1_triangles.value  as string 
		
		LOD2_triangles.value = LOD0_triangles.value * LOD2_percent.value/ LOD0_percent.value
		
		LOD2_real_triangles.text = LOD2_triangles.value  as string 
		
	)
	
	
	fn triangCountUpdate spinerObj labelName LOD_obj =
	(
		spinerObj.value = LOD_obj.mesh.numfaces
		labelName.text = LOD_obj.mesh.numfaces as string
	
		
	)
	
	
	fn fn_hideShowLayer layerNameToHide hsl_mode =
	(
		
		sh_workingLayer = LayerManager.getLayerFromName layerNameToHide
		if (sh_workingLayer != undefined) then
		(
			sh_workingLayer.on = false
		)
		
		
		
		
	)
	
	
	fn fn_Prepare =(
		
		
		
		
		
		
		
	)
	
	fn fn_Start =(

	--btn_createLODs.enabled = false
		
		if (selection[1] == undefined) then
		(
		
			btn_Reset.enabled = true
			objName.text = "[Pick Object]"
			objName.readOnly = true
		
			
		)
		else
		(
		
		
				--objName.readOnly = false
			
				
			
				obj = selection[1]
			
				
				--pickObject_geom.text = obj.name
				baseName = obj.name
				--objName.text = obj.name
			
				baseNameLODs = baseName  + "_LODS"
				
			
				obj_Name_LOD0 = baseName  + "_LOD0"
				obj_Name_LOD1 = baseName  + "_LOD1"
				obj_Name_LOD2 = baseName  + "_LOD2"		
			
			
				
				triangChange  obj.mesh.numfaces
				
				maxTriCount = obj.mesh.numfaces
				
				LOD0_real_triangles.text = maxTriCount as string	
				
				moveMult = moveDistance.value /100
				
				
				
				
				
		)			
	
	)	
	

fn fn_delLayer dl_layerName =
(
	dl_layerToDelete = LayerManager.getLayerFromName dl_layerName
	if dl_layerToDelete != undefined then LayerManager.deleteLayerbyname dl_layerName
)

fn fn_hideUnhideLayer hu_layerName hu_mode=
(
	
	
	if hu_layerName !=undefined then
		hu_layerToUnhide = LayerManager.getLayerFromName hu_layerName
	
	
	if hu_layerToUnhide != undefined then 
	(
		case hu_mode of
		(
		0: hu_layerToUnhide.on = false
		
		1:	hu_layerToUnhide.on = true
		)
		
	)

	
		
	
	
)
	
fn fn_deleteAllDepences dad_source dad_mode=(
	
	
	
	dad_LOD0 = dad_source.name + "_LOD0" 
	dad_obj_LOD0 = getnodebyname dad_LOD0
	
	if (dad_obj_LOD0 != undefined) then delete dad_obj_LOD0 

	dad_LOD1 = dad_source.name + "_LOD1" 
	dad_obj_LOD1= getnodebyname dad_LOD1
	if (dad_obj_LOD1!= undefined) then delete dad_obj_LOD1

	dad_LOD2 = dad_source.name + "_LOD2" 
	dad_obj_LOD2= getnodebyname dad_LOD2
	if (dad_obj_LOD2 != undefined) then delete dad_obj_LOD2
	
	dad_LODS = dad_source.name + "_LODS" 
	dad_obj_LODS= getnodebyname dad_LODS
	if (dad_obj_LODS != undefined) then delete dad_obj_LODS

	if dad_mode ==1 then
	(
		dad_LODS = dad_source.name + "_LODS" 
		
		fn_delLayer  dad_LODS
		fn_delLayer  dad_LOD0
		fn_delLayer  dad_LOD1
		fn_delLayer  dad_LOD2
		
		fn_hideUnhideLayer dad_source.name 1

	)

	
)




	
fn fn_hideAllDepences had_source =(
	
	
	had_LOD0 = had_source.name + "_LOD0" 
	had_obj = getnodebyname had_LOD0
	
	if (had_obj != undefined) then hide had_obj 

	had_LOD1 = had_source.name + "_LOD1" 
	had_obj = getnodebyname had_LOD1
	if (had_obj != undefined) then hide had_obj 

	had_LOD2 = had_source.name + "_LOD2" 
	had_obj = getnodebyname had_LOD2
	if (had_obj != undefined) then hide had_obj 
	
	
	hide had_source 
	
)


fn fn_unhideAllDepences uad_source =(
	
	
	uad_LOD0 = uad_source.name + "_LOD0" 
	uad_obj = getnodebyname uad_LOD0
	
	if (uad_obj != undefined) then unhide uad_obj 

	uad_LOD1 = uad_source.name + "_LOD1" 
	uad_obj = getnodebyname uad_LOD1
	if (uad_obj != undefined) then unhide uad_obj 

	uad_LOD2 = uad_source.name + "_LOD2" 
	uad_obj = getnodebyname uad_LOD2
	if (uad_obj != undefined) then unhide uad_obj 
	
	
	--hide uad_source 
	
)


	
	
fn selectObject sl_nameObjToSelect =
(
		
	sl_tmp = getnodebyname sl_nameObjToSelect
	if (sl_tmp != undefined) then 
	(
		select sl_tmp
		return true
	)
	else
	(return false)
	
	
)

fn fn_findCurrentSelectionItemInListBox fcs_listBox=
(
	fcs_selObj = fcs_listBox.selection
	
	fcs_itemID =0
	fcs_findItemFlag = false
	
	
	
	do
	(
		fcs_itemID +=1
		
		if (fcs_selObj[fcs_itemID]) then
		(
			fcs_findItemFlag = true
		)
		
	)
	while (fcs_itemID < fcs_selObj.count ) and (fcs_findItemFlag != true)
	
	if (fcs_findItemFlag == false) then 
		fcs_itemID = 0
	
	return fcs_itemID
)



fn fn_listBoxHide lbh_listBox =
(
	
	lbh_allObjToWork_items =  #()
	lbh_allObjToWork_items =  lbh_listBox.items


	lbh_objToWork_currentSelectedObjectID  = fn_findCurrentSelectionItemInListBox lbh_listBox
	

	if (lbh_objToWork_currentSelectedObjectID > 0) then
	(
			for lbh_objCount=1 to lbh_allObjToWork_items.count do
			(
				
				if (lbh_objCount != lbh_objToWork_currentSelectedObjectID) then
				(
					lbh_objToHide = getnodebyname lbh_allObjToWork_items[lbh_objCount]
					fn_hideAllDepences lbh_objToHide
				)	
				
			)
	)
	
	lbh_objForSel =  lbh_listBox.items[lbh_objToWork_currentSelectedObjectID]
	
	lbh_currentSelectedObj = getnodebyname lbh_objForSel 
	fn_unhideAllDepences  lbh_currentSelectedObj 
	
)


fn fn_pickSelectedObjects =(
	
	selObjects = #()
	
	if (selection.count !=0) then
	(
	
	for i=1 to selection.count  do
			(
				selObjects[i] = selection[i].name
			)		
	objToWork.items = selObjects 
	objToWork.selection = 1		
			
		)
	else
	(
		
		objToWork.items = #("[Select Objects and press ''Pick Objects'']")
		
	)		
)


fn fn_checkForLODName objToCheck =
	(
	
				start_find=objToCheck.count-4
				
				lod_str =  substring objToCheck start_find 4
			
				if (lod_str == "_LOD") then
				(
					return true
				)
				else
				(
					return false
				)
		
			
			
	)
	
	
	fn createLOD cr_modeCreation cr_sourceObj =
	(
		
		cr_baseName = cr_sourceObj.name
		
		cr_baseNameLODs = cr_baseName + "_LODS"
		cr_obj_LOD0_name = cr_baseName + "_LOD0"
		cr_obj_LOD1_name = cr_baseName + "_LOD1"
		cr_obj_LOD2_name = cr_baseName + "_LOD2"
		
	
		--if ( cr_modeCreation ==1) then
		(
		
			if ( ResetXFrom.checked) then
				(
					fn_resetXForm cr_sourceObj
				)
				if ( pivotToMin.checked) then 
				(
					fn_moveToMin cr_sourceObj
				)
				if ( pivotToZero.checked) then
				(
					cr_sourceObj.pos=[0,0,0]
				)
				
			
			if (createLODSLayer.checked) then fn_createLayer cr_baseNameLODs
			
			fn_moveToLayer cr_baseName cr_sourceObj
		
		)
			
			
			
		triangChange  cr_sourceObj.mesh.numfaces
				
		maxTriCount = cr_sourceObj.mesh.numfaces
			
		LOD0_real_triangles.text = maxTriCount as string	
		
		moveMult = moveDistance.value /100
		
		
		cr_LODS_Dummy = getnodebyname cr_obj_LOD0_name
						
		if cr_LODS_Dummy == undefined then 
		(
			cr_LODS_Dummy = Dummy() 
			cr_LODS_Dummy.name = cr_baseNameLODs
							
		)
		
		cr_LODS_Dummy.pos = cr_sourceObj.pos
		
			
		if (LODs_creation_mode.state == 1) then
				(
					cr_obj_LOD0 = getnodebyname cr_obj_LOD0_name
						
					if cr_obj_LOD0 == undefined then 
						(
							cr_obj_LOD0 = copy cr_sourceObj
							cr_obj_LOD0.name = cr_obj_LOD0_name
							
							cr_obj_LOD0.parent = cr_LODS_Dummy	
							
						)
				)	
			
		if (LODs_creation_mode.state ==2) then
				(
					tmp_obj_LOD0 = getnodebyname cr_obj_LOD0_name
						
					if tmp_obj_LOD0 != undefined then 
						(
							select tmp_obj_LOD0
							delete tmp_obj_LOD0
						)
					
					cr_obj_LOD0 = copy cr_sourceObj
					cr_obj_LOD0.name = cr_obj_LOD0_name
						
					cr_obj_LOD0.parent = cr_LODS_Dummy	
						
				)
			
					select cr_obj_LOD0
					
		if (cr_modeCreation==2) then unhide cr_obj_LOD0 	
				
				
					add_ProOptimize cr_obj_LOD0 LOD0_percent
					
					obj_LOD0 = cr_obj_LOD0
					
				
					
				
					LOD0_triangles.value = cr_obj_LOD0.mesh.numfaces
					LOD0_real_triangles.text = LOD0_triangles.value as string
				
					maxTriCount = LOD0_triangles.value
					maxPointsCount = cr_obj_LOD0.mesh.numverts
						
					if (createSeparateLODSLayer.checked) then fn_moveToLayer cr_obj_LOD0.name cr_obj_LOD0
				
					if (createLODSLayer.checked) then 
					(
						LODSGroupLayer = LayerManager.getLayerFromName cr_baseNameLODs
						cr_obj_LOD0_Layer = LayerManager.getLayerFromName cr_obj_LOD0_name
						cr_obj_LOD0_Layer.setParent LODSGroupLayer 
					)
			
				
			
			
					
					
			if (LOD1_checkBox.checked) then
			(
				
				
				if (LODs_creation_mode.state == 1) then
				(
					cr_obj_LOD1 = getnodebyname cr_obj_LOD1_name
					

					if cr_obj_LOD1 == undefined then 
						(
							cr_obj_LOD1 = copy cr_sourceObj
							cr_obj_LOD1.name = cr_obj_LOD1_name
							
							cr_obj_LOD1.parent = cr_LODS_Dummy	
							
							moveObjASide 1 cr_obj_LOD1
						)
				
				)
				
				
				
				if (LODs_creation_mode.state ==2) then
				(
					tmp_obj_LOD1 = getnodebyname cr_obj_LOD1_name
						
					if tmp_obj_LOD1 != undefined then 
					(
						select tmp_obj_LOD1
						delete tmp_obj_LOD1
					)
					
					cr_obj_LOD1 = copy cr_sourceObj
					cr_obj_LOD1.name = cr_obj_LOD1_name
				
					cr_obj_LOD1.parent = cr_LODS_Dummy	
					
					moveObjASide 1 cr_obj_LOD1
				)
				
				select cr_obj_LOD1
				if (cr_modeCreation==2) then unhide cr_obj_LOD1 	
				
					add_ProOptimize cr_obj_LOD1 LOD1_percent
					
					obj_LOD1 = cr_obj_LOD1
				
					LOD1_triangles.value = cr_obj_LOD1.mesh.numfaces
					LOD1_real_triangles.text = LOD1_triangles.value as string
					LOD1_real_percent.text = (LOD1_triangles.value * 100 / maxTriCount ) as string + "%"
						
						
					if (createSeparateLODSLayer.checked) then fn_moveToLayer cr_obj_LOD1.name cr_obj_LOD1
					if (createLODSLayer.checked) then 
					(
						LODSGroupLayer = LayerManager.getLayerFromName cr_baseNameLODs
						cr_obj_LOD1_Layer = LayerManager.getLayerFromName cr_obj_LOD1_name
						cr_obj_LOD1_Layer.setParent LODSGroupLayer 
					)
				
			)
		
			
			
			
			
				
			if (LOD2_checkBox.checked) then
			(
				
				if (LODs_creation_mode.state == 1) then
				(
					cr_obj_LOD2 = getnodebyname cr_obj_LOD2_name
						
					if cr_obj_LOD2 == undefined then 
						(
							cr_obj_LOD2 = copy cr_sourceObj
							cr_obj_LOD2.name = cr_obj_LOD2_name
							
							moveObjASide 2 cr_obj_LOD2
						)
				)
				
				
				
				if (LODs_creation_mode.state ==2) then
				(
					tmp_obj_LOD2 = getnodebyname cr_obj_LOD2_name
						
					if tmp_obj_LOD2 != undefined then 
					(
						select tmp_obj_LOD2
						delete tmp_obj_LOD2
					)
					
					
					cr_obj_LOD2 = copy cr_sourceObj
					cr_obj_LOD2.name = cr_obj_LOD2_name
				
					moveObjASide 2 cr_obj_LOD2
					
				
				)
				
				select cr_obj_LOD2
				if (cr_modeCreation==2) then unhide cr_obj_LOD2 	

				add_ProOptimize cr_obj_LOD2 LOD2_percent
					
					obj_LOD2 = cr_obj_LOD2
				
					LOD2_triangles.value = cr_obj_LOD2.mesh.numfaces
					LOD2_real_triangles.text = LOD2_triangles.value as string
					LOD2_real_percent.text = (LOD2_triangles.value * 100 / maxTriCount ) as string + "%"
					
					if (createSeparateLODSLayer.checked) then fn_moveToLayer cr_obj_LOD2.name cr_obj_LOD2
					if (createLODSLayer.checked) then 
					(
						LODSGroupLayer = LayerManager.getLayerFromName cr_baseNameLODs
						cr_obj_LOD2_Layer = LayerManager.getLayerFromName cr_obj_LOD2_name
						cr_obj_LOD2_Layer.setParent LODSGroupLayer 
					)
				
			)
				
		
		fn_hideShowLayer cr_baseName 0
		if (cr_modeCreation==1) then fn_hideAllDepences cr_sourceObj
		--if (cr_modeCreation==1) then fn_hideAllDepences cr_sourceObj
	
	)
	

	





/*
createPreviewLODS  "Create Preview LODS for all objects" offset:[15,0] width:190 align:#left
		button cre_sel_prevObj  "<" width:40 offset:[55,0]   align:#right
		button cre_sel_nextObj  

*/


on createPreviewLODS pressed do
(
	
	cp_allObjToWork_items =  #()
	cp_allObjToWork_items =  objToWork.items

	print cp_allObjToWork_items[1]
	
	if (cp_allObjToWork_items[1] == "[Select Objects and press ''Pick Objects'']") then
	fn_pickSelectedObjects()
	
	cp_allObjToWork_items =  #()
	cp_allObjToWork_items =  objToWork.items
	
	if (cp_allObjToWork_items.count !=0) then
	(
		for cp_objCount=1 to cp_allObjToWork_items.count do
		(
				cp_objToWork = getnodebyname cp_allObjToWork_items[cp_objCount]
				
				if cp_objToWork  != undefined then
				(
					select cp_objToWork
					createLOD 1 cp_objToWork
				)
					
			
		)
	)


	objToWork.selection = 1
	cp_objToWork = getnodebyname cp_allObjToWork_items[1]
				
				if cp_objToWork  != undefined then
				(
					select cp_objToWork
					createLOD 2 cp_objToWork
				)
	
	
)


on cre_sel_prevObj pressed do
(
	
	nextItemID=0
	
	cre_itemSel =  objToWork.selection
	cre_itemCurrentSel = fn_findCurrentSelectionItemInListBox objToWork
	
	if cre_itemCurrentSel == 0 then nextItemID=1
	if cre_itemCurrentSel == 1 then nextItemID= cre_itemSel.count
	if cre_itemCurrentSel >= 2 then nextItemID = cre_itemCurrentSel  - 1
		
	newSel = #(nextItemID)

	objToWork.selection =newSel
	

	if (selectObject objToWork.items[nextItemID]) then
		(
			
			createLOD 2 selection[1]
			fn_listBoxHide objToWork
		)

	
)


on cre_sel_nextObj pressed do
(
	
	nextItemID=0
	
	cre_next_itemSel =  objToWork.selection
	cre_next_itemCurrentSel = fn_findCurrentSelectionItemInListBox objToWork
	
	if cre_next_itemCurrentSel == 0 then nextItemID=1
	if cre_next_itemCurrentSel == 1 then nextItemID= cre_next_itemSel.count
	if cre_next_itemCurrentSel >= 2 then nextItemID = cre_next_itemCurrentSel - 1
	
	if (cre_itemCurrentSel !=0) and (cre_next_itemCurrentSel != cre_next_itemSel.count) then nextItemID = cre_next_itemCurrentSel +1
	else nextItemID=1
	
	newSel = #(nextItemID)

	objToWork.selection =newSel
	
	
	
	if (selectObject objToWork.items[nextItemID]) then
		(
			
			createLOD 2 selection[1]
			fn_listBoxHide objToWork
	
		)
		
	
)



	
	
on pickObjects pressed do
(
	fn_pickSelectedObjects()
	
)

on objToWork doubleClicked  objToWork_currentObject  do
(
	
	baseName = objToWork.items[objToWork_currentObject]
	
	currentObjToWork = getnodebyname baseName
	if currentObjToWork != undefined then
	(	
		select currentObjToWork
		createLOD 2 currentObjToWork
	)	
	
	
	
	allObjToWork_items =  #()
	allObjToWork_items =  objToWork.items

	if (allObjToWork_items.count !=1) then
	(
		for otw_objCount=1 to allObjToWork_items.count do
		(
			
			if (otw_objCount !=objToWork_currentObject) then
			(
				objToHide = getnodebyname allObjToWork_items[otw_objCount]
				fn_hideAllDepences objToHide
			)	
			
		)
	)
	
	
	
)


	on LODs_creation_mode changed LODs_creation_mode_state do 
	(
		
		if ( (LODs_creation_mode_state == 1) or (LODs_creation_mode_state ==2))  then
		(
			LOD0_checkBox.enabled = true
			LOD1_checkBox.enabled = true
			LOD2_checkBox.enabled = true
			
			LOD0_percent.enabled  = true
			LOD1_percent.enabled  = true
			LOD2_percent.enabled  = true

			LOD0_triangles.enabled  = true
			LOD1_triangles.enabled  = true
			LOD2_triangles.enabled  = true
		)
		
		/*
		if LODs_creation_mode_state== 3 then
		(
			LOD0_checkBox.enabled = false
			LOD1_checkBox.enabled = false
			LOD2_checkBox.enabled = false
			
			
			LOD0_percent.enabled  = false
			LOD1_percent.enabled  = false
			LOD2_percent.enabled  = false

			LOD0_triangles.enabled  = false
			LOD1_triangles.enabled  = false
			LOD2_triangles.enabled  = false
		)
		*/
		
		
	)
	
	
	
	
	
 
	on btn_undo pressed do
	(
	
			max undo
		
	)
	
	

	on btn_debug_DeleteLODs  pressed do
	(
		
		undo on
			
		(
		
		
				curr_obj = baseName
				
				start_find=curr_obj.count-4
				
				lod_str =  substring curr_obj start_find 4
			
				if (lod_str == "_LOD") then
				(
					lastChar = start_find-1 
					baseName = substring curr_obj 1 lastChar
				)
				else
				(
					baseName = curr_obj 
				)

			--print baseName
			

				nm_LOD0 = baseName+"_LOD0"
				nm_LOD1 = baseName+"_LOD1"
				nm_LOD2 = baseName+"_LOD2"
				nm_LODS = baseName+"_LODS"
		
			
				if (debug_del_LOD0.checked) or (debug_del_LOD1.checked) or (debug_del_LOD2.checked) then
				(
					
					arr_to_del = #()
					baseObj = #()
					
						for search_obj in $* do	
						(
							if (search_obj.name == nm_LOD0) and (debug_del_LOD0.checked) then
							(
								append arr_to_del search_obj
							)
							
							if (search_obj.name == nm_LOD1) and (debug_del_LOD1.checked) then
							(
								append arr_to_del search_obj
							)
							
							if (search_obj.name == nm_LOD2) and (debug_del_LOD2.checked) then
							(
								append arr_to_del search_obj
							)
							
							if (search_obj.name == nm_LODS) and (debug_del_LODS.checked) then
							(
								append arr_to_del search_obj
							)
				
							
							if (search_obj.name == baseName ) then
							(
								
								append baseObj search_obj
							
							)
							
						)

						if (arr_to_del.count) !=0 then
						(
					--		print "Objects:" + arr_to_del + " ready to delete."
							select arr_to_del
							delete selection
							deselect
						--	print "Done"
						)
			
						select baseObj

						if (baseObj[1].isHidden) then 
						(
							unhide baseObj[1]
							
						)				
						
					
				)
	)

	undo On
		(
			
			try (
					fn_Start() )
					
			catch(print "Something go wrong ... :(")
			
			
			
			
		)	
			
		
	)

	
	on btn_debug_DeleteLODSLayers pressed do
	(
		
		if (debug_del_Separate_Layers.checked) then
		(
		
				(layermanager.getlayer 0).current = true
				
				layerToDelete = LayerManager.getLayerFromName obj_Name_LOD0
				if layerToDelete != undefined then LayerManager.deleteLayerbyname obj_Name_LOD0
				
				layerToDelete = LayerManager.getLayerFromName obj_Name_LOD1
				if layerToDelete != undefined then LayerManager.deleteLayerbyname obj_Name_LOD1
				
				layerToDelete = LayerManager.getLayerFromName obj_Name_LOD2
				if layerToDelete != undefined then LayerManager.deleteLayerbyname obj_Name_LOD2
		
		)
		
		if (debug_del_LODS_Layers.checked) then
		(
				(layermanager.getlayer 0).current = true
			
				layerToDelete = LayerManager.getLayerFromName baseNameLODs
				if layerToDelete != undefined then LayerManager.deleteLayerbyname baseNameLODs
			
			
		)
		
		
	)
	
	fn fn_createFinalLODS cL_objToCreate =
	(
		cL_baseName = cL_objToCreate.name
		
		cL_obj_LOD0_name = cL_baseName + "_LOD0"
		cL_obj_LOD1_name = cL_baseName + "_LOD1"
		cL_obj_LOD2_name = cL_baseName + "_LOD2"
		
		
		cLObj_pos = #(0,0,0)
		
				if (LOD0_checkBox.checked) then
				(
					if (collapseToEditPoly.checked) then
					(
						
						selectObject cL_obj_LOD0_name
						if (selectObject cL_obj_LOD0_name) then
						(
							ConvertToPoly selection[1]
							cLObj_pos = selection[1].pos
						)
							
							
					)
						
						
				)
				
		
				if (LOD1_checkBox.checked) then
				(
					if (collapseToEditPoly.checked) then
					(
						selectObject cL_obj_LOD1_name
						
						if (selectObject cL_obj_LOD1_name) then
						(
							ConvertToPoly selection[1]
							selection[1].pos = cLObj_pos
						)
					)
					
				)
		
				
				if (LOD2_checkBox.checked) then
				(
					if (collapseToEditPoly.checked) then
					(	
						selectObject cL_obj_LOD2_name
						
						if (selectObject cL_obj_LOD2_name) then
						(
							ConvertToPoly selection[1]
							selection[1].pos = cLObj_pos
						)
							
					)
					
				)		
			
			
			
	)
	
	
	on btn_createLODs pressed do
	(
		undo On
		(
			
		--	if () then
			
			
			
			
			(
				allObjToWork_items =  #()
				allObjToWork_items =  objToWork.items

					for otw_objCount=1 to allObjToWork_items.count do
					(
						LODObj = getnodebyname allObjToWork_items[otw_objCount]
						
						if LODObj != undefuned then fn_createFinalLODS LODObj
					
					)
			)
			
			
		)
	)
	
	
	/*
	on btn_Reset pressed do
	(
		
		undo On
		(
			try (
				
					if (selection[1] !=undefined) then
					(
						fn_Start() 
					)
					else
					(
							
							objName.text = "[Pick Object]"
							objName.readOnly = true
						
					)
					
				
				
				
				
				
				)
					
			catch(print "Something go wrong ... :(")
		)
	
		
	)
	*/

	
	
	/*------------- LODS % and Triangles ---------*/
	
	on  LOD0_percent changed LOD0_percent_value do
	(
		try(
			
			
			obj_LOD0.modifiers[#ProOptimizer].VertexPercent = LOD0_percent.value
			triangCountUpdate LOD0_triangles  LOD0_real_triangles obj_LOD0
			LOD0_real_percent.text = (LOD0_triangles.value * 100 / maxTriCount ) as string + "%"
			
			)
		catch(
			print "change by hand"
			--LOD0_triangles.value = LOD0_percent_value * maxTriCount /100
			
			)
	)
	
	on  LOD1_percent changed LOD1_percent_value do
	(
		try(
			obj_LOD1.modifiers[#ProOptimizer].VertexPercent = LOD1_percent.value
			triangCountUpdate LOD1_triangles  LOD1_real_triangles obj_LOD1
			LOD1_real_percent.text = (LOD1_triangles.value * 100 / maxTriCount ) as string + "%"
			
			
		)
		catch(
		
			LOD1_triangles.value = LOD1_percent_value * maxTriCount /100
			
			)
			
	)
	
	on  LOD2_percent changed LOD2_percent_value do
	(
		try(
			obj_LOD2.modifiers[#ProOptimizer].VertexPercent = LOD2_percent.value
			triangCountUpdate LOD2_triangles  LOD2_real_triangles obj_LOD2
			
			LOD2_real_percent.text = (LOD2_triangles.value * 100 / maxTriCount ) as string + "%"
			
		)
		catch(
		
			LOD2_triangles.value = LOD2_percent_value * maxTriCount /100
			
			)
	)
	
	
	
	on   LOD0_triangles  changed  LOD0_triangles_value do
	(
		
		if (LOD0_triangles_value > maxTriCount) then LOD0_triangles.value = maxTriCount
			
		LOD0_percent.value = LOD0_triangles_value * 100 /  maxTriCount
		obj_LOD0.modifiers[#ProOptimizer].VertexPercent = LOD0_percent.value

		triangCountUpdate LOD0_triangles LOD0_real_triangles obj_LOD0
		
		LOD0_real_percent.text = (LOD0_triangles.value * 100 / maxTriCount ) as string + "%"
		
	)


on   LOD1_triangles  changed  LOD1_triangles_value do
	(
		
		if (LOD1_triangles_value > maxTriCount) then LOD1_triangles.value = maxTriCount
			
		LOD1_percent.value = LOD1_triangles_value * 100 /  maxTriCount
		obj_LOD1.modifiers[#ProOptimizer].VertexPercent = LOD1_percent.value
		
		triangCountUpdate LOD1_triangles LOD1_real_triangles obj_LOD1
		
		LOD1_real_percent.text = (LOD1_triangles.value * 100 / maxTriCount ) as string + "%"
		
		--triangCountUpdate LOD1_triangles obj_LOD1
		
	/*	
		if (vertexCount == obj_LOD1.modifiers[#ProOptimizer].VertexCount) then
		LOD1_triangles.value = triCount 
		else 
		(
			vertexCount = obj_LOD1.modifiers[#ProOptimizer].VertexCount
			triCount = LOD1_triangles.value 
		)
		*/
		
	)
		
	
	
	on   LOD2_triangles  changed  LOD2_triangles_value do
	(
		
		/*triCount = LOD2_triangles.value
		vertexCount = obj_LOD2.modifiers[#ProOptimizer].VertexCount
		*/
		if (LOD2_triangles_value > maxTriCount) then LOD2_triangles.value = maxTriCount

		LOD2_percent.value = LOD2_triangles_value * 100 /  maxTriCount
		obj_LOD2.modifiers[#ProOptimizer].VertexPercent = LOD2_percent.value
		
		triangCountUpdate LOD2_triangles LOD2_real_triangles obj_LOD2
		
		LOD2_real_percent.text = (LOD2_triangles.value * 100 / maxTriCount ) as string + "%"
		
	/*	if (vertexCount == obj_LOD2.modifiers[#ProOptimizer].VertexCount) then
		LOD2_triangles.value = triCount 
	*/	
			
		

	)
	
	on   moveDistance  changed  moveDistance_value do
	(
		moveMult = moveDistance_value /100
	)
	
	
	
	
	on btn_deleteLODS_Layers pressed do
	(
	
		try
		(
			undo on
			
			(
		
				for dll_objCount=1 to objToWork.items.count do
					(
							dll_objToDelete = getnodebyname objToWork.items[dll_objCount]
							fn_deleteAllDepences  dll_objToDelete 1
							--fn_hideUnhideLayer dll_objToDelete.name 1
					
					)
			)
	
		)catch()	
			
	)

	
	
	
	on btn_debug_hideShow_Org_Layers pressed do
	(
		
		allObj = objects as array
		
		if hideShowModeOrg == 0 then (hideShowModeOrg =1)
		else hideShowModeOrg = 0
		
		for objID=1 to allObj.count do
		(
			objLayer = LayerManager.getLayerFromName allObj[objID].name
				
			if (objLayer != undefined) then
				(
		
						if (fn_checkForLODName allObj[objID].name == false) then
							(
								fn_hideUnhideLayer allObj[objID].name hideShowMode
								unhide allObj[objID] 
							)
								
				)
		)
		
	)
	
	on btn_debug_hideShow_LODs_Layers pressed do
	(
		
		allObj = objects as array
		
		if hideShowModeLODS == 0 then (hideShowModeLODS =1)
		else hideShowModeLODS = 0
		
		for objID=1 to allObj.count do
		(
			objLayer = LayerManager.getLayerFromName allObj[objID].name
				
			if (objLayer != undefined) then
				(
		
						if (fn_checkForLODName allObj[objID].name) then
							(
								fn_hideUnhideLayer allObj[objID].name hideShowModeLODS 
								unhide allObj[objID] 
							)
								
				)
		)
		
		
		
		
		
	)
	
	
	
	
	
	
	
	
	
	
	/* ------------------------------------------ */
	
	
	
	
	
	
	
	
	on LODS_creation open do
		(
			
			fn_pickSelectedObjects ()
			
		
		
				
		)	
	
		
		
	on LODS_creation close do
	(
		 
		
	
	)
	
	
)



 
createDialog LODS_creation width:d_width height:d_height pos:[360,145] --style:#(style_sunkenedge, #style_border)





)