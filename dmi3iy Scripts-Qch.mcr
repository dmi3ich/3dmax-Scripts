--Add Quad_Chamfer() modifier with start values
macroScript Qch
ButtonText:"Qch"
Category:"dmi3iy Scripts" 
internalCategory:"dmi3iy Scripts" 
Tooltip:"dmi3iy - Qch" 
(
	Qch001 = Quad_Chamfer()
	Qch001.amount = 0.003
	modpanel.addmodtoselection Qch001
)