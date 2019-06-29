macroScript dmi3iy_lods1

	ButtonText:"lods1"
	Category:"dmi3iy Scripts" 
	internalCategory:"dmi3iy Scripts" 
	Tooltip:"dmi3iy - lods1" 
(
	
		/*
	try (destroyDialog ::rol_ProOptimize) catch()
 
rollout rol_ProOptimize "Pro Optimize"
(
	group "Pro Optimize:"
	(
		button btn_ADD "ADD Pro Optimize" width:100 height:16 align:#left across:2
		spinner spn_tresh "Threshold:" width:110 height:20 range:[0,100,100] type:#integer --type:#float enabled:true
		button btn_Collapse "Colapse Selection To Editable Poly" width:225 height:20 
	)
 
	on spn_tresh changed val do
	(
		for obj in selection do
		(
			obj.modifiers[#ProOptimizer].VertexPercent = spn_tresh.value
		)
	)
 
	on btn_Collapse pressed do
	(
		for obj in selection do
		(
			--macros.run "Modifier Stack" "Convert_to_Poly"
		)
	)
 
	on btn_ADD pressed do
	(
		for obj in selection do
		(
			addModifier obj (ProOptimizer()) ui:on
			obj.modifiers[#ProOptimizer].OptimizationMode = 1
			obj.modifiers[#ProOptimizer].SymmetryMode = 0
			obj.modifiers[#ProOptimizer].KeepUV = true
			obj.modifiers[#ProOptimizer].LockUV = true
				
				
				
			--obj.modifiers[#ProOptimizer].Calculate = on
			--obj.modifiers[#ProOptimizer].VertexPercent = spn_tresh.value
		)
		
	)
)
 
createDialog rol_ProOptimize width:250 height:80 pos:[260,155]

*/


for obj in selection do
		(
			addModifier obj (ProOptimizer()) ui:on
			obj.modifiers[#ProOptimizer].OptimizationMode = 1
			obj.modifiers[#ProOptimizer].SymmetryMode = 0
			obj.modifiers[#ProOptimizer].KeepUV = true
			obj.modifiers[#ProOptimizer].LockUV = true
			obj.modifiers[#ProOptimizer].Calculate = on
			obj.modifiers[#ProOptimizer].VertexPercent = 50
				

)

)