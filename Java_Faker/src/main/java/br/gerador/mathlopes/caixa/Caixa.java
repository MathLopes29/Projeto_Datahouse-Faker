package br.gerador.mathlopes.caixa;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Caixa {
    private int Id;
    private int FormaPagId;
    /* Data_Compra */
    private int Status;

}
