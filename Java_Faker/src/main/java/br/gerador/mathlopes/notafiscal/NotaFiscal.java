package br.gerador.mathlopes.notafiscal;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NotaFiscal {

    private int Id;
    private int Ped_Id;
    private int Cliente_Id;
    private int FormaPag_Id;
    /* DataFiscal */
}
