package br.gerador.mathlopes.funcionario;

import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorFuncionario {
    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 401; i++) {
            Funcionario F = new Funcionario();
            F.setId(i);
            F.setEstabId(faker.random().nextInt(1, 5));
            F.setNome(faker.name().fullName());
            F.setCPF(faker.number().digits(11));
            F.setCEP(faker.address().zipCode());
            F.setTelefone(faker.numerify("11#####-####"));

            String mysql = "INSERT INTO TB_Funcionario VALUES ( " + F.getId() + ", " + F.getEstabId() + ", '" + F.getNome() + "', " + F.getCPF() + ", " + F.getCEP() + ", " + F.getTelefone()  +" );";
            log.info(mysql);
        }

    }
}
