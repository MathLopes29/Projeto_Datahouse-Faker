package br.gerador.mathlopes.fornecedor;

import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorFornecedor {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {
        for(int i = 1; i < 16; i++) {
            var F = new Fornecedor();
            F.setId(i);
            F.setEst(faker.random().nextInt(1, 6));
            F.setCNPJ(faker.numerify("1#############"));
            F.setCPF(faker.numerify("1##########"));
            F.setNome(faker.name().fullName());
            F.setEnder(faker.address().fullAddress());
            F.setAtivo(faker.number().numberBetween(0, 3));

            String Mysql = "INSERT INTO TB_Fornecedor VALUES ( " + F.getId() + ", " + F.getEst() + ", " + F.getCNPJ() + ", " + F.getCPF() + ", '" + F.getNome() + "', '" + F.getEnder() + "', " + F.getAtivo() + " );";
            log.info(Mysql);
        }
    }
}
