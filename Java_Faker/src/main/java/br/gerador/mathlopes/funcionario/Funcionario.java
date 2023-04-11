package br.gerador.mathlopes.funcionario;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Funcionario {

    private int Id;
    private int EstabId;
    private String Nome;
    private String CPF;
    private String CEP;
    private String Telefone;
}
