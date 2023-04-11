package br.gerador.mathlopes.cliente;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Cliente {

    private int id;
    private String cpf;
    private String nome;
    private String sobrenome;
    private String email;
    private String telefone;
    private String cep;
    private String endereco;
    private String cidade;
    private String estado;
    private int ativo;
    //private String obs;
}
