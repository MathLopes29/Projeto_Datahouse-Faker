package br.gerador.mathlopes.setor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Setor {

    private int Id;
    private String Setor;
    private int EstabId;
    private int FuncId;
    private String Nome;
    private String Operacao;
    private int Ativo;

}
