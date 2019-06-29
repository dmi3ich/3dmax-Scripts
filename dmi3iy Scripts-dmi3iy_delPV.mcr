--Avoid 3dmax bug with Particle_View in scene by deleting it
macroScript dmi3iy_delPV
ButtonText:"dePV"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - delPV" 
(
	fn delete_pflow =
 
	(
		array_of_names = #(Particle_View,PFEngine,PF_Source,RenderParticles,Event,Birth,DisplayParticles,ParticleGroup,Event,Birth_Script,ParticleGroup,DeleteParticles,Force,Keep_Apart,mapping,Material_Dynamic,Material_Frequency,Material_Static,Position_Icon,Position_Object,rotation,ScaleParticles,Script_Operator,ShapeStandard,Shape_Facing,Shape_Instance,Shape_Mark,speed,SpeedByIcon,Speed_By_Surface,spin,Age_Test,Collision,Collision_Spawn,Find_Target,Go_To_Rotation,Scale_Test,Script_Test,Send_Out,Spawn,Speed_Test,Split_Amount,Split_Selected,Split_Source,Cache,Notes,Render,Birth)
		
		for i in objects do 
			(
				if ((findItem array_of_names (classof i)) != 0) do
					(
					delete i
					)
			)
	)
 
 
	delete_pflow()
)