macroScript GunZ2SoundGeometry category:"GunZ2"
(
	-- ���õȰ� 1���� �־���Ѵ�.
	if selection.count > 0 then
	(
		-- ���� �̸��� �Է¹޴´�.
		out_name = getSaveFileName caption:"GunZ2 Sound Geometry FIle" types:"GunZ2 Sound Geometry (*sge)|*.sge|All Files (*.*)|*.*|"
		
		if (out_name != undefined ) then
		(
			-- ������ ����
			out_file = fopen out_name "wb"
			
			-- ��� ������(face) ������ ���� �����Ѵ�.
			num_faces = 0
			for i = 1 to selection.count do
			(
				tmesh = snapShotAsMesh selection[i]
				num_faces += tmesh.numfaces
			)		
			writeLong out_file num_faces
					
			-- ���õ� ��� �޽��� ������ ������ �����Ѵ�.
			for i = 1 to selection.count do
			(			
				tmesh = snapShotAsMesh selection[i]
				num_verts = tmesh.numverts
				num_faces = tmesh.numfaces
				
				for f = 1 to num_faces do
				(				
					face = getFace tmesh f
					
					v0 = getVert tmesh ((int)face.x)
					v1 = getVert tmesh ((int)face.y)
					v2 = getVert tmesh ((int)face.z)
					
					-- Max ��ǥ�� --> OpenGL ��ǥ��
					writeFloat out_file -v0.x
					writeFloat out_file v0.z
					writeFloat out_file v0.y
					writeFloat out_file -v1.x
					writeFloat out_file v1.z
					writeFloat out_file v1.y
					writeFloat out_file -v2.x
					writeFloat out_file v2.z
					writeFloat out_file v2.y
				)
							
				delete tmesh
			)
			
			-- �����ϰ� ��
			fclose out_file	
		)
	)
	else
	(
		messagebox "���õ� �޽ð� �����ϴ�"
	)
)