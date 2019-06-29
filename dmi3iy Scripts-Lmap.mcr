--Make custom unwrap of 2nd UVW map Lightmap channel (Unity, UE)
macroScript Lmap
ButtonText:"Lmap"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - Lmap" 
(
	undo on 
	(
		for i=1 to selection.count do
		(
			
			mUvMod = Unwrap_UVW()
			mUvMod.setApplyToWholeObject true
			mUvMod.setMapChannel 2
			addModifier selection[i] mUvMod
			mUvMod.flattenmap 45.0 #([1,0,0], [-1,0,0], [0,1,0], [0,-1,0], [0,0,1], [0,0,-1]) 0.03 true 0 true true
			mUvMod.edit() 
			mUvMod.setTVSubObjectMode 3
			mUvMod.selectInvertedFaces()
			mUvMod.detachEdgeVertices()
			mUvMod.mirrorH()
			
			--mUvMod.selectPolygons #()
			--mUvMod.pack 1 0.04 true true true
		
		)
	)
	
)