package br.gerador.mathlopes.cliente;

import java.util.Locale;
import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorCliente {
    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for(int i = 1; i < 501; i++) {
            var c = new Cliente();

            c.setId(i);
            c.setCpf(faker.number().digits(11));
            c.setNome(faker.name().firstName());
            c.setSobrenome(faker.name().lastName());
            c.setEmail(c.getNome() + faker.random().nextInt(1, 99) + "@gmail.com.br");
            c.setTelefone(faker.numerify("11#####-####"));
            c.setCep(faker.address().zipCode());
            c.setEndereco(faker.address().streetAddress());
            c.setCidade(faker.address().city());
            c.setEstado(faker.address().state());
            c.setAtivo(faker.number().numberBetween(0, 2));


            /* log.info("{}", cliente); */
            String Mysql = "INSERT INTO TB_Cliente VALUES ( " + c.getId() + ", " + c.getCpf() + ", '" + c.getNome() + " " + c.getSobrenome() + "', '" + c.getEmail() + "' ," + c.getTelefone() + " ," + c.getCep() + " ,'" + c.getEndereco() + "' ,'" + c.getEstado() + "', '" + c.getCidade() + "', " + c.getAtivo() + ", " + null + " );";
            log.info(Mysql);
        }
    }
}
