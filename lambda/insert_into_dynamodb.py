import json
import boto3

def map_item(event_body):
    result = {}
    for key in event_body.keys():
        result[key] = {"S": event_body[key]}
    return result

def insere_registro(registro):
    print(f"INSERINDO REGISTRO: {registro}")
    try:
        dynamodb = boto3.client("dynamodb")
    except Exception as e:
        print(e)
    try:
        print(dynamodb.put_item(TableName="tabela_teste_terraform", Item=registro))
        dynamodb.put_item(TableName="tabela_teste_terraform", Item=registro)
    except Exception as e:
        print("NÃO CONSEGUIU ADICIONAR O REGISTRO!")
        print(e)
    finally:
        print("INSERIU COM SUCESSO!")

def insert_into_dynamodb(event, context):
    print("LAMBDA INICIADO...")
    records = event["Records"]
    for record in records:
        print(f"RECORD: {record}")
        body_event = json.loads(record["body"])
        insere_registro(map_item(body_event))
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": "Finalizado com sucesso"
    }
