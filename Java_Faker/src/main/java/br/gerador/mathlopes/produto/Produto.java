package br.gerador.mathlopes.produto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Produto {

    private int Id;
    private int EstId;
    private String LoteCod;
    private int LoteQTDA;
    /* Data_DiaEntrada*/
    /* Data_HoraEntrada */
    /* Data_Saida */
    /* private Data Validade; */
    private String Tipo;
    private String Nome;
    private String ValorUnitario;
    private int Quantidade;

}
