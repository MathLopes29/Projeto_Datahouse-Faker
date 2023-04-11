package br.gerador.mathlopes.pedido;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Pedido {
    private int Id;
    private int ClienteId;
}
