import json
import boto3

def map_item(event_body):
    result = {}
    for key in event_body.keys():
        result[key] = {"S": event_body[key]}
    return result

def batch_insere(batch_items):
    print("INSERINDO EM BATCH...")
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('tabela_teste_terraform')
    with table.batch_writer() as batch:
        for r in batch_items:
            batch.put_item(Item=r)

def insert_into_dynamodb(event, context):
    print("LAMBDA INICIADO...")
    records = event["Records"]
    batch_items = [json.loads(record["body"]) for record in records]
    batch_insere(batch_items)
