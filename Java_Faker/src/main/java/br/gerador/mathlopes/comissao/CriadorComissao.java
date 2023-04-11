package br.gerador.mathlopes.comissao;

import java.util.Locale;
import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorComissao {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for (int i = 1; i < 101; i++){
            var co = new Comissao();

            co.setId(i);
            co.setSetorId(faker.number().numberBetween(1, 5));
            co.setCaixaId(i);
            co.setPorcentagem( faker.number().randomDouble(2, 0, 1));

            String mysql = "INSERT INTO TB_Comissao VALUES(" + co.getId() + ", " + co.getSetorId() + ", " + co.getCaixaId() + ", " + co.getPorcentagem() + " );";
            log.info(mysql);

        }
    }
}
