package br.gerador.mathlopes.caixa;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

import java.util.Locale;

@Slf4j
public class CriadorCaixa {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 101; i++) {
            var C = new Caixa();
            C.setId(i);
            C.setFormaPagId(faker.number().numberBetween(1, 5));
            C.setStatus(faker.number().numberBetween(0, 2));

            String mysql = "INSERT INTO TB_Caixa VALUES ( " + C.getId() + ", " + C.getFormaPagId() + ", '" + " ', " + C.getStatus() + " );";
            log.info(mysql);

        }
    }
}
