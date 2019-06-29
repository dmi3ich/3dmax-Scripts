--Create Dummy parent for selected objects in [0,0,0] with name of 1st selected object
macroScript dmi3iy_createDummyInObject
ButtonText:"DuO"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - createDummyInObject" 
(

fn PivotRotate obj = (

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

)
	undo on 
	(

			
 			if selection[1] !=undefined then 
			(
				obj1_name = selection[1].name
				obj1_coord_x = selection[1].pos[1] 
				obj1_coord_y = selection[1].pos[2]
				obj1_coord_z = selection[1].pos[3] 				
			)
				else 
			(
				obj1_name = "Dummy01"
				obj1_coord_x = 0
				obj1_coord_y = 0
				obj1_coord_z = 0
			)
				
			pt = dummy name:(obj1_name)
			pt.boxsize = [1, 1 ,1 ]
					
			pt.wirecolor = green
			pt.pos=[obj1_coord_x , obj1_coord_y, obj1_coord_z ]
	
			for i=1 to selection.count do
			(
				selection[i].parent = pt
			)
			
	)
)