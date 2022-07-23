from faker import Faker

fake = Faker(['pt_BR'])

def factory_pessoa():

    return {
        "email": fake.email(),
        "nome": fake.name(),
    }