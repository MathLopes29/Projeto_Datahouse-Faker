package br.gerador.mathlopes.fornecedor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Fornecedor {

    private int Id;
    private int Est;
    private String CNPJ;
    private String CPF;
    private String Nome;
    private String Ender;
    private int Ativo;

}
