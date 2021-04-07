import json
import boto3

DYNAMODB = boto3.client("dynamodb")

def map_item(event_body):
    result = {}
    for key in event_body.keys():
        result[key] = {"S": event_body[key]}
    return result

def insere_registro(registros):
    result = [map_item(record) for record in registros]
    for registro in result:
        DYNAMODB.put_item(TableName="tabela_teste_terraform", Item=registro)

def batch_insere(batch_items):
    print("INSERINDO EM BATCH...")
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('tabela_teste_terraform')
    with table.batch_writer() as batch:
        for r in batch_items:
            try:
                batch.put_item(Item=r)
            except Exception as e:
                print(e)

def insert_into_dynamodb(event, context):
    print("LAMBDA INICIADO...")
    records = event["Records"]
    batch_items = [json.loads(record["body"]) for record in records]
    insere_registro(batch_items)
    # batch_insere(batch_items)
