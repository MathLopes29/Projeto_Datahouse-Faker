package br.gerador.mathlopes.pedido;

import java.util.Locale;
import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorPedido {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int x = 1; x < 301; x++) {
            var ped = new Pedido();
            ped.setId(x);
            ped.setClienteId(faker.number().numberBetween(1, 501));

            String mysql = "INSERT INTO TB_Pedido VALUES (" + ped.getId() + ", " + ped.getClienteId() + " );";
            log.info(mysql);
        }
    }
}
