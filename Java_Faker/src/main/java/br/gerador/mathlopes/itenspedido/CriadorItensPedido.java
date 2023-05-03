package br.gerador.mathlopes.itenspedido;

import java.util.Locale;
import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CriadorItensPedido {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));
    public static void main(String[] args) {


        for (int i = 1; i < 301; i++){
            ItensPedido ip = new ItensPedido();
            ip.setId(i);
            ip.setPed_Id(i);
            ip.setProd_Id(i);

            ip.setQuantidade(faker.random().nextInt(1, 30));
            ip.setValor_Total(String.valueOf(faker.number().randomDouble(2,1,200)));

            String mysql = "INSERT INTO TB_ItensPedidos VALUES(" + ip.getId() + ", " + ip.getPed_Id() + ", " + ip.getProd_Id() + ", " + ip.getQuantidade() + ", '" + ip.getValor_Total() + "' );";
            log.info(mysql);
        }
/*
        for (int i = 1; i < 301; i++){
            String delete = "DELETE FROM TB_ItensPedidos WHERE Ped_Id = " + i +";";
            log.info(delete);
        }
*/
    }
}
