package br.gerador.mathlopes.formapag;
import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorFormaPag {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

       for(int i = 0; i < 4; i++){
        FormaPag pg = new FormaPag();

        pg.setId(faker.random().nextInt(1,4));
        /* Nome */
        /* Debito Crédito Transferencia */
        pg.setAtivo(faker.number().numberBetween(0, 2));

        String mysql = "INSERT INTO TB_FormaPag VALUES( " + pg.getId() + ", '" + "', " + " '" + "', " + pg.getAtivo() + " );";
        log.info(mysql);
       }
    }
}
