INSERT producao.avaliacao (sg_avaliacao, nm_avaliacao)
						  VALUES	
						  ('OK', 'Liberado')
						 ,('EL', 'Problema el�trico')
						 ,('PT', 'Problema de pintura')
						 ,('PE', 'Problema de estrutura')
						 ,('TR', 'Todo Rejeitado');

INSERT producao.tipo_produto (nm_tipo_produto)
							 VALUES
							 ('Geladeira')
							,('Máquina de lavar')
							,('Fogão')
							,('Freezer')
							,('Frigobar');