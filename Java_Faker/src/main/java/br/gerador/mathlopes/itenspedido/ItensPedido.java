package br.gerador.mathlopes.itenspedido;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ItensPedido {

    private int Id;
    private int Ped_Id;
    private int Prod_Id;
	private String Nome;
	private int Quantidade;
	private String Valor_Total;

}
