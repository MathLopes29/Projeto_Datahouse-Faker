package br.gerador.mathlopes.estoque;

import java.text.*;
import java.time.YearMonth;
import java.util.*;
import java.util.concurrent.TimeUnit;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorEstoque {
    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 16; i++){
            var e = new Estoque();
            e.setId(i);
            e.setEstab(faker.number().numberBetween(1,6));
            e.setEspaco(faker.number().numberBetween(1,501));

            String b = "" + faker.date().birthday();

            String Mysql = "INSERT INTO TB_Estoque VALUES ("+ e.getId() + ", " + e.getEstab() + ", " + e.getEspaco() + ");";
            log.info(Mysql);
        }
    }
}
