package br.gerador.mathlopes.notafiscal;

import java.util.Locale;

import br.gerador.mathlopes.pedido.Pedido;
import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorNotaFiscal {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 301; i++) {
            NotaFiscal nf = new NotaFiscal();

            nf.setId(i);
            nf.setPed_Id(i);
            nf.setCliente_Id(i);
            nf.setFormaPag_Id(faker.number().numberBetween(1, 5));

            String mysql = "INSERT INTO TB_NotaFiscal VALUES (" + nf.getId() + ", " + nf.getPed_Id() + ", " + nf.getCliente_Id() + ", " + nf.getFormaPag_Id() + ", " + null + " );";
            log.info(mysql);
        }
    }
}
