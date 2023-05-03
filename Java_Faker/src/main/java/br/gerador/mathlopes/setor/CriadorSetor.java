package br.gerador.mathlopes.setor;

import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorSetor {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 401; i++) {
            Setor s = new Setor();

            s.setId(i);
            s.setEstabId(faker.random().nextInt(1, 6));
            s.setFuncId(i);
            s.setOperacao(faker.company().profession());
            s.setAtivo(faker.random().nextInt(0, 2));

            String mysql = "INSERT INTO TB_Setor VALUES( " + s.getId() + ", '" + null +"', " + s.getFuncId() + ", " + s.getAtivo() + " );";
            log.info(mysql);
        }
    }
}
