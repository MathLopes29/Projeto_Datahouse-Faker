package br.gerador.mathlopes.produto;

import java.util.Locale;
import java.util.concurrent.TimeUnit;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorProduto {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {

        for (int i = 1; i < 301; i++) {
            Produto p = new Produto();

            p.setId(i);
            p.setEstId(faker.random().nextInt(1, 5));
            p.setLoteCod(faker.numerify("M#W#X##BR3"));
            p.setLoteQTDA(faker.number().numberBetween(1,30));
            p.setTipo(faker.commerce().department());
            p.setNome(faker.commerce().productName());
            p.setValorUnitario(String.valueOf(faker.number().randomDouble(2,0,200)));
            p.setQuantidade(faker.random().nextInt(0, 60));

            String mysql = "INSERT INTO TB_Produto VALUES (" + p.getId() + ", " + p.getEstId() + ", '" + p.getLoteCod() + "', " + p.getLoteQTDA() + ", " + p.getQuantidade() + ", " +"20230120, current_date(), current_time(), 20230620, '" + p.getTipo() + "', '" + p.getNome() + "', '" + p.getValorUnitario() + "' ); ";
            log.info(mysql);
        }
    }
}
