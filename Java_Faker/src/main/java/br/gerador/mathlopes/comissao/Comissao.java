package br.gerador.mathlopes.comissao;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comissao {

    private int Id;
    private int SetorId;
    private int CaixaId;
    private double Porcentagem;
}
