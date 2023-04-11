package br.gerador.mathlopes;

import java.util.Locale;

import com.github.javafaker.Faker;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Teste {

    private static final Faker faker = new Faker(Locale.forLanguageTag("pt-br"));

    public static void main(String[] args) {
        for (int i = 0; i < 500; i++){
            log.info("Id: {}", faker.random().nextInt(0, 500));
        }
        log.info(" ");

        for (int i = 0; i < 500; i++) {
            log.info(faker.name().fullName());
        }
        log.info(" ");

        for(int i = 0; i < 300; i++){
            log.info(faker.address().fullAddress());
        }
        log.info(" ");

        for (int i =0; i < 300; i++){
            log.info(faker.address().zipCode());
        }
        log.info(" ");

        /*

        Book livro = faker.book();

        log.info("Informacao do Livro {} {} {}", livro.author(), livro.title(), livro.publisher());

        for (int i = 0; i < 10; i++) {
            var starTrack = faker.starTrek();
            log.info("Personagem {}, localizacao {}, especie {}, vilão {}", starTrack.character(), starTrack.location(), starTrack.specie(), starTrack.villain());

        }

        */
    }

}
