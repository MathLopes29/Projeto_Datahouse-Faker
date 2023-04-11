package br.gerador.mathlopes.estoque;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Estoque {
    private int Id;
    private int Estab;
    private int Prod;
    private int Espaco;
    private String Data_Entrada;
    private String Data_Saida;

}
