package br.gerador.mathlopes.fornecedor;

import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorFornecedor {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {
        for(int i = 0; i < 15; i++) {
            var F = new Fornecedor();
            F.setId(faker.random().nextInt(1, 16));
            F.setEst(faker.random().nextInt(1, 6));
            F.setCNPJ(faker.number().digits(14));
            F.setCPF(faker.number().digits(11));
            F.setNome(faker.name().fullName());
            F.setEnder(faker.address().fullAddress());
            F.setAtivo(faker.number().numberBetween(0, 3));

            String Mysql = "INSERT INTO TB_Fornecedor VALUES ( " + F.getId() + ", " + F.getEst() + ", " + F.getCNPJ() + ", " + F.getCPF() + ", '" + F.getNome() + "', '" + F.getEnder() + "', " + F.getAtivo() + " );";
            log.info(Mysql);
        }
    }
}
