import json
import boto3
import pandas as pd

sqs = boto3.resource('sqs')

def read_data(file_path):
    print("READING FILE...")
    df = pd.read_csv(file_path, delimiter="\t", header=None)
    df.columns = ["user_id", "item_id", "rating", "timestamp"]
    return df.head(1000)

def prepare_data(df):
    print("PREPARING DATA...")
    return [record for record in df.to_dict("records")]

def send_to_sqs(df):
    queue = sqs.get_queue_by_name(QueueName="MyQueue")
    my_records = prepare_data(df)

    for record in my_records:
        print("SENDING MESSAGE...")
        response = queue.send_message(MessageBody=json.dumps(record))

df = read_data("data/ml-100k/u.data")
send_to_sqs(df)